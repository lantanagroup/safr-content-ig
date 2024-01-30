library NHSNdQMAcuteCareHospitalInitialPopulation version '0.0.008'

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

//create a valueset for this block
//------------------
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'
//------------------

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

define "Qualifying Encounters During Measurement Period":
 ( [Encounter: "Encounter Inpatient"]
  union [Encounter: "Emergency Department Visit"]
  union [Encounter: "Observation Services"]
  union [Encounter: class in {"emergency", "inpatient acute", "inpatient encounter", "inpatient non-acute", "short stay"}]) QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and QualifyingEncounters.period overlaps "Measurement Period" 

//potentially an issue as this may pull ALL EXISTING ENCOUNTERS (no period to look against)
define "Encounters with Patient Hospital Locations":
  "Encounters" Encounters
  where exists(
    Encounters.location EncounterLocation
    where Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period overlaps Encounters.period
  )
  and Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
  // and Encounters.period overlaps "Measurement Period" (?)

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
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(Conditions.onset) overlaps IP.period)
  return ConditionResource(Conditions,
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
  return DiagnosticReportLabResource(DiagnosticReports,
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
  return SharedResource.DiagnosticReportResource(DiagnosticReports,
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
  return LocationResource(Locations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-location'}})
 
define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministrations 
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(MedicationAdministrations.effective) overlaps IP.period)
  return MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medicationadministration'}})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medicationrequest'}})

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  and exists("Initial Population") //No longer need to check for timing here because it's checked in SDE Medication Request/Administriation
  return MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-medication'}})

