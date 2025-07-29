library NHSNAcuteCareHospitalMonthlyInitialPopulation version '1.0.1-dev'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.2' called FHIRHelpers
include NHSNHelpers version '0.0.002' called NHSNHelpers
include SharedResourceCreation version '0.1.010' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "LOINC": 'http://loinc.org' 
codesystem "V2-0074": 'http://terminology.hl7.org/CodeSystem/v2-0074'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category'
codesystem "US Core Condition Category": 'http://hl7.org/fhir/us/core/CodeSystem/condition-category'
codesystem "Condition Clinical Status": 'http://terminology.hl7.org/CodeSystem/condition-clinical'

valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'
valueset "NHSN Inpatient Encounter Class Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.274'

//code for Observation Category
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "social-history": 'social-history' from "Observation Category" display 'Social History'
code "vital-signs": 'vital-signs' from "Observation Category" display 'Vital Signs'
code "imaging": 'imaging' from "Observation Category" display 'Imaging'
code "procedure": 'procedure' from "Observation Category" display 'Procedure'
code "survey": 'survey' from "Observation Category" display 'Survey'

//code for Condition category
code "problem-list-item": 'problem-list-item' from "Condition Category" display 'Problem List Item'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display 'Encounter Diagnosis'
code "health-concern": 'health-concern' from "US Core Condition Category" display 'Health Concern'

//code for Diagnostic Report Category
code "LAB": 'LAB' from "V2-0074" display 'Laboratory'
code "Radiology": 'LP29684-5' from "LOINC" display 'Radiology'
code "Pathology": 'LP7839-6' from "LOINC" display 'Pathology'
code "Cardiology": 'LP29708-2' from "LOINC" display 'Cardiology'

//code for Emergency Encounter Class
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

//code for Condition clinicalStatus
code "active": 'active' from "Condition Clinical Status" display 'active'

parameter "Measurement Period" 
    default Interval[@2024-04-01T00:00:00.0, @2024-04-30T23:59:59.0)

context Patient 

define "Qualifying Encounters During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
  union [Encounter: "Emergency Department Visit"]
  union [Encounter: "Observation Services"]
  union [Encounter: class in "NHSN Inpatient Encounter Class Codes"]
  union [Encounter: class ~ "emergency"]
  union [Encounter: class ~ "observation encounter"]) QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and QualifyingEncounters.period overlaps "Measurement Period" 

define "Encounters with Patient Hospital Locations":
  "Encounters" Encounters
  where exists(
    Encounters.location EncounterLocation
    where NHSNHelpers.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period overlaps Encounters.period
  )
  and Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
  and Encounters.period overlaps "Measurement Period"

define "Initial Population":
  "Qualifying Encounters During Measurement Period"
  union "Encounters with Patient Hospital Locations"

define "Encounters":
  [Encounter]

define "Conditions":
  [Condition]

define "DiagnosticReports":
  [DiagnosticReport]

define "Observations":
  [Observation]

define "Get Locations from IP Encounters in Measurement Period":
  flatten("Initial Population" IP
  let locationElements: IP.location
  return
    locationElements LE
    let locationReference: LE.location
    return NHSNHelpers.GetLocation(locationReference))

//============================================================================
//Supplemental Data Element
//When FHIR.canonical value is present, US Core 3.1.1 profiles are used
//When FHIR.canonical value is not present, FHIR Base profiles are used
//============================================================================
define "SDE Condition":
  "Conditions" Conditions 
  where exists(
    "Initial Population" IP
    //Check for Problem List Conditions that were recorded before or during IP
    where (
      Conditions.recordedDate before end of IP.period
      and exists(Conditions.category categories
        where categories ~ "problem-list-item")
      and Conditions.clinicalStatus ~ "active"
    )
    //Check for Encounter Diagnosis Conditions that reference an IP encounter
    or (
      (exists(IP.diagnosis Diagnoses
          where GetCondition(Diagnoses.condition).id = Conditions.id
        )
        or GetEncounter(Conditions.encounter).id = IP.id
      )
      and exists (Conditions.category categories
        where categories ~ "encounter-diagnosis"
          or categories ~ "health-concern")
    )
  )
  return ConditionResource(Conditions,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-condition'}},
  {"problem-list-item", "encounter-diagnosis", "health-concern"})

define "SDE Device":
  [Device] Devices 
  where exists("Initial Population")
  return DeviceResource(Devices,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-device'}})

//This block collects all DiagnosticReport resources while also marking Lab and Note DiagnosticReports with the appropriate profiles
//#Start DiagnosticReport block
define "SDE DiagnosticReport Lab":
  "DiagnosticReports" DiagnosticReports
  where (exists(DiagnosticReports.category Category where Category ~ "LAB")
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period))
  return SharedResource.DiagnosticReportLabResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-diagnosticreport-lab'}})
 
define "SDE DiagnosticReport Note":
  "DiagnosticReports" DiagnosticReports
  where ((exists(DiagnosticReports.category Category where Category ~ "Radiology"))
    or exists((DiagnosticReports.category Category where Category ~ "Pathology"))
    or exists((DiagnosticReports.category Category where Category ~ "Cardiology")))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period)
  return DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-diagnosticreport-note'}})

