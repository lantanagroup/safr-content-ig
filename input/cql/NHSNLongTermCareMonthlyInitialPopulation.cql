library NHSNLongTermCareMonthlyInitialPopulation version '0.0.000'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.2' called FHIRHelpers
include NHSNHelpers version '0.0.002' called NHSNHelpers
include SharedResourceCreation version '0.1.008' called SharedResource

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
    default Interval[@2022-01-01T00:00:00.0, @2022-01-31T23:59:59.0)

context Patient 

define "Initial Population":
  "Encounters" QualifyingEncounters
  where QualifyingEncounters.period overlaps "Measurement Period" 

define "Encounters":
  [Encounter]

define "Conditions":
  [Condition]

define "DiagnosticReports":
  [DiagnosticReport]

define "Observations":
  [Observation]

//============================================================================
//Supplemental Data Element
//When FHIR.canonical value is present, US Core 3.1.1 profiles are used
//When FHIR.canonical value is not present, FHIR Base profiles are used
//============================================================================
define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" IP
    where Coverages.period overlaps IP.period)
  return SharedResource.CoverageResource(Coverages,
  {FHIR.canonical{value: ''}})

define "SDE Encounter": 
  "Encounters" Encounters
  where not CheckIP(Encounters)
  and exists(
    "Initial Population" IP
    where Encounters.period overlaps IP.period)
  return EncounterResource(Encounters,
  {FHIR.canonical{value: ''}})

define "SDE IP Encounters":
  "Initial Population" IP
  return EncounterResource(IP, 
  {FHIR.canonical{value: ''}})
 
define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministrations 
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(MedicationAdministrations.effective) overlaps IP.period)
  return SharedResource.MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: ''}})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return SharedResource.MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: ''}})

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  and exists("Initial Population") //No longer need to check for timing here because it's checked in SDE Medication Request/Administriation
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: ''}})

define "SDE Observation Lab Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return SharedResource.ObservationLabResource(Observations,
  {FHIR.canonical{value: ''}})

define "SDE Minimal Patient":
  Patient p
  return SharedResource.PatientResource(p,
  {FHIR.canonical{value: ''}})

define "SDE Specimen":
  [Specimen] Specimens
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(Specimens.collection.collected) overlaps IP.period
  )
  return SharedResource.SpecimenResource(Specimens,
  {FHIR.canonical{value: ''}})

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

//
//Measure Specific Resource Creation Functions
//
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
    period: c.period,
    payor: c.payor
  }

define function EncounterDiagnosis(diagnosis List<FHIR.Encounter.Diagnosis>):
  diagnosis d
  return FHIR.Encounter.Diagnosis{
    condition: d.condition,
    use: d.use
  }

define function EncounterHospitalization(hospitalization FHIR.Encounter.Hospitalization):
  hospitalization h
  return FHIR.Encounter.Hospitalization{
    origin: h.origin,
    admitSource: h.admitSource,
    reAdmission: h.reAdmission,
    dischargeDisposition: h.dischargeDisposition
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
    subject: e.subject,
    period: e.period,
    length: e.length,
    reasonCode: e.reasonCode,
    reasonReference: e.reasonReference,
    diagnosis: EncounterDiagnosis(e.diagnosis),
    hospitalization: EncounterHospitalization(e.hospitalization),
    location: SharedResource.EncounterLocation(e.location),
    partOf: e.partOf
  }

define function MedicationRequestTiming(timing FHIR.Timing):
  timing t
  return FHIR.Timing{
    repeat: MedicationRequestTimingRepeat(t.repeat)
  }

define function MedicationRequestTimingRepeat(repeat FHIR.Timing.Repeat):
  repeat r
  return FHIR.Timing.Repeat{
    bounds: r.bounds
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
    timing: MedicationRequestTiming(dI.timing),
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
    meta: SharedResource.MetaElement(medicationRequest, profileURLs),
    extension: m.extension,
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

define function ObservationLabCoding(coding List<Coding>):
  coding c
  return Coding{
    id: c.id,
    extension: c.extension,
    system: c.system,
    code: c.code
  }

define function ObservationLabCategory(category List<CodeableConcept>):
  category c
  return CodeableConcept{
    coding: ObservationLabCoding(c.coding),
    text: c.text
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
    referenceRange: SharedResource.ObservationReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: SharedResource.ObservationComponent(o.component)
  }

define function "GetPatientExtensions"(domainResource DomainResource):
  domainResource.extension E
  where E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    or E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    or E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-tribal-affiliation'
    or E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'
    or E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-sex'
  return E

define function PatientLink(link List<FHIR.Patient.Link>):
  link l
  return FHIR.Patient.Link{
    id: l.id,
    other: l.other,
    type: l.type
  }

define function PatientResource(patient Patient, profileURLs List<FHIR.canonical>):
  patient p
  return Patient{
    id: FHIR.id{value: 'LCR-' + p.id},
    meta: SharedResource.MetaElement(p, profileURLs),
    extension: GetPatientExtensions(p) union SharedResource.GetIdExtensions(p),
    identifier: p.identifier,
    active: p.active,
    name: SharedResource.PatientName(p.name),
    telecom: SharedResource.PatientTelecom(p.telecom),
    gender: p.gender,
    birthDate: p.birthDate,
    deceased: p.deceased,
    address: SharedResource.PatientAddress(p.address),
    maritalStatus: p.maritalStatus,
    multipleBirth: p.multipleBirth,
    photo: p.photo,
    contact: SharedResource.PatientContact(p.contact),
    communication: SharedResource.PatientCommunication(p.communication),
    generalPractitioner: p.generalPractitioner,
    managingOrganization: p.managingOrganization,
    link: PatientLink(p.link)
  }