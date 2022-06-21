library NHSNAntibioticTreatedCDIInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "LOINC": 'http://loinc.org'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category'

valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'

valueset "Fidaxomicin, Vancomycin, and Metronidazole": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.72'
valueset "Lab Tests for Clostridioides difficile Infection": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.62'

code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "vital-signs": 'vital-signs'  from "Observation Category" display 'vital-signs'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'

code "body weight": '29463-7' from "LOINC" display 'Body Weight'
code "body height": '8302-2' from "LOINC" display 'Body Weight'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

//CDI initial Patient Population: All inpatient, ED, and Observation encounters and short stay during the Measurement Period
//Encounter.hospitalization.dischargeDisposition:CodeableConcept 0..1 no SDE need for this
//Encounter.diagnosis.use:CodeableConcept 0..1 no SDE need for this

define "Initial Population":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "emergency", "observation encounter", "short stay"}] IPEnc
    where IPEnc.period overlaps "Measurement Period"

//Encounter.location.location:Reference(Location) Location.type indicate type of function performed at the location
//Encounter.location.physicalType is the physical type of the location (usually the level in location hierachy)
//For CDI measure, we want to identify the function performed at the location, such as impatient location
//Each facility may have a map between CDC Location type to facility location, need to see how this play out in CoLab
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (GetLocation(EncounterLocation.location).type in "CDC Location Codes") 
      //or GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
    //and Encounter.period during "Measurement Period"
    //return Encounter.location EncLoc
    //let RefLoc: GetLocation(EncLoc.location)
    //return Tuple{
    //  locationType: GetCodeConcepts(RefLoc.type),
    //  period: FHIRHelpers.ToInterval(EncLoc.period)
    //}

define "SDE Encounter with Chief Complaint":
  [Encounter] EncounterCC
    with "Initial Population" IP
    such that Global."Normalize Interval"(EncounterCC.period) during IP.period
      and EncounterCC.diagnosis.use.coding.code ~ {'Chief Complaint'}

   
//Encounter.hospitalization.origin:Reference(Location) 0..1 patient came before admission
//Encounter.hospitalization.destination:Reference(Location) 0..1 Location which patient discharged to
//Encounter.location.location:Reference(Location) 1..1 Location the encounter taskes place
define "SDE Location":
  [Location] Location
  where exists("Initial Population")

//add Observation.category in the condition for meeting requirement for EHR
define "SDE Observation Stool Lab":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] ObservationLab
    with "Initial Population" IP
    such that Global."Normalize Interval"(ObservationLab.effective) during IP.period
      and ObservationLab.status in {'final', 'amended', 'corrected', 'preliminary'}
      and  true in HasCategoryLaboratory(ObservationLab.category)

//for the Observation has Specimen reference, this may not need if we have the Specimen Resource
define "SDE Observation Lab With Specimen":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] ObservationWithSpecimen
    let ReferenceToSpecimen: GetSpecimen(ObservationWithSpecimen.specimen)
    with "Initial Population" IP 
    such that Global."Normalize Interval"(ReferenceToSpecimen.collection.collected) during IP.period
    return ReferenceToSpecimen

//DiagnosticReport.result:Reference(Observation) 0..* the result is in the Observation
define "SDE Diagnostic Report Stool":
  [DiagnosticReport: code in "Lab Tests for Clostridioides difficile Infection"] DiagnosticReportLab
    with "Initial Population" IP
    such that Global."Normalize Interval"(DiagnosticReportLab.effective) during IP.period
      and DiagnosticReportLab.status in {'final', 'amended', 'corrected', 'preliminary'}

define "SDE Observation Vital Signs":
  [Observation] ObservationVS
    with "Initial Population" IP 
    such that Global."Normalize Interval"(ObservationVS.effective) during IP.period
      //and ObservationVS.status in {'final', 'amended', 'corrected', 'preliminary'}
      and FHIRHelpers.ToConcept(ObservationVS.code) in {"body weight", "body height"}
      //and GetCodeConcepts(ObservationVS.category) ~ {"vital-signs"}
      and true in HasCategoryVitalSigns(ObservationVS.category)

