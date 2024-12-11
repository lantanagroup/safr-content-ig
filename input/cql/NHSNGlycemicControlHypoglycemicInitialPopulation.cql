library NHSNGlycemicControlHypoglycemicInitialPopulation version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include NHSNHelpers version '0.0.002' called NHSNHelpers
include SharedResourceCreation version '0.1.006' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category' 

//
// Value Sets Used in the Measure
//
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Diabetes Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'

//Glucose Lab Tests
valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'

//Encounter Locations
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'

//Encounter Types
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'

//Encounter Class
valueset "NHSN Inpatient Encounter Class Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.274'

//
// Codes Used in the Measure
//
code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'

//Emergency and Observation Encounter Class Codes
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

//Encounter Diagnosis Codes
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display 'Encounter Diagnosis'

//Lab Test Codes
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

parameter "Measurement Period" Interval<DateTime>
 default Interval[@2022-01-01T00:00:00.0, @2022-01-31T23:59:00.0)

context Patient

//
// Initial Population
//
define "Initial Population":
  ("Inpatient Encounter"
  union "Encounters with Patient Hospital Locations") InpatientEncounters
  where InpatientEncounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and InpatientEncounters.period overlaps "Measurement Period"
    and exists( 
    "Antidiabetic Drugs Administered or Ordered" ADD
    where Coalesce(start of NHSNHelpers."Normalize Interval"(ADD.effective), ADD.authoredOn)
      during "HospitalizationWithObservationOrEmergency"(InpatientEncounters)
    and Coalesce(start of NHSNHelpers."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Measurement Period")

define "Inpatient Encounter":
  [Encounter: class in "NHSN Inpatient Encounter Class Codes"]
    union [Encounter: "Encounter Inpatient"]
  
define "Encounters with Patient Hospital Locations":
  "Encounters" Encounters
  where exists(
    Encounters.location EncounterLocation
    let types: NHSNHelpers.GetLocation(EncounterLocation.location).type
    where exists(
      types type
      where type in "Inpatient, Emergency, and Observation Locations"
    )
    and EncounterLocation.period during Encounters.period
  )

define "Antidiabetic Drugs Administered or Ordered":
  ("MedicationAdministrations" ADDMedAdmin
    where GetMedicationCode(ADDMedAdmin.medication) in "Diabetes Medications"
      and ADDMedAdmin.status ~ 'completed')
  union (
    "MedicationRequests" MedicationRequests
      where GetMedicationCode(MedicationRequests.medication) in "Diabetes Medications"
  )

define "Get Locations from Initial Population":
  flatten("Initial Population" IP
  let locationElements: IP.location
  return
    locationElements LE
    let locationReference: LE.location
    return NHSNHelpers.GetLocation(locationReference))

//
//Supplemental Data Elements
//

//Blood glucose testing during the initial population period
define "SDE Blood Glucose Observation":
	[Observation: "Blood Glucose Laboratory and Point of Care Tests"] Observations 
  where exists(
    "Initial Population" InitialPopulation
    where start of NHSNHelpers."Normalize Interval"(Observations.effective) during InitialPopulation.period
    or NHSNHelpers."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) 
      during InitialPopulation.period
  )
  return SharedResource.ObservationLabResource(Observations, 
  {FHIR.canonical{value: ''}})

//To capture the patient's chief complaint
define "SDE Chief Complaint":
  "Initial Population" IP
  where exists(
    IP.diagnosis InitialPopulationDiagnosis
    where InitialPopulationDiagnosis.use ~ "Chief Complaint"
  )
  return SharedResource.EncounterResource(IP, 
  {FHIR.canonical{value: ''}})

//To capture any active Conditions the patient has
define "SDE Condition":
  "Conditions" Conditions
  where exists(
    "Initial Population" InitialPopulation
    where NHSNHelpers."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  )
  return SharedResource.ConditionResource(Conditions,
  {FHIR.canonical{value: ''}})
  
//To capture the Encounter diagnosis
define "SDE Condition during Encounter":
  "Conditions" ConditionEncounterDiagnosis
  where exists(
    ConditionEncounterDiagnosis.category category
    where category ~ "encounter-diagnosis"
  )
  return SharedResource.ConditionResource(ConditionEncounterDiagnosis,
  {FHIR.canonical{value: ''}})

//To capture Coverage information
define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" InitialPopulation
    where start of Coverages.period before day of end of InitialPopulation.period
    and (end of Coverages.period is null
      or (end of Coverages.period is not null
        and end of Coverages.period on or after day of end of InitialPopulation.period
      )
    )
  )
  return SharedResource.CoverageResource(Coverages,
  {FHIR.canonical{value: ''}})
    
//To capture the discharge disposition
define "SDE Encounter Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"
  return SharedResource.EncounterResource(DischargeDispositions, 
  {FHIR.canonical{value: ''}})

//To capture the Locations where the Encounter took place
define "SDE Encounter Locations":
  "Initial Population" InitialPopulation 
  where exists(
    InitialPopulation.location InitialPopulationLocation
    let types: NHSNHelpers.GetLocation(InitialPopulationLocation.location).type
    where exists(
      types type
      where type in "Inpatient, Emergency, and Observation Locations"
    )
    and InitialPopulationLocation.period during InitialPopulation.period
  )
  return SharedResource.EncounterResource(InitialPopulation, 
  {FHIR.canonical{value: ''}})

define "SDE Initial Population Encounters":
  "Initial Population" IP
  return SharedResource.EncounterResource(IP,
  {FHIR.canonical{value: ''}})

define "SDE Location":
  "Get Locations from Initial Population" Locations
  where exists("Initial Population")
  and Locations is not null
  return SharedResource.LocationResource(Locations,
  {FHIR.canonical{value: ''}})

//To capture information about the Medication
define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: ''}})

