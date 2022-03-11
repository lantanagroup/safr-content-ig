library NHSN Glycemic Control, Hypoglycemia Severe Events (Metric 1) version '0.0.002'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.001' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "LOINC": 'http://loinc.org' 


valueset "Antidiabetic Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/ 2.16.840.1.113762.1.4.1190.58'
valueset "Blood Glucose Laboratory and Point of Care Tests": 'htttp://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Gender Identity": 'http://hl7.org/fhir/ValueSet/gender-identity'
valueset "NHSN CDC Inpatient Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'

code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

parameter "Performance Period" Interval<DateTime>
 default Interval[@2022-01-01T00:00:00.0, @2022-01-31T00:00:00.0)

context Patient

define "Antidiabetic Drugs Administered or Ordered":
  ( ( [MedicationAdministration: "Antidiabetic Medications"] ADDMedAdmin
              where ADDMedAdmin.status ~ 'completed'
          )
            union [MedicationRequest: "Antidiabetic Medications"]
        )

define "Denominator":
  "Initial Population"QualifyingEncounter
                                with "Antidiabetic Drugs Administered or Ordered" ADD
                                	such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
                               during   "HospitalizationWithObservationOrEmergency"(QualifyingEncounter)

define "Initial Population":
  [Encounter] Encounters
                                where (Encounters.class ~ "inpatient encounter"
                                  or Encounters.class ~ "inpatient acute"
                                  or Encounters.class ~ "inpatient non-acute")
                                and Encounters.period during "Measurement Period"

define "First Severe Hypoglycemic Event":
  First(["Observation": "Blood Glucose Laboratory Tests"] SevereBloodGlucoseResult
      with "Antidiabetic Drugs Administered or Ordered" ADDMeds
        such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Performance Period"
  return Tuple{starts 24 hours or less on or before start of Global."Normalize Interval"(SevereBloodGlucoseResult.effective)
          and(SevereBloodGlucoseResult.status = 'final'
              or SevereBloodGlucoseResult.status = 'amended'
          )
          and(SevereBloodGlucoseResult.status != 'cancelled'
              and SevereBloodGlucoseResult.value < 40 'mg/dL'
          )
      without [Observation: "Blood Glucose Laboratory Tests"] FollowupBloodGlucoseTest
        such that FollowupBloodGlucoseTest.value > 80 'mg/dL'
          and Global."Normalize Interval"(FollowupBloodGlucoseTest.effective)starts 5 minutes or less after start of Global."Normalize Interval"(SevereBloodGlucoseResult.effective)
          and(FollowupBloodGlucoseTest.status = 'final'
              or FollowupBloodGlucoseTest.status = 'amended'
          )
  )

define "Numerator":
  "Denominator" QualifyingEncounter
    with "First Severe Hypoglycemic Event" FirstSevereEvent
      such that Global."Normalize Interval" ( FirstSevereEvent.effective ) starts during QualifyingEncounter.period

define function "HospitalizationWithObservationOrEmergency"(TheEncounter Encounter ):
  TheEncounter Visit
    let ObsVisit: Last([Encounter] LastObs
        where LastObs.class = "observation encounter"
          and LastObs.period ends 1 hour or less on or before start of Visit.period
        sort by 
        end of period
    ),
    VisitStart: Coalesce(start of ObsVisit.period, start of Visit.period),
    EDVisit: Last([Encounter] LastED
        where LastED.class = "emergency"
          and LastED.period ends 1 hour or less on or before VisitStart
        sort by 
        end of period
    )
    return Interval[Coalesce(start of EDVisit.period, VisitStart), 
    end of Visit.period]

//Supplemental Data Elements  

define "SDE Chief Complaint":
  [Encounter] InpatientEncounter
  with InpatientEncounter.diagnosis Diagnosis
  such that Diagnosis.use ~ "Chief Complaint"
  where exists("Initial Population".encounters)

define "SDE Condition":
	[Condition] Conditions where exists("Initial Population".encounters)
    
define "SDE Encounter Discharge Dispositions":
	[Encounter: "Discharge Disposition"] DischargeDispositions 
	where exists("Initial Population".encounters)

define "SDE Encounter Locations":
	[Encounter] Encounter
   	where Global."GetLocation"(Encounter.location.location[0]).type in "CDC Location Codes" 
   		and exists("Initial Population".encounters)

define "SDE Ethnicity":
	SDE."SDE Ethnicity" Ethnicity
	where exists("Initial Population".encounters)

define "SDE Gender Identity":
	[Patient] Patient
    where Patient.gender in "Gender Identity"
		and exists("Initial Population".encounters)
 	
  define "SDE Locations":
	[Location] Locations
    where exists("Initial Population".encounters)

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
    where exists("Initial Population".encounters)

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
	where exists("Initial Population".encounters)

define "SDE Observation":
	[Observation] Observations 
	where exists("Initial Population".encounters)

define "SDE Patient Death Date": 
  singleton from(
    [Patient] Patient
    where Patient.deceased is FHIR.dateTime 
      and exists("Initial Population".encounters)
    return Patient.deceased
  )

define "SDE Payer": 
	SDE."SDE Payer" Payers
	where exists("Initial Population".encounters)

define "SDE Patient ID": 
    [Patient] ThePatient
	where exists("Initial Population".encounters)
    return ThePatient.identifier

define "SDE Procedures":
  [Procedure] Procedures
  where exists("Initial Population".encounters)

define "SDE Race":
	SDE."SDE Race" Race 
	where exists("Initial Population".encounters)

define "SDE Service Request":
	[ServiceRequest: "Blood Glucose Laboratory and Point of Care Tests"] LabTest
      where (LabTest.intent ~ 'order'
		and LabTest.status ~ 'completed')
		and exists("Initial Population".encounters)

define "SDE Inpatient Encounter with Antidiabetic Drugs":
  from
      "Inpatient Encounter" InpatientEncounters,
      "Antidiabetic Drugs Administered or Ordered" ADD
      where Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)during "HospitalizationWithObservationOrEmergency"(InpatientEncounters)
        and Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)during "Measurement Period"
      return Tuple {
        encounters: InpatientEncounters,
        drug: ADD.medication,
        drugDateTime: Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
      }

define "SDE Sex":
	SDE."SDE Sex" Sex
	where exists("Initial Population".encounters)
   
define "SDE Zip Code": 
	[Patient] ThePatient 
	where exists("Initial Population".encounters)
    return ThePatient.address.postalCode


