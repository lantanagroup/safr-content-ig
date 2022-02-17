library InitialInpatientPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 

valueset "NHSN Hypoglycemia Drugs": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'
valueset "Blood Glucose Laboratory Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Chief Complaint": 'http://terminology.hl7.org/ValueSet/diagnosis-role'
valueset "Gender Identity": 'http://hl7.org/fhir/ValueSet/gender-identity'

code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

parameter "Measurement Period" default Interval(@2022-01-01, @2022-12-31)

context Patient

define "Initial Inpatient Population":
  "Inpatient Encounter" Encounters
  with "Antidiabetic Drugs Administered or Ordered" ADD
  such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
    during "HospitalizationWithObservation"(Encounters)
    and Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Measurement Period"

define "Inpatient Encounter":
  [Encounter] Encounters
  where (Encounters.class ~ "inpatient encounter"
    or Encounters.class ~ "inpatient acute"
    or Encounters.class ~ "inpatient non-acute")

define "Antidiabetic Drugs Administered or Ordered":
  ([MedicationAdministration: "NHSN Hypoglycemia Drugs"] ADDMedAdmin
    where ADDMedAdmin.status ~ 'completed')
  union [MedicationRequest: "NHSN Hypoglycemia Drugs"]

define function "HospitalizationWithObservation"(TheEncounter FHIR.Encounter ):
  TheEncounter Visit
  let ObsVisit: Last([Encounter] LastObs
      where LastObs.class = "observation encounter"
              and LastObs.period ends 1 hour or less on or before start of Visit.period
      sort by end of period),
      VisitStart: Coalesce(start of ObsVisit.period, start of Visit.period),
      EDVisit: Last([Encounter] LastED
        where LastED.class = "emergency"
            and LastED.period ends 1 hour or less on or before VisitStart
            sort by end of period)
  return Interval[Coalesce(start of EDVisit.period, VisitStart), end of Visit.period]

/*define "SDE Condition":
	[Condition] Conditions where exists("Initial Inpatient Population")

define "SDE Chief Complaint":
	[Encounter] TheEncounter
    where TheEncounter.diagnosis.use in "Chief Complaint" 
		and exists("Initial Inpatient Population")

define "SDE Encounter Locations":
	[Encounter] Encounter
   	where Global."GetLocation"(Encounter.location.location[0]).type in "CDC Location Codes" 
   		and exists("Initial Inpatient Population")
		
define "SDE Encounter Discharge Dispositions":
	[Encounter: "Discharge Disposition"] DischargeDispositions 
	where exists("Initial Inpatient Population")

define "SDE Ethnicity":
	SDE."SDE Ethnicity" Ethnicity
	where exists("Initial Inpatient Population")

define "SDE Gender Identity":
	[Patient] Patient
    where Patient.gender in "Gender Identity" 
		and exists("Initial Inpatient Population")

define "SDE Locations":
	[Location] Locations
    where Locations.type in "CDC Location Codes" 
		and exists("Initial Inpatient Population")

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
	where exists("Initial Inpatient Population")

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
	where exists("Initial Inpatient Population")

define "SDE Observation":
	[Observation] Observations 
	where exists("Initial Inpatient Population")

define "SDE Patient Death Date": 
	[Patient] Patient
	where Patient.deceased is FHIR.dateTime 
		and exists("Initial Inpatient Population")
	return Patient.deceased as FHIR.dateTime  

define "SDE Payer": 
	SDE."SDE Payer" Payers
	where exists("Initial Inpatient Population")

define "SDE Patient ID": 
    [Patient] Patients
	where exists("Initial Inpatient Population")
    return Patients.identifier

define "SDE Race":
	SDE."SDE Race" Race 
	where exists("Initial Inpatient Population")

define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory Tests"] ServiceRequest
      where ServiceRequest.intent ~ 'order'
		and ServiceRequest.status ~ 'completed'
		and exists("Initial Inpatient Population")

define "SDE Sex":
	SDE."SDE Sex" Sex
	where exists("Initial Inpatient Population")

define "SDE Zip Code": 
	[Patient] Patients 
	where exists("Initial Inpatient Population")
    return Patients.address.postalCode*/