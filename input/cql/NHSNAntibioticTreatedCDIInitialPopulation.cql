library NHSNAntibioticTreatedCDIInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "LOINC": 'http://loinc.org'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "SNOMEDCT": 'http://snomed.info/sct'

//codesystem "NHSN Healthcare Facility Patient Care Location": 'https://www.cdc.gov/nhsn/cdaportal/terminology/codesystem/hsloc.html'

valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Fidaxomicin, Vancomycin, and Metronidazole": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.72'
valueset "Lab Tests for Clostridioides difficile Infection": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.62'

code "body weight": '29463-7' from "LOINC" display 'Body Weight'
code "body height": '8302-2' from "LOINC" display 'Body Height'
code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief Complaint'
code "Detected": '260373001' from "SNOMEDCT" display 'Detected'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "Positive": '10828004' from "SNOMEDCT" display 'Positive'
code "short stay": 'SS' from "ActCode" display 'short stay'
code "stool": 'STL' from "Specimen Type" display 'stool'
code "vital-signs": 'vital-signs'  from "Observation Category" display 'vital-signs'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

define "Initial Population":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "emergency", "observation encounter", "short stay"}] IPEnc
    where IPEnc.period overlaps "Measurement Period"

/*
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (Global.GetLocation(EncounterLocation.location).type in "CDC Location Codes"
    or Global.GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period */

define "SDE Encounter Locations":
	"Initial Population" InitialPopulation
  with InitialPopulation.location IntialPopulationLocation
  such that (Global.GetLocation(IntialPopulationLocation.location).type in "CDC Location Codes"
    or Global.GetLocation(IntialPopulationLocation.location).physicalType in "CDC Location Codes")
    and start of IntialPopulationLocation.period during InitialPopulation.period
  
define "SDE Encounter with Chief Complaint":
  "Initial Population" EncounterCC
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(EncounterCC.period) during InitialPopulation.period
    and EncounterCC.diagnosis.use.coding.code ~ {'Chief Complaint'}

define "SDE Encounter with Discharge Diagnosis":
  "Initial Population" EncounterDD
    with "Initial Population" InitialPopulation
    such that EncounterDD.diagnosis.use.coding.code ~ {'Discharge Diagnosis'}

//Encounter.hospitalization.admitSource ???

define "SDE Encounter Discharge Dispositions":
	[Encounter: hospitalization.dischargeDisposition in "Discharge Disposition"] DischargeDispositions 
  with "Initial Population" InitialPopulation
	such that start of DischargeDispositions.period during InitialPopulation.period
  
define "SDE Location":
  [Location] Location
  where exists("Initial Population")
  
define "SDE Observation Stool Lab":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] CdiObservationLab
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(CdiObservationLab.effective) during InitialPopulation.period
      and CdiObservationLab.status ~ 'final'
    with CdiObservationLab.category category
    such that category ~ "laboratory"

 
define "SDE CDI Specimen":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] ObservationWithSpecimen
    let ReferenceToSpecimen: GetSpecimen(ObservationWithSpecimen.specimen)
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(ReferenceToSpecimen.collection.collected) during InitialPopulation.period
    and FHIRHelpers.ToConcept(ObservationWithSpecimen.value ) in {"Positive", "Detected"}
    return ReferenceToSpecimen

define "SDE Positive or Detected CDI Specimen":
  "SDE CDI Specimen" CdiSpecimen
  where CdiSpecimen.type ~ "stool"

   
define "SDE Diagnostic Report Stool":
  [DiagnosticReport: code in "Lab Tests for Clostridioides difficile Infection"] CdiDiagnosticReportLab
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(CdiDiagnosticReportLab.effective) during InitialPopulation.period
      and CdiDiagnosticReportLab.status in {'final'}

define "SDE Observation Vital Signs":
  [Observation] ObservationVS
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(ObservationVS.effective) during InitialPopulation.period
      and ObservationVS.status in {'final'}
      and FHIRHelpers.ToConcept(ObservationVS.code) in {"body weight", "body height"}
    with ObservationVS.category category
    such that category ~"vital-signs"

