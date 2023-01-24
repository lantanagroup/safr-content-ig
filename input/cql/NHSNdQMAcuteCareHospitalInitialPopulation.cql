library NHSNdQMAcuteCareHospitalInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'

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

code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "social-history": 'social-history' from "Observation Category" display 'Social History'
code "vital-signs": 'vital-signs' from "Observation Category" display 'Vital Signs'
code "imaging": 'imaging' from "Observation Category" display 'Imaging'
code "procedure": 'procedure' from "Observation Category" display 'Procedure'
code "survey": 'survey' from "Observation Category" display 'Survey'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

define "Qualifying Encounter During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
union   [Encounter: "Emergency Department Visit"]
union [Encounter: "Observation Services"]
union [Encounter: class in {"emergency", "inpatient acute", "inpatient encounter", "inpatient non-acute", "short stay"}]) QualifyingEncounters
  where QualifyingEncounters .status in {'in-progress', 'finished'}
    and QualifyingEncounters.period overlaps "Measurement Period"

define "Qualifying Location During Measurement Period":
  [Encounter] Encounters
    with Encounters.location EncounterLocation
    such that Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
     and  EncounterLocation.period overlaps "Measurement Period"

define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Qualifying Location During Measurement Period"

//============================
//Supplemental Data Element
//============================
define "SDE Condition":
  [Condition] Conditions 
  where exists("Initial Population")

define "SDE Device":
    [Device] Devices 
    where exists("Initial Population")

define "SDE DiagnosticReport":
    [DiagnosticReport] DiagnosticReports
    where exists("Initial Population")

define "SDE Encounter": 
    [Encounter] Encounters
    where exists("Initial Population")

define "SDE Location":
    [Location] Locations
    where exists("Initial Population")
 
define "SDE Medication Administration":
    [MedicationAdministration] MedicationAdministrations 
    where exists("Initial Population")
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists("Initial Population")

define "SDE Medication":
  [Medication] Medication
  where exists("Initial Population")

define "SDE Observation Category":
    [Observation] Observations 
    where ((exists(Observations.category Category where Category ~ "laboratory"))
    or (exists(Observations.category Category where Category ~ "social-history"))
    or (exists(Observations.category Category where Category ~ "vital-signs"))
    or (exists(Observations.category Category where Category ~ "survey"))
    or (exists(Observations.category Category where Category ~ "imaging"))
    or (exists(Observations.category Category where Category ~ "procedure")))
    and exists("Initial Population")

define "SDE Coverage": 
	[Coverage] Coverages
  where exists("Initial Population")

define "SDE Procedure":
    [Procedure] Procedures 
    where exists("Initial Population")

define "SDE Specimen":
  [Specimen] Specimen
  where exists("Initial Population")

define "SDE Minimal Patient":
  Patient p
  return PatientResource(p)
  
//-----------------------------------------------------------------
// functions
//-----------------------------------------------------------------
define function "GetIdExtensions"(domainResource DomainResource):
  domainResource.extension E
  where E.url = 'https://www.cdc.gov/nhsn/fhir/nhsnlink/StructureDefinition/nhsnlink-original-id'
  return E

define function "GetPatientExtensions"(domainResource DomainResource):
  domainResource.extension E
  where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity'
    or E.url = 'http://hl7.org/fhir/StructureDefinition/patient-genderIdentity'
  return E

define function "PatientResource"(patient Patient):
  patient p
  return Patient{
    id: FHIR.id{value: 'LCR-' + p.id},
    extension: GetPatientExtensions(p) union GetIdExtensions(p),
    identifier: p.identifier,
    active: p.active,
    name: p.name,
    telecom: p.telecom,
    gender: p.gender,
    birthDate: p.birthDate,
    deceased: p.deceased,
    address: p.address,
    communication: p.communication,
    contact: p.contact
  }

