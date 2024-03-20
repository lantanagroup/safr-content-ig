library NHSNdQMAcuteCareHospitalInitialPopulation version '0.0.014'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include SharedResourceCreation version '0.1.005' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "LOINC": 'http://loinc.org' 
codesystem "V2-0074": 'http://terminology.hl7.org/CodeSystem/v2-0074'

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

//code for Diagnostic Report Category
code "LAB": 'LAB' from "V2-0074" display 'Laboratory'
code "Radiology": 'LP29684-5' from "LOINC" display 'Radiology'
code "Pathology": 'LP7839-6' from "LOINC" display 'Pathology'
code "Cardiology": 'LP29708-2' from "LOINC" display 'Cardiology'

parameter "Measurement Period" 
    default Interval[@2024-01-01T00:00:00.0, @2024-01-31T00:00:00.0)

context Patient 

define "Qualifying Encounters During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
  union [Encounter: "Emergency Department Visit"]
  union [Encounter: "Observation Services"]
  union [Encounter: class in "NHSN Inpatient Encounter Class Codes"]) QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and QualifyingEncounters.period overlaps "Measurement Period" 

define "Encounters with Patient Hospital Locations":
  "Encounters" Encounters
  where exists(
    Encounters.location EncounterLocation
    where Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period overlaps Encounters.period
  )
  and Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
  and Encounters.period overlaps "Measurement Period"

define "Initial Population":
  "Qualifying Encounters During Measurement Period"
  union "Encounters with Patient Hospital Locations"

define "Encounters":
  [Encounter]

define "DiagnosticReports":
  [DiagnosticReport]

define "Observations":
  [Observation]

//Double checking for IP's period during MP as IP is created out of qualifying encounters, which checks for it, 
//and encounter's locations, which doesn't
define "IP Encounters Overlap Measurement Period":
  "Initial Population" IP
  where IP.period overlaps "Measurement Period"

define "Get Locations from IP Encounters in Measurement Period":
  flatten("IP Encounters Overlap Measurement Period" Encounters
  let locationElements: Encounters.location
  return
    locationElements LE
    let locationReference: LE.location
    return Global.GetLocation(locationReference))

//============================================================================
//Supplemental Data Element
//When FHIR.canonical value is present, US Core 3.1.1 profiles are used
//When FHIR.canonical value is not present, FHIR Base profiles are used
//============================================================================
define "SDE Condition":
  [Condition] Conditions 
  where exists("Initial Population")
  return SharedResource.ConditionResource(Conditions,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-condition'}})

define "SDE Device":
  [Device] Devices 
  where exists("Initial Population")
  return DeviceResource(Devices,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-device'}})

define "SDE DiagnosticReport Lab":
  "DiagnosticReports" DiagnosticReports
  where (exists(DiagnosticReports.category Category where Category ~ "LAB")
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period))
  return SharedResource.DiagnosticReportLabResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-diagnosticreport-lab'}})
 
define "SDE DiagnosticReport Note":
  "DiagnosticReports" DiagnosticReports
  where ((exists(DiagnosticReports.category Category where Category ~ "Radiology"))
    or exists((DiagnosticReports.category Category where Category ~ "Pathology"))
    or exists((DiagnosticReports.category Category where Category ~ "Cardiology")))
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period)
  return DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-diagnosticreport-note'}})

define "SDE DiagnosticReport Others":
  [DiagnosticReport] DiagnosticReports
  where not ((exists(DiagnosticReports.category Category where Category ~ "Radiology"))
    or exists((DiagnosticReports.category Category where Category ~ "Pathology"))
    or exists((DiagnosticReports.category Category where Category ~ "Cardiology"))
    or exists(DiagnosticReports.category Category where Category ~ "LAB"))
    and exists("Initial Population" IP
      where Global."Normalize Interval"(DiagnosticReports.effective) overlaps IP.period)
  return DiagnosticReportResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-diagnosticreport'}})

define "SDE Encounter": 
  "Encounters" Encounters
  where exists(
    "Initial Population" IP
    where Encounters.period overlaps IP.period)
  return EncounterResource(Encounters,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-encounter'}})

define "SDE Location":
  "Get Locations from IP Encounters in Measurement Period" Locations
  where exists("Initial Population")
  and Locations is not null
  return SharedResource.LocationResource(Locations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-location'}})
 
define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministrations 
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(MedicationAdministrations.effective) overlaps IP.period)
  return SharedResource.MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medicationadministration'}})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return SharedResource.MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medicationrequest'}})

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  and exists("Initial Population") //No longer need to check for timing here because it's checked in SDE Medication Request/Administriation
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medication'}})

define "SDE Observation Lab Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(Observations.effective) overlaps IP.period)
  return SharedResource.ObservationLabResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-observation-lab'}})

//Vital Signs Observation has its own profile in FHIR Base
define "SDE Observation Vital Signs Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "vital-signs"))
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationVitalSignsResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-observation-vitals'}})

//Defaulting to base FHIR profile as there are no individual profiles in US Core 3.1.1 that cover these Observation categories
define "SDE Observation Category":
  "Observations" Observations 
  where ((exists(Observations.category Category where Category ~ "social-history"))
    or (exists(Observations.category Category where Category ~ "survey"))
    or (exists(Observations.category Category where Category ~ "imaging"))
    or (exists(Observations.category Category where Category ~ "procedure")))
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-observation'}})

define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" IP
    where Coverages.period overlaps IP.period)
  return SharedResource.CoverageResource(Coverages,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-coverage'}})

define "SDE Procedure":
  [Procedure] Procedures 
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(Procedures.performed) overlaps IP.period)
  return SharedResource.ProcedureResource(Procedures,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-procedure'}})

define "SDE Specimen":
  [Specimen] Specimens
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(Specimens.collection.collected) overlaps IP.period
  )
  return SharedResource.SpecimenResource(Specimens,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-specimen'}})

define "SDE Service Request":
  [ServiceRequest] ServiceRequests
  where exists("Initial Population" IP
    where ServiceRequests.authoredOn during IP.period)
  return SharedResource.ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-servicerequest'}})

define "SDE Minimal Patient":
  Patient p
  return SharedResource.PatientResource(p,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/cross-measure-patient'}})

//
//Functions
//
define function "GetMedicationFrom"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference)
    else
      null
  end

define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication] Medications
    where Medications.id = Global.GetId(reference.reference)
  )

//
//Measure Specific Resource Creation Functions
//
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

define function EncounterResource(encounter Encounter, profileURLs List<FHIR.canonical>):
  encounter e
  return Encounter{
    id: FHIR.id{value: 'LCR-' + e.id},
    meta: SharedResource.MetaElement(e, profileURLs),
    extension: e.extension,
    identifier: SharedResource.EncounterIdentifier(e.identifier),
    status: e.status,
    statusHistory: SharedResource.EncounterStatusHistory(e.statusHistory),
    class: e.class,
    classHistory: SharedResource.EncounterClassHistory(e.classHistory),
    type: e.type,
    serviceType: e.serviceType,
    priority: e.priority,
    subject: e.subject,
    period: e.period,
    length: e.length,
    reasonCode: e.reasonCode,
    reasonReference: e.reasonReference,
    diagnosis: SharedResource.EncounterDiagnosis(e.diagnosis),
    account: e.account,
    hospitalization: SharedResource.EncounterHospitalization(e.hospitalization),
    location: SharedResource.EncounterLocation(e.location),
    partOf: e.partOf
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