library InitialInpatientPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 

valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Chief Complaint": 'http://terminology.hl7.org/ValueSet/diagnosis-role'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Gender Identity": 'http://hl7.org/fhir/ValueSet/gender-identity'
valueset "NHSN Hypoglycemia Drugs": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'
valueset "ONC Administrative Sex": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1'


code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

parameter "Performance Period" Interval<DateTime>
 default Interval[@2022-01-01T00:00:00.0, @2023-01-01T00:00:00.0)

context Patient

define "Initial Population":
  "Inpatient Encounter" InpatientEncounters
  with "Antidiabetic Drugs Administered and Ordered" ADD
  such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
    during "HospitalizationWithObservationOrEmergency"(InpatientEncounters)
    and Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Performance Period"

define "Inpatient Encounter":
  [Encounter] Encounters
  where (Encounters.class ~ "inpatient encounter"
    or Encounters.class ~ "inpatient acute"
    or Encounters.class ~ "inpatient non-acute")

define "Antidiabetic Drugs Administered and Ordered":
  ([MedicationAdministration: "NHSN Hypoglycemia Drugs"] ADDMedAdmin
    where ADDMedAdmin.status ~ 'completed')
  union [MedicationRequest: "NHSN Hypoglycemia Drugs"]

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

//Supplement Data Elements
define "SDE Chief Complaint":
	[Encounter] InpatientEncounter
    where InpatientEncounter.diagnosis.use in "Chief Complaint" 
		and exists("Initial Population")

define "SDE Condition":
	[Condition] Conditions where exists("Initial Population")
    
   define "SDE Encounter Discharge Dispositions":
	[Encounter: "Discharge Disposition"] DischargeDispositions 
	where exists("Initial Population")

define "SDE Encounter Locations":
	[Encounter] Encounter
   	where Global."GetLocation"(Encounter.location.location[0]).type in "CDC Location Codes" 
   		and exists("Initial Population")
 	
  define "SDE Locations":
	[Location] Locations
    where Locations.type in "CDC Location Codes" 
		and exists("Initial Population")

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
    where exists("Initial Population")

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
	where exists("Initial Population")

define "SDE Observation":
	[Observation] Observations 
	where exists("Initial Population")

define "SDE Patient Death Date": 
	[Patient] Patient
	where Patient.deceased is FHIR.dateTime 
		and exists("Initial Population")
	return Patient.deceased as FHIR.dateTime  

define "SDE Payer": 
	SDE."SDE Payer" Payers
	where exists("Initial Population")

define "SDE Patient ID": 
    [Patient] ThePatient
	where exists("Initial Population")
    return ThePatient.identifier

define "SDE Race":
	SDE."SDE Race" Race 
	where exists("Initial Population")

define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory and Point of Care Tests"] LabTest
      where (LabTest.intent ~ 'order'
		and LabTest.status ~ 'completed')
		and exists("Initial Population")

define "SDE Sex":
	SDE."SDE Sex" Sex
	where exists("Initial Population")
   
define "SDE Zip Code": 
	[Patient] ThePatient 
	where exists("Initial Population")
    return ThePatient.address.postalCode