define "SDE Observation Lab Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists(
      "Initial Population" IP
      where Global."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationLabResource(Observations,
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
  return CoverageResource(Coverages,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-coverage'}})

define "SDE Procedure":
  [Procedure] Procedures 
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(Procedures.performed) overlaps IP.period)
  return ProcedureResource(Procedures,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-procedure'}})

define "SDE Specimen":
  [Specimen] Specimens
  where exists(
    "Initial Population" IP
    where Global."Normalize Interval"(Specimens.collection.collected) overlaps IP.period
  )
  return SpecimenResource(Specimens,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-specimen'}})

define "SDE Service Request":
  [ServiceRequest] ServiceRequests
  where exists("Initial Population" IP
    where ServiceRequests.authoredOn during IP.period)
  return ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-servicerequest'}})

define "SDE Minimal Patient":
  Patient p
  return PatientResource(p,
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
    [Medication: id in {Global.GetId(reference.reference)}]
  )

//
//Measure Specific Resource Creation Functions
//
define function ConditionStage(stage List<FHIR.Condition.Stage>):
  stage s
  return FHIR.Condition.Stage{
    summary: s.summary,
    assessment: s.assessment,
    type: s.type
  }

define function ConditionEvidence(evidence List<FHIR.Condition.Evidence>):
  evidence e
  return FHIR.Condition.Evidence{
    code: e.code,
    detail: e.detail
  }

define function ConditionResource(condition Condition, profileURLs List<FHIR.canonical>):
  condition c
  return Condition{
    id: FHIR.id {value: 'LCR-' + c.id},
    meta: SharedResource.MetaElement(c, profileURLs),
    extension: c.extension,
    clinicalStatus: c.clinicalStatus,
    verificationStatus: c.verificationStatus,
    category: c.category,
    severity: c.severity,
    code: c.code,
    bodySite: c.bodySite,
    subject: c.subject,
    encounter: c.encounter,
    onset: c.onset,
    abatement: c.abatement,
    recordedDate: c.recordedDate,
    stage: ConditionStage(c.stage),
    evidence: ConditionEvidence(c.evidence),
    note: c.note
  }

define function CoverageClass(class List<FHIR.Coverage.Class>):
  class c
  return FHIR.Coverage.Class{
    value: c.value,
    name: c.name
  }

define function CoverageResource(coverage Coverage, profileURLs List<FHIR.canonical>):
  coverage c
  return Coverage{
    id: FHIR.id{value: 'LCR-' + c.id},
    meta: SharedResource.MetaElement(c, profileURLs),
    extension: c.extension,
    status: c.status,
    type: c.type,
    policyHolder: c.policyHolder,
    subscriber: c.subscriber,
    subscriberId: c.subscriberId,
    beneficiary: c.beneficiary,
    dependent: c.dependent,
    relationship: c.relationship,
    period: c.period,
    payor: c.payor,
    class: CoverageClass(c.class),
    order: c.order,
    network: c.network,
    subrogation: c.subrogation,
    contract: c.contract
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

define function DiagnosticReportCoding(coding List<Coding>):
  coding c
  return Coding{
    system: c.system,
    version: c.version,
    code: c.code,
    display: c.display,
    userSelected: c.userSelected
  }

define function DiagnosticReportCategory(category List<CodeableConcept>):
  category c
  return CodeableConcept{
    coding: DiagnosticReportCoding(c.coding)
  }

define function DiagnosticReportLabResource(diagnosticReport DiagnosticReport, profileURLs List<FHIR.canonical>):
  diagnosticReport d
  return DiagnosticReport{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: SharedResource.MetaElement(d, profileURLs),
    extension: d.extension,
    basedOn: d.basedOn,
    status: d.status,
    category: DiagnosticReportCategory(d.category),
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

define function EncounterIdentifier(identifier List<FHIR.Identifier>):
  identifier i
  return FHIR.Identifier{
    use: i.use,
    type: i.type,
    system: i.system,
    value: i.value,
    period: i.period
  }

define function EncounterStatusHistory(statusHistory List<FHIR.Encounter.StatusHistory>):
  statusHistory sH
  return FHIR.Encounter.StatusHistory{
    status: sH.status,
    period: sH.period
  }

define function EncounterClassHistory(classHistory List<FHIR.Encounter.ClassHistory>):
  classHistory cH
  return FHIR.Encounter.ClassHistory{
    class: cH.class,
    period: cH.period
  }

define function EncounterParticipant(participant List<FHIR.Encounter.Participant>):
  participant p
  return FHIR.Encounter.Participant{
    type: p.type,
    period: p.period,
    individual: p.individual
  }

define function EncounterDiagnosis(diagnosis List<FHIR.Encounter.Diagnosis>):
  diagnosis d
  return FHIR.Encounter.Diagnosis{
    condition: d.condition,
    use: d.use,
    rank: d.rank
  }

define function EncounterHospitalization(hospitalization FHIR.Encounter.Hospitalization):
  hospitalization h
  return FHIR.Encounter.Hospitalization{
    preAdmissionIdentifier: h.preAdmissionIdentifier,
    origin: h.origin,
    admitSource: h.admitSource,
    reAdmission: h.reAdmission,
    dietPreference: h.dietPreference,
    specialCourtesy: h.specialCourtesy,
    specialArrangement: h.specialArrangement,
    destination: h.destination,
    dischargeDisposition: h.dischargeDisposition
  }

define function EncounterLocation(location List<FHIR.Encounter.Location>):
  location l
  return FHIR.Encounter.Location{
    location: l.location,
    status: l.status,
    physicalType: l.physicalType,
    period: l.period
  }

define function EncounterResource(encounter Encounter, profileURLs List<FHIR.canonical>):
  encounter e
  return Encounter{
    id: FHIR.id{value: 'LCR-' + e.id},
    meta: SharedResource.MetaElement(e, profileURLs),
    extension: e.extension,
    identifier: EncounterIdentifier(e.identifier),
    status: e.status,
    statusHistory: EncounterStatusHistory(e.statusHistory),
    class: e.class,
    classHistory: EncounterClassHistory(e.classHistory),
    type: e.type,
    serviceType: e.serviceType,
    priority: e.priority,
    subject: e.subject,
    participant: EncounterParticipant(e.participant),
    period: e.period,
    length: e.length,
    reasonCode: e.reasonCode,
    reasonReference: e.reasonReference,
    diagnosis: EncounterDiagnosis(e.diagnosis),
    account: e.account,
    hospitalization: EncounterHospitalization(e.hospitalization),
    location: EncounterLocation(e.location),
    partOf: e.partOf
  }

define function ObservationLabCoding(coding List<Coding>):
  coding c
  return Coding{
    id: c.id,
    extension: c.extension,
    system: c.system,
    version: c.version,
    code: c.code,
    display: c.display,
    userSelected: c.userSelected
  }

define function ObservationLabCategory(category List<CodeableConcept>):
  category c
  return CodeableConcept{
    coding: ObservationLabCoding(c.coding),
    text: c.text
  }

define function ObservationReferenceRange(referenceRange List<FHIR.Observation.ReferenceRange>):
  referenceRange rR
  return FHIR.Observation.ReferenceRange{
    low: rR.low,
    high: rR.high,
    type: rR.type,
    appliesTo: rR.appliesTo,
    age: rR.age,
    text: rR.text
  }

define function ObservationComponent(component List<FHIR.Observation.Component>):
  component c
  return FHIR.Observation.Component{
    code: c.code,
    value: c.value,
    dataAbsentReason: c.dataAbsentReason,
    interpretation: c.interpretation,
    referenceRange: c.referenceRange
  }

define function ObservationLabResource(observation Observation, profileURLs List<FHIR.canonical>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    basedOn: o.basedOn,
    partOf: o.partOf,
    status: o.status,
    category: ObservationLabCategory(o.category),
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
    referenceRange: ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: ObservationComponent(o.component)
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
    referenceRange: ObservationReferenceRange(c.referenceRange)
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
    referenceRange: ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: ObservationVitalSignsComponent(o.component)
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
    referenceRange: ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: ObservationComponent(o.component)
  }

define function LocationAddress(address FHIR.Address):
  address a
  return FHIR.Address{
    use: a.use,
    type: a.type,
    text: a.text,
    line: a.line,
    city: a.city,
    district: a.district,
    state: a.state,
    postalCode: a.postalCode,
    country: a.country,
    period: a.period
  }

define function LocationPosition(position FHIR.Location.Position):
  position p
  return FHIR.Location.Position{
    longitude: p.longitude,
    latitude: p.latitude,
    altitude: p.altitude
  }

define function LocationHoursOfOperation(hoursOfOperation List<FHIR.Location.HoursOfOperation>):
  hoursOfOperation hOO
  return FHIR.Location.HoursOfOperation{
    daysOfWeek: hOO.daysOfWeek,
    allDay: hOO.allDay,
    openingTime: hOO.openingTime,
    closingTime: hOO.closingTime
  }

define function LocationResource(location Location, profileURLs List<FHIR.canonical>):
  location l
  return Location{
    id: FHIR.id {value: 'LCR-' + l.id},
    meta: SharedResource.MetaElement(l, profileURLs),
    extension: l.extension,
    identifier: l.identifier,
    status: l.status,
    operationalStatus: l.operationalStatus,
    name: l.name,
    alias: l.alias,
    description: l.description,
    mode: l.mode,
    type: l.type,
    telecom: l.telecom,
    address: LocationAddress(l.address),
    physicalType: l.physicalType,
    position: LocationPosition(l.position),
    managingOrganization: l.managingOrganization,
    partOf: l.partOf,
    hoursOfOperation: LocationHoursOfOperation(l.hoursOfOperation),
    availabilityExceptions: l.availabilityExceptions,
    endpoint: l.endpoint
  }

define function MedicationIngredient(ingredient List<FHIR.Medication.Ingredient>):
  ingredient i
  return FHIR.Medication.Ingredient{
    item: i.item,
    strength: i.strength
  }

define function MedicationBatch(batch FHIR.Medication.Batch):
  batch b
  return FHIR.Medication.Batch{
    lotNumber: b.lotNumber,
    expirationDate: b.expirationDate
  }

define function MedicationResource(medication Medication, profileURLs List<FHIR.canonical>):
  medication m
  return Medication{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: SharedResource.MetaElement(m, profileURLs),
    extension: m.extension,
    code: m.code,
    status: m.status,
    manufacturer: m.manufacturer,
    form: m.form,
    amount: m.amount,
    ingredient: MedicationIngredient(m.ingredient),
    batch: MedicationBatch(m.batch)
  }

define function MedicationAdministrationPerformer(performer List<FHIR.MedicationAdministration.Performer>):
  performer p
  return FHIR.MedicationAdministration.Performer{
    function: p.function,
    actor: p.actor
  }

define function MedicationAdministrationDosage(dosage FHIR.MedicationAdministration.Dosage):
  dosage d
  return FHIR.MedicationAdministration.Dosage{
    text: d.text,
    site: d.site,
    route: d.route,
    method: d.method,
    dose: d.dose,
    rate: d.rate
  }

define function MedicationAdministrationResource(medicationAdministration MedicationAdministration, profileURLs List<FHIR.canonical>):
  medicationAdministration m
  return MedicationAdministration{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: SharedResource.MetaElement(m, profileURLs),
    extension: m.extension,
    instantiates: m.instantiates,
    partOf: m.partOf,
    status: m.status,
    statusReason: m.statusReason,
    category: m.category,
    medication: m.medication,
    subject: m.subject,
    context: m.context,
    supportingInformation: m.supportingInformation,
    effective: m.effective,
    performer: MedicationAdministrationPerformer(m.performer),
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    request: m.request,
    device: m.device,
    note: m.note,
    dosage: MedicationAdministrationDosage(m.dosage),
    eventHistory: m.eventHistory
  }

define function MedicationRequestDoseAndRate(doseAndRate List<FHIR.Dosage.DoseAndRate>):
  doseAndRate dR
  return FHIR.Dosage.DoseAndRate{
    type: dR.type,
    dose: dR.dose,
    rate: dR.rate
  }

define function MedicationRequestDosageInstruction(dosageInstruction List<FHIR.Dosage>):
  dosageInstruction dI
  return FHIR.Dosage{
    text: dI.text,
    patientInstruction: dI.patientInstruction,
    timing: dI.timing,
    asNeeded: dI.asNeeded,
    site: dI.site,
    route: dI.route,
    method: dI.method,
    doseAndRate: MedicationRequestDoseAndRate(dI.doseAndRate)
  }

define function MedicationRequestResource(medicationRequest MedicationRequest, profileURLs List<FHIR.canonical>):
  medicationRequest m
  return MedicationRequest{
    id: FHIR.id {value: 'LCR-' + m.id},
    extension: m.extension,
    meta: SharedResource.MetaElement(medicationRequest, profileURLs),
    status: m.status,
    statusReason: m.statusReason,
    intent: m.intent,
    category: m.category,
    priority: m.priority,
    doNotPerform: m.doNotPerform,
    reported: m.reported,
    medication: m.medication,
    subject: m.subject,
    encounter: m.encounter,
    authoredOn: m.authoredOn,
    requester: m.requester,
    recorder: m.recorder,
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    instantiatesCanonical: m.instantiatesCanonical,
    instantiatesUri: m.instantiatesUri,
    courseOfTherapyType: m.courseOfTherapyType,
    dosageInstruction: MedicationRequestDosageInstruction(m.dosageInstruction)
  }

define function PatientIdentifier(identifier List<FHIR.Identifier>):
  identifier i
  return FHIR.Identifier{
    id: i.id,
    extension: i.extension,
    use: i.use,
    type: i.type,
    system: i.system,
    value: i.value,
    period: i.period,
    assigner: i.assigner
  }

define function PatientName(name List<FHIR.HumanName>):
  name n
  return FHIR.HumanName{
    id: n.id,
    extension: n.extension,
    use: n.use,
    text: n.text,
    family: n.family,
    given: n.given,
    prefix: n.prefix,
    suffix: n.suffix,
    period: n.period
  }

define function PatientTelecom(telecom List<FHIR.ContactPoint>):
  telecom t
  return FHIR.ContactPoint{
    system: t.system,
    value: t.value,
    use: t.use,
    rank: t.rank,
    period: t.period
  }

define function PatientAddress(address List<FHIR.Address>):
  address a
  return FHIR.Address{
    id: a.id,
    extension: a.extension,
    use: a.use,
    type: a.type,
    text: a.text,
    line: a.line,
    city: a.city,
    district: a.district,
    state: a.state,
    postalCode: a.postalCode,
    country: a.country,
    period: a.period
  }

define function PatientContact(contact List<FHIR.Patient.Contact>):
  contact c
  return FHIR.Patient.Contact{
    id: c.id,
    extension: c.extension,
    relationship: c.relationship,
    name: c.name,
    telecom: c.telecom,
    address: c.address,
    gender: c.gender,
    organization: c.organization,
    period: c.period
  }

define function PatientCommunication(communication List<FHIR.Patient.Communication>):
  communication c
  return FHIR.Patient.Communication{
    id: c.id,
    extension: c.extension,
    language: c.language,
    preferred: c.preferred
  }

define function PatientLink(link List<FHIR.Patient.Link>):
  link l
  return FHIR.Patient.Link{
    id: l.id,
    extension: l.extension,
    modifierExtension: l.modifierExtension,
    other: l.other,
    type: l.type
  }

define function PatientResource(patient Patient, profileURLs List<FHIR.canonical>):
  patient p
  return Patient{
    id: FHIR.id{value: 'LCR-' + p.id},
    meta: SharedResource.MetaElement(p, profileURLs),
    extension: SharedResource.GetPatientExtensions(p) union SharedResource.GetIdExtensions(p),
    identifier: PatientIdentifier(p.identifier),
    active: p.active,
    name: PatientName(p.name),
    telecom: PatientTelecom(p.telecom),
    gender: p.gender,
    birthDate: p.birthDate,
    deceased: p.deceased,
    address: PatientAddress(p.address),
    maritalStatus: p.maritalStatus,
    multipleBirth: p.multipleBirth,
    photo: p.photo,
    contact: PatientContact(p.contact),
    communication: PatientCommunication(p.communication),
    generalPractitioner: p.generalPractitioner,
    managingOrganization: p.managingOrganization,
    link: PatientLink(p.link)
  }

define function ProcedurePerformer(performer List<FHIR.Procedure.Performer>):
  performer p
  return FHIR.Procedure.Performer{
    function: p.function,
    actor: p.actor,
    onBehalfOf: p.onBehalfOf
  }

define function ProcedureFocalDevice(device List<FHIR.Procedure.FocalDevice>):
  device d
  return FHIR.Procedure.FocalDevice{
    action: d.action,
    manipulated: d.manipulated
  }

define function ProcedureResource(procedure Procedure, profileURLs List<FHIR.canonical>):
  procedure p
  return Procedure{
    id: FHIR.id {value: 'LCR-' + p.id},
    meta: SharedResource.MetaElement(p, profileURLs),
    extension: p.extension,
    instantiatesCanonical: p.instantiatesCanonical,
    instantiatesUri: p.instantiatesUri,
    basedOn: p.basedOn,
    partOf: p.partOf,
    status: p.status,
    statusReason: p.statusReason,
    category: p.category,
    code: p.code,
    subject: p.subject,
    encounter: p.encounter,
    performed: p.performed,
    recorder: p.recorder,
    asserter: p.asserter,
    performer: ProcedurePerformer(p.performer),
    location: p.location,
    reasonCode: p.reasonCode,
    reasonReference: p.reasonReference,
    bodySite: p.bodySite,
    outcome: p.outcome,
    report: p.report,
    complication: p.complication,
    complicationDetail: p.complicationDetail,
    followUp: p.followUp,
    note: p.note,
    focalDevice: ProcedureFocalDevice(p.focalDevice),
    usedReference: p.usedReference,
    usedCode: p.usedCode
  }

define function ServiceRequestResource(serviceRequest ServiceRequest, profileURLs List<FHIR.canonical>):
  serviceRequest sR
  return ServiceRequest{
    id: FHIR.id {value: 'LCR-' + sR.id},
    meta: SharedResource.MetaElement(sR, profileURLs),
    extension: sR.extension,
    instantiatesCanonical: sR.instantiatesCanonical,
    instantiatesUri: sR.instantiatesUri,
    basedOn: sR.basedOn,
    replaces: sR.replaces,
    requisition: sR.requisition,
    status: sR.status,
    intent: sR.intent,
    category: sR.category,
    priority: sR.priority,
    doNotPerform: sR.doNotPerform,
    code: sR.code,
    orderDetail: sR.orderDetail,
    quantity: sR.quantity,
    subject: sR.subject,
    encounter: sR.encounter,
    occurrence: sR.occurrence,
    asNeeded: sR.asNeeded,
    authoredOn: sR.authoredOn,
    requester: sR.requester,
    performerType: sR.performerType,
    performer: sR.performer,
    locationCode: sR.locationCode,
    locationReference: sR.locationReference,
    reasonCode: sR.reasonCode,
    reasonReference: sR.reasonReference,
    insurance: sR.insurance,
    supportingInfo: sR.supportingInfo,
    specimen: sR.specimen,
    bodySite: sR.bodySite,
    note: sR.note,
    patientInstruction: sR.patientInstruction,
    relevantHistory: sR.relevantHistory
  }

define function SpecimenCollection(collection FHIR.Specimen.Collection):
  collection c
  return FHIR.Specimen.Collection{
    collector: c.collector,
    collected: c.collected,
    //duration: c.duration, Does not parse for some reason? Need to bring up with SmileCDR
    quantity: c.quantity,
    method: c.method,
    bodySite: c.bodySite,
    fastingStatus: c.fastingStatus
  }

define function SpecimenProcessing(processing List<FHIR.Specimen.Processing>):
  processing p
  return FHIR.Specimen.Processing{
    description: p.description,
    procedure: p.procedure,
    additive: p.additive,
    time: p.time
  }

define function SpecimenContainer(container List<FHIR.Specimen.Container>):
  container c
  return FHIR.Specimen.Container{
    description: c.description,
    type: c.type,
    capacity: c.capacity,
    specimenQuantity: c.specimenQuantity,
    additive: c.additive
  }

define function SpecimenResource(specimen Specimen, profileURLs List<FHIR.canonical>):
  specimen s
  return Specimen{
    id: FHIR.id {value: 'LCR-' + s.id},
    meta: SharedResource.MetaElement(s, profileURLs),
    extension: s.extension,
    identifier: s.identifier,
    accessionIdentifier: s.accessionIdentifier,
    status: s.status,
    type: s.type,
    subject: s.subject,
    receivedTime: s.receivedTime,
    parent: s.parent,
    request: s.request,
    collection: SpecimenCollection(s.collection),
    processing: SpecimenProcessing(s.processing),
    container: SpecimenContainer(s.container),
    condition: s.condition,
    note: s.note
  }