library InitialInpatientPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'

valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Gender Identity": 'http://hl7.org/fhir/ValueSet/gender-identity'
valueset "NHSN Hypoglycemia Drugs": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'

code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

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
  where Encounters.period overlaps "Measurement Period"

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

define function "GetCondition"(reference Reference):
  singleton from (
    [Condition] C where C.id = Global.GetId(reference.reference)
  )

define function "GetEncounterConditionData"(encounter Encounter):
  encounter.diagnosis.condition References
  return DisplayCondition(GetCondition(References))

define function "DisplayCondition"(condition Condition):
  condition Condition
  return Tuple{
    code: DisplayCodeableConcept(Condition.code),
    onsetDate: Condition.onset,
    abatementDate: Condition.abatement
  }

define function "GetLocation"(references List<Reference>):
  references reference
  return DisplayLocation(Global.GetLocation(reference))

define function "DisplayLocation"(location Location):
  location Location
  return Tuple{
    locationType: Location.type,
    locationPhysicalType: Location.physicalType
  }

define function "DisplayProcedure"(procedure Procedure):
  procedure Procedure
  return Tuple{
    procedureCode: Procedure.code,
    procedureTime: Procedure.performed
  }

define function "DisplayCodeableConcept"(code CodeableConcept):
  code.coding Coding
  return DisplayCoding(Coding)

define function "DisplayCoding"(coding Coding):
  coding Coding
  return Code{
    code: Coding.code,
    system: Coding.system,
    display: Coding.display
  }

//Supplement Data Elements
define "SDE Chief Complaint":
  [Encounter: diagnosis.use ~ "Chief Complaint"] EncounterWithDiagnosis
  with "Initial Population" InitialPopulation
  such that start of EncounterWithDiagnosis.period during InitialPopulation.period
    and EncounterWithDiagnosis.period overlaps "Measurement Period"
  return Tuple{
    id: EncounterWithDiagnosis.id,
    condition: GetEncounterConditionData(EncounterWithDiagnosis)
  }

define "SDE Condition":
	[Condition] Conditions
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(Conditions.onset) during InitialPopulation.period
  return DisplayCondition(Conditions)

define "SDE Encounter Discharge Dispositions":
	[Encounter: hospitalization.dischargeDisposition in "Discharge Disposition"] DischargeDispositions 
  with "Initial Population" InitialPopulation
	such that start of DischargeDispositions.period during InitialPopulation.period
    and DischargeDispositions.period during "Measurement Period"
  return DisplayCodeableConcept(DischargeDispositions.hospitalization.dischargeDisposition)
  
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (Global.GetLocation(EncounterLocation.location).type in "CDC Location Codes" 
      or Global.GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
    and Encounter.period during "Measurement Period"
  return 
    Encounter E
    let 
      locations: E.location
      return GetLocation(locations.location)
      
define "SDE Ethnicity":
	SDE."SDE Ethnicity" Ethnicity
	where exists("Initial Population")
  return DisplayCoding(Ethnicity)

define "SDE Gender Identity":
	[Patient] Patient
  where Global."GetExtension"(Patient, 'patient-genderIdentity').value in "Gender Identity"
    and exists("Initial Population")
 	
define "SDE Locations":
  [Location] Locations
  where exists("Initial Population")
    return DisplayLocation(Locations)

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(MedicationAdministrations.effective) during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
    return Tuple{
      medication: DisplayCodeableConcept(GetMedicationCode(MedicationAdministrations.medication)),
      effective: MedicationAdministrations.effective
    }

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
  with "Initial Population" InitialPopulation
	such that MedicationRequests.authoredOn during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
  return Tuple{
    medication: DisplayCodeableConcept(GetMedicationCode(MedicationRequests.medication)),
    authoredOn: MedicationRequests.authoredOn
  }

define "SDE Hospitalization Observation":
	[Observation] Observations 
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(Observations.effective) during InitialPopulation.period

define "SDE Patient Death Date": 
  singleton from(
    [Patient] Patient
    where Patient.deceased is FHIR.dateTime 
      and exists("Initial Population")
    return Patient.deceased
  )

define "SDE Payer": 
	SDE."SDE Payer" Payers
	where exists("Initial Population")

define "SDE Patient ID": 
  [Patient] ThePatient
	where exists("Initial Population")
    return ThePatient.identifier

define "SDE Hospitalization Procedures":
  [Procedure] Procedures
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(Procedures.performed) during InitialPopulation.period
  return DisplayProcedure(Procedures)

define "SDE Race":
	SDE."SDE Race" Race 
	where exists("Initial Population")
  return DisplayCoding(Race)

define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory and Point of Care Tests"] LabTest
  with "Initial Population" InitialPopulation
  such that (LabTest.intent ~ 'order'
    and LabTest.status ~ 'completed')
    and start of Global."Normalize Interval"(LabTest.occurrence) during InitialPopulation.period

define "SDE Sex":
	SDE."SDE Sex" Sex
	where exists("Initial Population")
   
define "SDE Zip Code": 
	[Patient] ThePatient 
	where exists("Initial Population")
  return ThePatient.address.postalCode