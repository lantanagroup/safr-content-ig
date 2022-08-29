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

valueset "Admit Source": 'http://terminology.hl7.org/ValueSet/encounter-admit-source'
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Fidaxomicin, Vancomycin, and Metronidazole": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.79'
valueset "Lab Tests for Clostridioides difficile Infection": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.62'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'


code "body weight": '29463-7' from "LOINC" display 'Body Weight'
code "body height": '8302-2' from "LOINC" display 'Body Height'
code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief Complaint'
code "Discharge Diagnosis": 'DD' from "Diagnosis Role" display 'Discharge Diagnosis'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "stool": 'STL' from "Specimen Type" display 'stool'
code "vital-signs": 'vital-signs'  from "Observation Category" display 'vital-signs'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

define "Qualifying Encounter During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
union   [Encounter: "Emergency Department Visit"]
union [Encounter: "Observation Services"]) QualifyingEncounters
  where QualifyingEncounters .status = 'finished'
    and QualifyingEncounters.period ends during "Measurement Period"

define "Qualifying Location During Measurement Period":
  [Encounter] Encounters
    with Encounters.location EncounterLocation
    such that Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
     and start of EncounterLocation.period during "Measurement Period"
 
define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Qualifying Location During Measurement Period"

//============================
//Supplemental Data Element
//============================

define "SDE Encounter Locations":
	"Initial Population" InitialPopulation
  with InitialPopulation.location IntialPopulationLocation
  such that ((Global.GetLocation(IntialPopulationLocation.location).type in "Inpatient, Emergency, and Observation Locations"
    or Global.GetLocation(IntialPopulationLocation.location).physicalType in "Inpatient, Emergency, and Observation Locations")
    and IntialPopulationLocation.period during "Measurement Period")

define "SDE Encounter Locations Test":
	"Initial Population" InitialPopulation
  with InitialPopulation.location IntialPopulationLocation
  such that ((Global.GetLocation(IntialPopulationLocation.location).type in "Inpatient, Emergency, and Observation Locations"
    or Global.GetLocation(IntialPopulationLocation.location).physicalType in "Inpatient, Emergency, and Observation Locations")
    and IntialPopulationLocation.period during "Measurement Period")
  return Tuple{
    encounter: InitialPopulation,
    locationPeriodStart: InitialPopulation.location.period.start,
    locationPeriodEnd: InitialPopulation.location.period.end,
    locationType: GetLocations(InitialPopulation.location.location).type.coding.display
  } 

define "SDE Chief Complaint":
  "Initial Population" EncounterCC
    with EncounterCC.diagnosis diagnosis
    such that diagnosis.use ~ "Chief Complaint"
 
define "SDE Encounter with Discharge Diagnosis":
  "Initial Population" EncounterDD
    with EncounterDD.diagnosis diagnosis
    such that diagnosis.use ~ "Discharge Diagnosis"

define "SDE Encounter with Admit Source":
  "Initial Population" EncounterAdmitSource
  where EncounterAdmitSource.hospitalization.admitSource in "Admit Source" 

define "SDE Encounter with Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"

define "SDE Location":
  [Location] Location
  where exists("Initial Population")


define "SDE CDC Locations":
	[Location: type in "Inpatient, Emergency, and Observation Locations"] CDCLationLocation
   where exists("Initial Population")


define "SDE Observation CDI Stool":
  [Observation: "Lab Tests for Clostridioides difficile Infection"] CdiObservationLab
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(CdiObservationLab.effective) during InitialPopulation.period
      and CdiObservationLab.status ~ 'final'

define "SDE Laboratory Observation CDI Stool":
  [Observation: "Lab Tests for Clostridioides difficile Infection"] CdiObservationLab
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(CdiObservationLab.effective) during InitialPopulation.period
      and CdiObservationLab.status ~ 'final'
    with CdiObservationLab.category Category
    such that Category ~ "laboratory"

define "SDE Laboratory Observation CDI Stool 1":
  [Observation: "Lab Tests for Clostridioides difficile Infection"] Observations
    where (exists(Observations.category Category where Category ~ "laboratory"))
    and Global."Normalize Interval"(Observations.effective) during "Measurement Period"
    and Observations.status ~ 'final'
  