//for now just for the encounter-diagnosis
//data requirement constrain to category levle not to code level 
//not sure we should check the Condtion.onset
//need to check during evaluate-measure to see it filter out the observation other than encounter-diagnosis?????
define "SDE Condition during Encounter Diagnosis":
  [Condition] ConditionEncounterDiagnosis
    where true in HasCategoryEncounterDiagnosis(ConditionEncounterDiagnosis.category)
    and exists("Initial Population")

define "SDE Specimen Stool":
  [Specimen] Specimen
    with "Initial Population" IP
    such that Global."Normalize Interval"(Specimen.collection.collected) during IP.period

//Lab orders
define "SDE Service Request Clostridioides difficile Infection Lab":
	[ServiceRequest: code in "Lab Tests for Clostridioides difficile Infection"] ServiceRequestLab
  with "Initial Population" InitialPopulation
  such that (ServiceRequestLab.intent ~ 'order'
    and ServiceRequestLab.status ~ 'completed')
    and start of Global."Normalize Interval"(ServiceRequestLab.occurrence) during InitialPopulation.period

define "SDE Medication Request":
  [MedicationRequest] MedicationRequest
    with "Initial Population" IP 
    such that Global."Normalize Interval"(MedicationRequest.authoredOn) during IP.period
    and MedicationRequest.status in {'active', 'completed'}

define "SDE Medication Request Fidaxomicin Vancomycin Metronidazole":
[MedicationRequest] MedicationRequestWithCode 
  with "Initial Population" IP 
  such that Global."Normalize Interval"(MedicationRequestWithCode.authoredOn) during IP.period
    and MedicationRequestWithCode.status in {'active', 'completed'}
    and GetMedicationCode(MedicationRequestWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole"


define "SDE Medication Administration":
[MedicationAdministration] MedicationAdministration
  with "Initial Population" IP
  such that Global."Normalize Interval"(MedicationAdministration.effective) during IP.period
    and MedicationAdministration.status in {'completed', 'in-progress'}


define "SDE Medication Administration Fidaxomicin, Vancomycin, and Metronidazole":
[MedicationAdministration] MedicationAdministrationWithCode
  with "Initial Population" IP
  such that Global."Normalize Interval"(MedicationAdministrationWithCode.effective) during IP.period
    and MedicationAdministrationWithCode.status in {'completed', 'in-progress'}
    and GetMedicationCode(MedicationAdministrationWithCode.medication) in "Fidaxomicin, Vancomycin, and Metronidazole"
   

//define "SDE Claim":
//[Claim] Cla 
//where exists("Initial Population")

//Claim.insurance.coverage:Reference(Coverage)
//MedicationRequest.insurance:Reference(Coverage) 0..*
//ServiceRequest.insurance:Reference(Coverage) 0..*
//define "SDE Coverage":
//[Coverage] Cov 
//where exists("Initial Population")

//define "SDE ExplanationOfBenefit":
//[ExplanationOfBenefit] Exp 
//where exists("Initial Population")


//-----------------------------------------------------------------
// functions
//-----------------------------------------------------------------
define function GetCodeConcepts(CodeConcepts List<CodeableConcept>):
  CodeConcepts inCodeableConcept
  return  FHIRHelpers.ToConcept(inCodeableConcept)

//Returns the tail of the given uri (i.e. everything after the last slash in the URI).
define function "GetId"(uri String ):
  Last(Split(uri, '/'))

//Returns the Location resource specified by the given reference
define function "GetLocation"(reference Reference ):
  singleton from (
    [Location] L where L.id = GetId(reference.reference)
  )

define function "GetLocations"(references List<Reference>):
  references reference
  return GetLocation(reference)


define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication] M where M.id = GetId(reference.reference)
  )

define function "GetMedications"(references List<Reference> ):
  references reference
  return GetMedication(reference)

define function "GetSpecimen"(reference Reference):
  singleton from (
    [Specimen] S where S.id = GetId(reference.reference)
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