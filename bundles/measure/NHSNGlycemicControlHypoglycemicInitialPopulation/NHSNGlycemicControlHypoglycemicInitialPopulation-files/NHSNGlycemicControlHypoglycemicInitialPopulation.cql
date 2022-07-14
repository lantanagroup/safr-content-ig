library NHSNGlycemicControlHypoglycemicInitialPopulation version '0.0.002'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category' 

valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Antidiabetic Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'

code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'

parameter "Measurement Period" Interval<DateTime>
 //default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient

define "Initial Population":
  "Inpatient Encounter" InpatientEncounters
  with "Antidiabetic Drugs Administered or Ordered" ADD
  such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
      during "HospitalizationWithObservationOrEmergency"(InpatientEncounters)
    and Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Measurement Period"

define "Inpatient Encounter":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "short stay"}] Encounters
  where Encounters.status in {'in-progress', 'finished'}
  and Encounters.period overlaps "Measurement Period"

define "Antidiabetic Drugs Administered or Ordered":
  ([MedicationAdministration] ADDMedAdmin
    where GetMedicationCode(ADDMedAdmin.medication) in "Antidiabetic Medications"
      and ADDMedAdmin.status ~ 'completed')
  union (
    [MedicationRequest] MedicationRequests
      where GetMedicationCode(MedicationRequests.medication) in "Antidiabetic Medications"
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

define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication] M where M.id = Global.GetId(reference.reference)
  )

define function "HospitalizationWithObservationOrEmergency"(TheEncounter FHIR.Encounter ):
  TheEncounter Visit
    let ObsVisit: Last([Encounter] LastObs
        where LastObs.class ~ "observation encounter"
          and LastObs.period ends 1 hour or less on or before start of Visit.period
  				sort by end of period
    ),
    VisitStart: Coalesce(start of ObsVisit.period, start of Visit.period),
    EDVisit: Last([Encounter] LastED
        where LastED.class ~ "emergency"
          and LastED.period ends 1 hour or less on or before start of Visit.period
  				sort by end of period
    )
    return Interval[Coalesce(start of EDVisit.period, VisitStart), end of Visit.period]

define function "GetSpecimen"(reference Reference):
  singleton from (
    [Specimen] S where S.id = Global.GetId(reference.reference)
  )
  
//Supplement Data Elements
define "SDE Chief Complaint":
  "Initial Population" InitialPopulation
  with InitialPopulation.diagnosis InitialPopulationDiagnosis
  such that InitialPopulationDiagnosis.use ~ "Chief Complaint"

define "SDE Condition":
  [Condition] Conditions
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  
define "SDE Condition during Encounter":
  [Condition] ConditionEncounterDiagnosis
  with ConditionEncounterDiagnosis.category Category
  such that Category ~ "encounter-diagnosis"
    and exists("Initial Population")
    
define "SDE Encounter Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"
  
define "SDE Encounter Locations":
  "Initial Population" InitialPopulation 
  where exists ( 
    InitialPopulation.location InitialPopulationLocation
    where (Global.GetLocation(InitialPopulationLocation.location).type in "Inpatient, Emergency, and Observation Locations"   
      or Global.GetLocation(InitialPopulationLocation.location).physicalType in "Inpatient, Emergency, and Observation Locations")
      and InitialPopulationLocation.period during InitialPopulation.period
  )

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(MedicationAdministrations.effective) during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
    and start of Global."Normalize Interval"(MedicationAdministrations.effective) during "Measurement Period"

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
  with "Initial Population" InitialPopulation
	such that MedicationRequests.authoredOn during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
    and MedicationRequests.authoredOn during "Measurement Period"

define "SDE Blood Glucose Observation":
	[Observation: "Blood Glucose Laboratory and Point of Care Tests"] Observations 
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(Observations.effective) during InitialPopulation.period
    or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during InitialPopulation.period
  with Observations.category category
  such that category ~ "laboratory"

define "SDE Payer": 
	SDE."SDE Payer" Payer
  with "Initial Population" InitialPopulation
  such that start of Payer.period before end of InitialPopulation.period
  
define "SDE Specimen":
  [Specimen] Specimen
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Specimen.collection.collected) during InitialPopulation.period