define "SDE Laboratory Observation CDI Stool with Specimen":
  "SDE Laboratory Observation CDI Stool" CdiObservationLab
    let ReferenceToSpecimen: GetSpecimen(CdiObservationLab.specimen)
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(ReferenceToSpecimen.collection.collected) during InitialPopulation.period
 
define "SDE Observation with CDI Specimen":
  [Observation: "Lab Tests for Clostridioides difficile Infection"] ObservationWithSpecimen
    let ReferenceToSpecimen: GetSpecimen(ObservationWithSpecimen.specimen)
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(ReferenceToSpecimen.collection.collected) during InitialPopulation.period
   
define "SDE Diagnostic Report Stool":
  [DiagnosticReport: "Lab Tests for Clostridioides difficile Infection"] CdiDiagnosticReportLab
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(CdiDiagnosticReportLab.effective) during InitialPopulation.period
      and CdiDiagnosticReportLab.status in {'final'}

define "SDE Body Weight Observation":
  [Observation: "body weight"] O
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(O.effective) during InitialPopulation.period
      and O.status in {'final'}
    with O.category category
    such that category ~"vital-signs"

define "SDE Body Height Observation":
  [Observation: "body height"] O
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(O.effective) during InitialPopulation.period
      and O.status in {'final'}
    with O.category category
    such that category ~"vital-signs"
    
define "SDE Condition":
  [Condition] Conditions 
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  and Conditions.clinicalStatus ~ Global."active"

define "SDE EncounterDiagnosis Condition":
  [Condition] ConditionEncounterDiagnosis
    where true in HasCategoryEncounterDiagnosis(ConditionEncounterDiagnosis.category)
    and exists("Initial Population")

define "SDE Specimen":
  [Specimen] Specimen
    with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(Specimen.collection.collected) during InitialPopulation.period

define "SDE CDI Specimen ":
  [Observation: "Lab Tests for Clostridioides difficile Infection"] ObservationWithSpecimen
    let ReferenceToSpecimen: GetSpecimen(ObservationWithSpecimen.specimen)
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(ReferenceToSpecimen.collection.collected) during InitialPopulation.period
    return ReferenceToSpecimen

/* do not want the generitic serviceRequest
define "SDE Service Request":
[ServiceRequest] CdiServiceRequestLab
  with "Initial Population" InitialPopulation
  such that (CdiServiceRequestLab.intent ~ 'order'
    and CdiServiceRequestLab.status ~ 'completed')
    and CdiServiceRequestLab.authoredOn during InitialPopulation.period
*/

define "SDE Service Request Clostridioides difficile Infection Lab":
	[ServiceRequest: "Lab Tests for Clostridioides difficile Infection"] CdiServiceRequestLab
  with "Initial Population" InitialPopulation
  such that (CdiServiceRequestLab.intent ~ 'order'
    and CdiServiceRequestLab.status ~ 'completed')
    and CdiServiceRequestLab.authoredOn during InitialPopulation.period

define "SDE Medication Request":
  [MedicationRequest] MedicationRequest
    with "Initial Population" InitialPopulation 
    such that Global."Normalize Interval"(MedicationRequest.authoredOn) during InitialPopulation.period
    //and MedicationRequest.status in {'active', 'completed'}

/* do not want to constrain the medication to CDI medication 
define "SDE Medication Request Fidaxomicin Vancomycin Metronidazole":
[MedicationRequest] MedicationRequestWithCode 
  with "Initial Population" InitialPopulation 
  such that Global."Normalize Interval"(MedicationRequestWithCode.authoredOn) during InitialPopulation.period
    and MedicationRequestWithCode.status in {'active', 'completed'}
    and GetMedicationCode(MedicationRequestWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole" 
*/

define "SDE Medication Administration":
[MedicationAdministration] MedicationAdministration
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministration.effective) during InitialPopulation.period
    //and MedicationAdministration.status in {'completed', 'in-progress'}

/* do not constrain to CDI medication
define "SDE Medication Administration Fidaxomicin, Vancomycin, and Metronidazole":
[MedicationAdministration] MedicationAdministrationWithCode
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministrationWithCode.effective) during InitialPopulation.period
    and MedicationAdministrationWithCode.status in {'completed', 'in-progress'}
    and GetMedicationCode(MedicationAdministrationWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole" 
*/

   
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
  return  type in "Inpatient, Emergency, and Observation Locations"