define "SDE DiagnosticReport Others":
  [DiagnosticReport] DiagnosticReports
  where not ((exists(DiagnosticReports.category Category where Category ~ "Radiology"))
    or exists((DiagnosticReports.category Category where Category ~ "Pathology"))
    or exists((DiagnosticReports.category Category where Category ~ "Cardiology"))
    or exists(DiagnosticReports.category Category where Category ~ "LAB"))
    and exists("Initial Population" IP
      where NHSNHelpers."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period)
  return DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-diagnosticreport'}})
//#End DiagnosticReport block

define "SDE Encounter": 
  "Encounters" Encounters
  where not CheckIP(Encounters)
  and exists(
    "Initial Population" IP
    where Encounters.period overlaps IP.period)
  return SharedResource.EncounterResource(Encounters,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter'}})

define "SDE IP Encounters":
  "Initial Population" IP
  return SharedResource.EncounterResource(IP, 
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-encounter'}})

define "SDE Location":
  "Get Locations from IP Encounters in Measurement Period" Locations
  where exists("Initial Population")
  and Locations is not null
  return SharedResource.LocationResource(Locations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-location'}})
 
define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministrations 
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(MedicationAdministrations.effective) overlaps IP.period)
  return SharedResource.MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-medicationadministration'}})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return SharedResource.MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-medicationrequest'}})

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  and exists("Initial Population") //No longer need to check for timing here because it's checked in SDE Medication Request/Administriation
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-medication'}})

define "SDE Observation Lab Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return SharedResource.ObservationLabResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation-lab'}})

//Vital Signs Observation has its own profile in FHIR Base
define "SDE Observation Vital Signs Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "vital-signs"))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationVitalSignsResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation-vitals'}})

//Defaulting to base FHIR profile as there are no individual profiles in US Core 3.1.1 that cover these Observation categories
define "SDE Observation Category":
  "Observations" Observations 
  where ((exists(Observations.category Category where Category ~ "social-history"))
    or (exists(Observations.category Category where Category ~ "survey"))
    or (exists(Observations.category Category where Category ~ "imaging"))
    or (exists(Observations.category Category where Category ~ "procedure")))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation'}})

