library NHSNHospitalonsetBacteremiaInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "LOINC": 'http://loinc.org'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm' codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'codesystem "SNOMEDCT": 'http://snomed.info/sct'

code "body weight": '29463-7' from "LOINC" display 'Body Weight'
code "body height": '8302-2' from "LOINC" display 'Body Height'
code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief Complaint'
code "Discharge Diagnosis": 'DD' from "Diagnosis Role" display 'Discharge Diagnosis'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'
code "vital-signs": 'vital-signs' from "Observation Category" display 'vital-signs'

valueset "Admit Source": 'http://terminology.hl7.org/ValueSet/encounter-admit-source'
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Bacterial and Fungal Blood Culture Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.63'
valueset "Antibacterial Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.64'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'

parameter "Measurement Period" default Interval[@2022-01-01T00:00:00.0, @2022-01-31T00:00:00.0)

define "Qualifying Encounter during Measurement Period":
    ([Encounter: "Encounter Inpatient"]
    union [Encounter: "Emergency Department Visit"]
    union [Encounter: "Observation Services"]
    union [Encounter: class in {"emergency", "inpatient acute", "inpatient encounter", "inpatient non-acute", "short stay"}]) Encounters
    where Encounters.status in {'finished', 'in-progress'}
    and Encounters.period ends during "Measurement Period" 

define "Qualifying Location during Measurement Period":
    [Encounter] Encounters
    where exists (
        Encounters.location InitialPopulationLocation
        where Global.GetLocation(InitialPopulationLocation.location).type in "Inpatient, Emergency, and Observation Locations"
        and InitialPopulationLocation.period during "Measurement Period"
    )

define "Initial Population":
    "Qualifying Encounter during Measurement Period"
    union "Qualifying Location during Measurement Period"


//Supplmental Data Elements
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

define "SDE Locations":
    [Location: type in "Inpatient, Emergency, and Observation Locations"]
   
define "SDE HOB Labs":
[Observation: "Bacterial and Fungal Blood Culture Tests"] HOBLabs
with "Initial Population" InitialPopulation
    such that Global."Normalize Interval"(HOBLabs.effective) during InitialPopulation.period
      and HOBLabs.status ~ 'final'

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

define "SDE Medication Request":
  [MedicationRequest] MedicationRequest
    with "Initial Population" InitialPopulation 
    such that MedicationRequest.authoredOn during InitialPopulation.period

define "SDE Medication Administration":
[MedicationAdministration] MedicationAdministration
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministration.effective) during InitialPopulation.period
    and MedicationAdministration.status ~ 'completed'


define "SDE Antibacterial Medications":
[MedicationRequest] MedicationRequestWithCode 
  with "Initial Population" InitialPopulation 
  such that Global."Normalize Interval"(MedicationRequestWithCode.authoredOn) during InitialPopulation.period
    and MedicationRequestWithCode.status in {'active', 'completed'}
    and GetMedicationCode(MedicationRequestWithCode.medication) in "Antibacterial Medications" 


define "SDE Payer": 
	SDE."SDE Payer" Payer
  with "Initial Population" InitialPopulation
  such that start of Payer.period before end of InitialPopulation.period

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