//To capture information on when the Medication was given
define "SDE Medication Administration":
	"MedicationAdministrations" MedicationAdministrations
  where exists(
    "Initial Population" InitialPopulation
    where NHSNHelpers."Normalize Interval"(MedicationAdministrations.effective) 
      overlaps "HospitalizationWithObservationOrEmergency"(InitialPopulation)
  )
  return SharedResource.MedicationAdministrationResource(MedicationAdministrations, 
  {FHIR.canonical{value: ''}})

//To capture information about the medication order
define "SDE Medication Request":
	"MedicationRequests" MedicationRequests
  where exists(
    "Initial Population" InitialPopulation
	  where MedicationRequests.authoredOn during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
  )
  return SharedResource.MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: ''}})

define "SDE Minimal Patient":
  Patient p
  return SharedResource.PatientResource(p,
  {FHIR.canonical{value: ''}})
  
//To capture blood glucose testing orders
define "SDE Service Request":
  [ServiceRequest] ServiceRequests
  where exists(
    "Initial Population" InitialPopulation
    where ServiceRequests.authoredOn during InitialPopulation.period
  )
  return SharedResource.ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: ''}})

//To capture the blood glucose specimen information
define "SDE Specimen":
  "Specimens" Specimens
  where exists(
    "Initial Population" InitialPopulation
    where NHSNHelpers."Normalize Interval"(Specimens.collection.collected) during InitialPopulation.period
  )
  return SharedResource.SpecimenResource(Specimens,
  {FHIR.canonical{value: ''}})

//
// Retrieve Resources
//
define "Encounters":
  [Encounter]

define "MedicationRequests":
  [MedicationRequest]

define "MedicationAdministrations":
  [MedicationAdministration]

define "Specimens":
  [Specimen]

define "Conditions":
  [Condition]

//
//Functions
//
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
    [Medication] Medications
    where Medications.id = NHSNHelpers.GetId(reference.reference)
  )

define function "HospitalizationWithObservationOrEmergency"(TheEncounter FHIR.Encounter ):
  TheEncounter Visit
    let ObsVisit: Last([Encounter: "Observation Services"] LastObs
        where LastObs.class ~ "observation encounter"
          and LastObs.period ends 1 hour or less on or before start of Visit.period
  				sort by end of period
    ),
    VisitStart: Coalesce(start of ObsVisit.period, start of Visit.period),
    EDVisit: Last([Encounter: "Emergency Department Visit"] LastED
        where LastED.class ~ "emergency"
          and LastED.period ends 1 hour or less on or before start of Visit.period
  				sort by end of period
    )
    return Interval[Coalesce(start of EDVisit.period, VisitStart), end of Visit.period]

define function "GetSpecimen"(reference Reference):
  singleton from (
    [Specimen] Specimens
    where Specimens.id = NHSNHelpers.GetId(reference.reference)
  )

define function "GetMedicationFrom"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference)
    else
      null
  end