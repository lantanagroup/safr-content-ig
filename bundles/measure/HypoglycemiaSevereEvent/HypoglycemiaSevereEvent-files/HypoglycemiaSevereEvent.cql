library HypoglycemiaSevereEvent version '1.0.0'

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

define "Denominator":
	"Initial Population" InitialPopulation
    with "Antidiabetic Drugs Administered or Ordered" ADD
    	such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
        	during "HospitalizationWithObservation"(InitialPopulation)
		and "AgeInYearsAt"(start of InitialPopulation.period) >= 18

define "Antidiabetic Drugs Administered or Ordered":
	([MedicationAdministration: "NHSN Hypoglycemia Drugs"] ADDMedAdmin
    	where ADDMedAdmin.status ~ 'completed'
	)
	union [MedicationRequest: "NHSN Hypoglycemia Drugs"] ADDMedRequest
     
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
  		
define "Initial Population":
	[Encounter] Encounters
    where (
    	Encounters.class ~ "inpatient encounter"
        or Encounters.class ~ "inpatient acute"
        or Encounters.class ~ "inpatient non-acute"
    )
	// "starts during" for encounters that haven't been completed yet (have no Encounter.period.end)
	and Encounters.period starts during "Measurement Period"

define "Numerator":
	"Denominator" QualifyingEncounter
    with "First Severe Hypoglycemic Event" FirstSevereEvent
    such that Global."Normalize Interval"(FirstSevereEvent.effective) during QualifyingEncounter.period 

define "First Severe Hypoglycemic Event":
	First(["Observation": "Blood Glucose Laboratory Tests"] BloodGlucoseLab
    	with "Antidiabetic Drugs Administered or Ordered" ADDMeds
    	such that Coalesce(start of Global."Normalize Interval"(ADDMeds.effective), ADDMeds.authoredOn) 24 
			hours or less on or before start of Global."Normalize Interval"(BloodGlucoseLab.effective)
        and (
            BloodGlucoseLab.status = 'final'
            or BloodGlucoseLab.status = 'amended'
        )
        and BloodGlucoseLab.status != 'cancelled'
        and BloodGlucoseLab.value < 40 'mg/dL'
        and not exists "Blood Glucose Test Greater Than 80" FollowupBloodGlucoseLab
            where Global."Normalize Interval"(FollowupBloodGlucoseLab.effective) starts 
            5 minutes or less after start of Global."Normalize Interval"(BloodGlucoseLab.effective)
	)
      
define "Blood Glucose Test Greater Than 80":
	[Observation: "Blood Glucose Laboratory Tests"] FollowupBloodGlucoseLab
    where ( FollowupBloodGlucoseLab.status = 'final'
           or FollowupBloodGlucoseLab.status = 'amended'
          )
	and FollowupBloodGlucoseLab.value > 80 'mg/dL'
    
// Supplemental Data Definitions
define "SDE Condition":
	[Condition] Conditions where exists("Initial Population")

define "SDE Chief Complaint":
	[Encounter] TheEncounter
    where TheEncounter.diagnosis.use in "Chief Complaint" 
		and exists("Initial Population")

define "SDE Encounter Locations":
	[Encounter] Encounter
   	where Global."GetLocation"(Encounter.location.location[0]).type in "CDC Location Codes" 
   		and exists("Initial Population")
		
define "SDE Encounter Discharge Dispositions":
	[Encounter: "Discharge Disposition"] DischargeDispositions 
	where exists("Initial Population")

define "SDE Ethnicity":
	SDE."SDE Ethnicity" Ethnicity
	where exists("Initial Population")

define "SDE Gender Identity":
	[Patient] Patient
    where Patient.gender in "Gender Identity" 
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
    [Patient] Patients
	where exists("Initial Population")
    return Patients.identifier

define "SDE Race":
	SDE."SDE Race" Race 
	where exists("Initial Population")

define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory Tests"] ServiceRequest
      where ServiceRequest.intent ~ 'order'
		and ServiceRequest.status ~ 'completed'
		and exists("Initial Population")

define "SDE Sex":
	SDE."SDE Sex" Sex
	where exists("Initial Population")

define "SDE Zip Code": 
	[Patient] Patients 
	where exists("Initial Population")
    return Patients.address.postalCode