define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" IP
    where Coverages.period overlaps IP.period)
  return SharedResource.CoverageResource(Coverages,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-coverage'}})

define "SDE Procedure":
  [Procedure] Procedures 
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(Procedures.performed) overlaps IP.period)
  return SharedResource.ProcedureResource(Procedures,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-procedure'}})

define "SDE Specimen":
  [Specimen] Specimens
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(Specimens.collection.collected) overlaps IP.period
  )
  return SharedResource.SpecimenResource(Specimens,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-specimen'}})

define "SDE Service Request":
  [ServiceRequest] ServiceRequests
  where exists("Initial Population" IP
    where ServiceRequests.authoredOn during IP.period)
  return SharedResource.ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-servicerequest'}})

define "SDE Minimal Patient":
  Patient p
  return SharedResource.PatientResource(p,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/cross-measure-patient'}})

//
//Functions
//
define function "CheckIP"(encounter Encounter):
  exists("Initial Population" IP
  where encounter.id = IP.id)

define function "GetMedicationFrom"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference)
    else
      null
  end

define function "GetMedication"(reference Reference):
  singleton from (
    [Medication] Medications
    where Medications.id = NHSNHelpers.GetId(reference.reference)
  )

define function "GetCondition"(reference Reference):
  singleton from (
    "Conditions" Conditions
    where Conditions.id = NHSNHelpers.GetId(reference.reference)
  )

define function "GetEncounter"(reference Reference):
  singleton from (
    "Encounters" Encounters
    where Encounters.id = NHSNHelpers.GetId(reference.reference)
  )

define function RemoveUnaccepted(codes List<FHIR.CodeableConcept>, accepted List<System.Code>):
	codes c
  where exists(
    accepted a
    where c ~ a
  )

define function FilterCodeableConcepts(codes List<FHIR.CodeableConcept>, accepted List<System.Code>):
	if Count(accepted) > 0
		then RemoveUnaccepted(codes, accepted)
	else codes

//
//Measure Specific Resource Creation Functions
//
define function ConditionResource(condition Condition, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  condition c
  return Condition{
    id: FHIR.id {value: 'LCR-' + c.id},
    meta: SharedResource.MetaElement(c, profileURLs),
    extension: c.extension,
    clinicalStatus: c.clinicalStatus,
    verificationStatus: c.verificationStatus,
    category: FilterCodeableConcepts(c.category, acceptedCategories),
    severity: c.severity,
    code: c.code,
    bodySite: c.bodySite,
    subject: c.subject,
    encounter: c.encounter,
    onset: c.onset,
    abatement: c.abatement,
    recordedDate: c.recordedDate,
    stage: SharedResource.ConditionStage(c.stage),
    evidence: SharedResource.ConditionEvidence(c.evidence),
    note: c.note
  }

define function DeviceUdiCarrier(udiCarrier List<FHIR.Device.UdiCarrier>):
  udiCarrier u
  return FHIR.Device.UdiCarrier{
    deviceIdentifier: u.deviceIdentifier,
    issuer: u.issuer,
    jurisdiction: u.jurisdiction,
    carrierAIDC: u.carrierAIDC,
    carrierHRF: u.carrierHRF,
    entryType: u.entryType
  }

define function DeviceDeviceName(deviceName List<FHIR.Device.DeviceName>):
  deviceName d
  return FHIR.Device.DeviceName{
    name: d.name,
    type: d.type
  }

define function DeviceSpecialization(specialization List<FHIR.Device.Specialization>):
  specialization s
  return FHIR.Device.Specialization{
    systemType: s.systemType,
    version: s.version
  }

define function DeviceVersion(version List<FHIR.Device.Version>):
  version v
  return FHIR.Device.Version{
    type: v.type,
    component: v.component,
    value: v.value
  }

define function DeviceProperty(deviceProperty List<FHIR.Device.Property>):
  deviceProperty d
  return FHIR.Device.Property{
    id: d.id,
    type: d.type,
    valueQuantity: d.valueQuantity,
    valueCode: d.valueCode
  }

define function DeviceResource(device Device, profileURLs List<FHIR.canonical>):
  device d
  return Device{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: SharedResource.MetaElement(d, profileURLs),
    extension: d.extension,
    definition: d.definition,
    udiCarrier: DeviceUdiCarrier(d.udiCarrier),
    status: d.status,
    statusReason: d.statusReason,
    distinctIdentifier: d.distinctIdentifier,
    manufacturer: d.manufacturer,
    manufactureDate: d.manufactureDate,
    expirationDate: d.expirationDate,
    lotNumber: d.lotNumber,
    serialNumber: d.serialNumber,
    deviceName: DeviceDeviceName(d.deviceName),
    modelNumber: d.modelNumber,
    partNumber: d.partNumber,
    type: d.type,
    specialization: DeviceSpecialization(d.specialization),
    version: DeviceVersion(d.version),
    property: DeviceProperty(d.property),
    patient: d.patient,
    owner: d.owner,
    contact: d.contact,
    location: d.location,
    url: d.url,
    note: d.note,
    safety: d.safety,
    parent: d.parent
  }

define function DiagnosticReportResource(diagnosticReport DiagnosticReport, profileURLs List<FHIR.canonical>):
  diagnosticReport d
  return DiagnosticReport{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: SharedResource.MetaElement(d, profileURLs),
    extension: d.extension,
    basedOn: d.basedOn,
    status: d.status,
    category: d.category,
    code: d.code,
    subject: d.subject,
    encounter: d.encounter,
    effective: d.effective,
    issued: d.issued,
    performer: d.performer,
    resultsInterpreter: d.resultsInterpreter,
    specimen: d.specimen,
    result: d.result,
    conclusion: d.conclusion,
    conclusionCode: d.conclusionCode
  }

define function ObservationResource(observation Observation, profileURLs List<FHIR.canonical>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    partOf: o.partOf,
    status: o.status,
    category: o.category,
    code: o.code,
    subject: o.subject,
    focus: o.focus,
    encounter: o.encounter,
    effective: o.effective,
    issued: o.issued,
    performer: o.performer,
    value: o.value,
    dataAbsentReason: o.dataAbsentReason,
    interpretation: o.interpretation,
    note: o.note,
    bodySite: o.bodySite,
    method: o.method,
    specimen: o.specimen,
    device: o.device,
    referenceRange: SharedResource.ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: SharedResource.ObservationComponent(o.component)
  }

define function ObservationVitalSignsCoding(coding List<Coding>):
  coding c
  return Coding{
    system: c.system,
    version: c.version,
    code: c.code,
    display: c.display,
    userSelected: c.userSelected
  }

define function ObservationVitalSignsCategory(category List<CodeableConcept>):
  category c
  return CodeableConcept{
    coding: ObservationVitalSignsCoding(c.coding),
    text: c.text
  }

define function ObservationVitalSignsComponent(component List<FHIR.Observation.Component>):
  component c
  return FHIR.Observation.Component{
    code: c.code,
    value: c.value,
    dataAbsentReason: c.dataAbsentReason,
    interpretation: c.interpretation,
    referenceRange: SharedResource.ObservationReferenceRange(c.referenceRange)
  }

define function ObservationVitalSignsResource(observation Observation, profileURLs List<FHIR.canonical>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    partOf: o.partOf,
    status: o.status,
    category: ObservationVitalSignsCategory(o.category),
    code: o.code,
    subject: o.subject,
    focus: o.focus,
    encounter: o.encounter,
    effective: o.effective,
    issued: o.issued,
    performer: o.performer,
    value: o.value,
    dataAbsentReason: o.dataAbsentReason,
    interpretation: o.interpretation,
    note: o.note,
    bodySite: o.bodySite,
    method: o.method,
    specimen: o.specimen,
    device: o.device,
    referenceRange: SharedResource.ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: ObservationVitalSignsComponent(o.component)
  }