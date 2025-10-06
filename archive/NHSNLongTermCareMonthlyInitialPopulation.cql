library NHSNLongTermCareMonthlyInitialPopulation version '2.0.0-cibuild'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.2' called FHIRHelpers
include NHSNHelpers version '0.0.002' called NHSNHelpers
include SharedResourceCreation version '0.1.010' called SharedResource

codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'

//code for Observation Category
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

parameter "Measurement Period" 
    default Interval[@2025-01-01T00:00:00.000Z, @2025-01-31T23:59:59.000Z)

context Patient 

define "Initial Population":
  [Encounter] QualifyingEncounters
  where QualifyingEncounters.period overlaps "Measurement Period" 

define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" IP
    where Coverages.period overlaps IP.period)
  return CoverageResource(Coverages,
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
  return MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: ''}})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: ''}})

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  and exists("Initial Population") //No longer need to check for timing here because it's checked in SDE Medication Request/Administriation
  return MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: ''}})

define "SDE Observation Lab Category":
  [Observation] Observations 
  where (exists(Observations.category Category where Category ~ "laboratory"))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationLabResource(Observations,
  {FHIR.canonical{value: ''}})

define "SDE Minimal Patient":
  Patient p
  return PatientResource(p,
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
    subscriber: c.subscriber,
    period: c.period
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
    hospitalization: EncounterHospitalization(e.hospitalization),
    partOf: e.partOf
  }

define function MedicationResource(medication Medication, profileURLs List<FHIR.canonical>):
  medication m
  return Medication{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: SharedResource.MetaElement(m, profileURLs),
    extension: m.extension,
    code: m.code,
    status: m.status,
    form: m.form,
    amount: m.amount,
    ingredient: SharedResource.MedicationIngredient(m.ingredient)
  }

define function MedicationAdministrationDosage(dosage FHIR.MedicationAdministration.Dosage):
  dosage d
  return FHIR.MedicationAdministration.Dosage{
    text: d.text,
    route: d.route,
    method: d.method,
    dose: d.dose
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
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    request: m.request,
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
    timing: dI.timing,
    asNeeded: dI.asNeeded,
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