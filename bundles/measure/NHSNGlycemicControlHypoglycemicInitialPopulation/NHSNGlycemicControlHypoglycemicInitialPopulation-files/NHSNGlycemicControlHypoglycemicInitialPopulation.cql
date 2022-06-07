library NHSNGlycemicControlHypoglycemicInitialPopulation version '0.0.002'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'

valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "NHSN Hypoglycemia Drugs": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'

code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

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
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute"}] Encounters
  where Encounters.status in {'in-progress', 'finished'}
  and Encounters.period overlaps "Measurement Period"

define "Antidiabetic Drugs Administered or Ordered":
  ([MedicationAdministration] ADDMedAdmin
    where GetMedicationCode(ADDMedAdmin.medication) in "NHSN Hypoglycemia Drugs"
      and ADDMedAdmin.status ~ 'completed')
  union (
    [MedicationRequest] MedicationRequests
      where GetMedicationCode(MedicationRequests.medication) in "NHSN Hypoglycemia Drugs"
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

define function "HasCategoryLaboratory"(categories List<FHIR.CodeableConcept>):
  categories category
  return category ~ "laboratory"
  
//Supplement Data Elements
define "SDE Chief Complaint":
  [Encounter: diagnosis.use ~ "Chief Complaint"] ChiefComplaint
  with "Initial Population" InitialPopulation
  such that start of ChiefComplaint.period during "Measurement Period"

define "SDE Condition":
  [Condition] Conditions
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  
define "SDE Encounter Diagnoses":
  "Initial Population" InitialPopulation
	return Global.EncounterDiagnosis(InitialPopulation) except {null}
    
define "SDE Encounter Discharge Dispositions":
	[Encounter: hospitalization.dischargeDisposition in "Discharge Disposition"] DischargeDispositions 
  with "Initial Population" InitialPopulation
	such that start of DischargeDispositions.period during InitialPopulation.period
  
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (Global.GetLocation(EncounterLocation.location).type in "CDC Location Codes" 
      or Global.GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
  where Encounter.period during "Measurement Period"

define "SDE Locations":
  [Location] Locations

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
  /*with "Antidiabetic Drugs Administered or Ordered" ADD
  such that start of Global."Normalize Interval"(Observations.effective) 24 hours before Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)*/
  where true in HasCategoryLaboratory(Observations.category)
    /*and Observations.value is not null
    and Observations.value < 70*/

define "SDE Payer": 
	SDE."SDE Payer" Payer
  with "Initial Population" InitialPopulation
  such that start of Payer.period before end of InitialPopulation.period
  
define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory and Point of Care Tests"] LabTest
  with "Initial Population" InitialPopulation
  such that LabTest.intent ~ 'order'
    and LabTest.status ~ 'completed'
    and LabTest.authoredOn during InitialPopulation.period