define "SDE Condition":
  [Condition] Conditions 
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  and Conditions.clinicalStatus ~ Global."active"

define "SDE Condition during Encounter":
  [Condition] ConditionEncounterDiagnosis
    where true in HasCategoryEncounterDiagnosis(ConditionEncounterDiagnosis.category)
    and exists("Initial Population")

define "SDE Specimen Stool":
  [Specimen] Specimen
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(Specimen.collection.collected) during InitialPopulation.period

define "SDE Service Request Clostridioides difficile Infection Lab":
	[ServiceRequest: code in "Lab Tests for Clostridioides difficile Infection"] CdiServiceRequestLab
  with "Initial Population" InitialPopulation
  such that (CdiServiceRequestLab.intent ~ 'order'
    and CdiServiceRequestLab.status ~ 'completed')
    and start of Global."Normalize Interval"(CdiServiceRequestLab.occurrence) during InitialPopulation.period

define "SDE Medication Request":
  [MedicationRequest] MedicationRequest
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(MedicationRequest.authoredOn) during InitialPopulation.period
    and MedicationRequest.status in {'active', 'completed'}

define "SDE Medication Request Fidaxomicin Vancomycin Metronidazole":
[MedicationRequest] MedicationRequestWithCode 
  with "Initial Population" InitialPopulation 
  such that Global."Normalize Interval"(MedicationRequestWithCode.authoredOn) during InitialPopulation.period
    and MedicationRequestWithCode.status in {'active', 'completed'}
    and GetMedicationCode(MedicationRequestWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole"


define "SDE Medication Administration":
[MedicationAdministration] MedicationAdministration
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministration.effective) during InitialPopulation.period
    and MedicationAdministration.status in {'completed', 'in-progress'}


define "SDE Medication Administration Fidaxomicin, Vancomycin, and Metronidazole":
[MedicationAdministration] MedicationAdministrationWithCode
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministrationWithCode.effective) during InitialPopulation.period
    and MedicationAdministrationWithCode.status in {'completed', 'in-progress'}
    and GetMedicationCode(MedicationAdministrationWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole"
   

define "SDE Payer": 
	SDE."SDE Payer" Payer
  with "Initial Population" InitialPopulation
  such that start of Payer.period before end of InitialPopulation.period


//-----------------------------------------------------------------
// functions
//-----------------------------------------------------------------
define function GetCodeConcepts(CodeConcepts List<CodeableConcept>):
  CodeConcepts inCodeableConcept
  return  FHIRHelpers.ToConcept(inCodeableConcept)

define function "GetLocations"(references List<Reference>):
  references reference
  return Global.GetLocation(reference)

define function "GetLocationsType"(references List<Reference>):
  references reference
  return Global.GetLocation(reference).type


define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication] M where M.id = Global.GetId(reference.reference)
  )

define function "GetMedications"(references List<Reference> ):
  references reference
  return GetMedication(reference)

define function "GetSpecimen"(reference Reference):
  singleton from (
    [Specimen] S where S.id = Global.GetId(reference.reference)
  )

define function "GetMedicationCode"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.CodeableConcept then 
      choice as FHIR.CodeableConcept
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference).code
    else 
      null as FHIR.CodeableConcept
  end

define function "HasCategoryLaboratory"(categories List<FHIR.CodeableConcept>):
  categories category
  return category ~ "laboratory"

define function "HasCategoryVitalSigns"(categories List<FHIR.CodeableConcept>):
  categories category
  return category ~ "vital-signs"

define function "HasCategoryEncounterDiagnosis"(categories List<FHIR.CodeableConcept>):
  categories category
  return category ~ "encounter-diagnosis"

define function "HasCdcLocationType"(types List<FHIR.CodeableConcept>):
  types type
  return  type in "CDC Location Codes"