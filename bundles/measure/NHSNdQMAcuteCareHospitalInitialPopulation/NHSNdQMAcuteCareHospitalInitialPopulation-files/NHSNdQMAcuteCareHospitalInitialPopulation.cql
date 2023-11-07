library NHSNdQMAcuteCareHospitalInitialPopulation version '0.0.007'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include SharedResourceCreation version '0.1.004' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "LOINC": 'http://loinc.org' 
codesystem "V2-0074": 'http://terminology.hl7.org/CodeSystem/v2-0074'

valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'


code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'

//code for Observation Category
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "social-history": 'social-history' from "Observation Category" display 'Social History'
code "vital-signs": 'vital-signs' from "Observation Category" display 'Vital Signs'
code "imaging": 'imaging' from "Observation Category" display 'Imaging'
code "procedure": 'procedure' from "Observation Category" display 'Procedure'
code "survey": 'survey' from "Observation Category" display 'Survey'

//code for Diagnostic Report Category
code "LAB": 'LAB' from "V2-0074" display 'Laboratory'
code "Radiology": 'LP29684-5' from "LOINC" display 'Radiology'
code "Pathology": 'LP7839-6' from "LOINC" display 'Pathology'
code "Cardiology": 'LP29708-2' from "LOINC" display 'Cardiology'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

define "Qualifying Encounter During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
union   [Encounter: "Emergency Department Visit"]
union [Encounter: "Observation Services"]
union [Encounter: class in {"emergency", "inpatient acute", "inpatient encounter", "inpatient non-acute", "short stay"}]) QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and QualifyingEncounters.period overlaps "Measurement Period" 

define "Encounters with Patient Hospital Locations":
  [Encounter] Encounters
  where exists(
    Encounters.location EncounterLocation
    where Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period overlaps Encounters.period
      and Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
  )

define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Encounters with Patient Hospital Locations"

//============================================================================
//Supplemental Data Element
//When FHIR.canonical value is present, US Core 3.1.1 profiles are used
//When FHIR.canonical value is not present, FHIR Base profiles are used
//============================================================================
define "SDE Condition":
  [Condition] Conditions 
  where exists("Initial Population")
  return SharedResource.ConditionResource(Conditions,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition'}})

define "SDE Device":
  [Device] Devices 
  where exists("Initial Population")
  return SharedResource.DeviceResourceBaseFHIR(Devices)

define "SDE DiagnosticReport Lab":
  [DiagnosticReport] DiagnosticReports
  where (exists(DiagnosticReports.category Category where Category ~ "LAB")
    and exists("Initial Population"))
  return SharedResource.DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab'}})
 
define "SDE DiagnosticReport Note":
  [DiagnosticReport] DiagnosticReports
  where ((exists(DiagnosticReports.category Category where Category ~ "Radiology"))
    or exists((DiagnosticReports.category Category where Category ~ "Pathology"))
    or exists((DiagnosticReports.category Category where Category ~ "Cardiology")))
    and exists("Initial Population")
  return SharedResource.DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note'}})

define "SDE DiagnosticReport All":
  [DiagnosticReport] DiagnosticReports
  where exists("Initial Population")
  return SharedResource.DiagnosticReportResourceBaseFHIR(DiagnosticReports)

define "SDE Encounter": 
  [Encounter] Encounters
  where exists("Initial Population")
  return SharedResource.EncounterResource(Encounters,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter'}})

define "SDE Initial Population Encounters":
  "Initial Population" IP
  return SharedResource.EncounterResource(IP,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter'}})

define "SDE Location":
  [Location] Locations
  where exists("Initial Population")
  return SharedResource.LocationResource(Locations,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-location'}})
 
define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministrations 
  where exists("Initial Population")
  return SharedResource.MedicationAdministrationResourceBaseFHIR(MedicationAdministrations)
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists("Initial Population")
  return SharedResource.MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest'}})

define "SDE Medication":
  [Medication] Medication
  where exists("Initial Population")
  return SharedResource.MedicationResource(Medication,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication'}})

define "SDE Observation Lab Category":
  [Observation] Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists("Initial Population")
  return SharedResource.ObservationResource(Observations,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab'}})

//Vital Signs Observation has its own profile in FHIR Base
define "SDE Observation Vital Signs Category":
  [Observation] Observations 
  where (exists(Observations.category Category where Category ~ "vital-signs"))
    and exists("Initial Population")
  return SharedResource.ObservationResource(Observations,
  {FHIR.canonical{value: 'http://hl7.org/fhir/StructureDefinition/vitalsigns'}})

//Defaulting to base FHIR profile as there are no individual profiles in US Core 3.1.1 that cover these Observation categories
define "SDE Observation Category":
  [Observation] Observations 
  where ((exists(Observations.category Category where Category ~ "social-history"))
    or (exists(Observations.category Category where Category ~ "survey"))
    or (exists(Observations.category Category where Category ~ "imaging"))
    or (exists(Observations.category Category where Category ~ "procedure")))
    and exists("Initial Population")
  return SharedResource.ObservationResourceBaseFHIR(Observations)

define "SDE Coverage": 
	[Coverage] Coverages
  where exists("Initial Population")
  return SharedResource.CoverageResourceBaseFHIR(Coverages)

define "SDE Procedure":
  [Procedure] Procedures 
  where exists("Initial Population")
  return SharedResource.ProcedureResource(Procedures,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure'}})

define "SDE Specimen":
  [Specimen] Specimen
  where exists("Initial Population")
  return SharedResource.SpecimenResourceBaseFHIR(Specimen)

define "SDE Service Request":
  [ServiceRequest] ServiceRequests
  where exists("Initial Population")
  return SharedResource.ServiceRequestResourceBaseFHIR(ServiceRequests)

define "SDE Minimal Patient":
  Patient p
  return SharedResource.PatientResource(p,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/cross-measure-patient'}})