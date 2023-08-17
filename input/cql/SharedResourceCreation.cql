library SharedResourceCreation version '0.1.003'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

define function "GetIdExtensions"(domainResource DomainResource):
  domainResource.extension E
  where E.url = 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension'
  return E

define function "GetPatientExtensions"(domainResource DomainResource):
  domainResource.extension E
  where E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'
    or E.url = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity'
    or E.url = 'http://hl7.org/fhir/StructureDefinition/patient-genderIdentity'
    or E.url = 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension'
  return E

define function "MetaElement"(resource Resource, profileURLs List<FHIR.canonical>):
  resource r
  return FHIR.Meta{
    extension: r.meta.extension,
    versionId: r.meta.versionId,
    lastUpdated: r.meta.lastUpdated,
    profile: profileURLs,
    security: r.meta.security,
    tag: r.meta.tag
  }

define function "MedicationRequestResource"(medicationRequest MedicationRequest, profileURLs List<FHIR.canonical>):
  medicationRequest m
  return MedicationRequest{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: MetaElement(medicationRequest, profileURLs),
    extension: m.extension,
    identifier: m.identifier,
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
    supportingInformation: m.supportingInformation,
    authoredOn: m.authoredOn,
    requester: m.requester,
    performer: m.performer,
    performerType: m.performerType,
    recorder: m.recorder,
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    instantiatesCanonical: m.instantiatesCanonical,
    instantiatesUri: m.instantiatesUri,
    basedOn: m.basedOn,
    groupIdentifier: m.groupIdentifier,
    courseOfTherapyType: m.courseOfTherapyType,
    insurance: m.insurance,
    note: m.note,
    dosageInstruction: m.dosageInstruction,
    dispenseRequest: m.dispenseRequest,
    substitution: m.substitution,
    priorPrescription: m.priorPrescription,
    detectedIssue: m.detectedIssue,
    eventHistory: m.eventHistory
  }

define function "MedicationAdministrationResource"(medicationAdministration MedicationAdministration, profileURLs List<FHIR.canonical>):
  medicationAdministration m
  return MedicationAdministration{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: MetaElement(m, profileURLs),
    extension: m.extension,
    identifier: m.identifier,
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
    performer: m.performer,
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    request: m.request,
    device: m.device,
    note: m.note,
    dosage: m.dosage,
    eventHistory: m.eventHistory
  }

define function "MedicationResource"(medication Medication, profileURLs List<FHIR.canonical>):
  medication m
  return Medication{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: MetaElement(m, profileURLs),
    extension: m.extension,
    identifier: m.identifier,
    code: m.code,
    status: m.status,
    manufacturer: m.manufacturer,
    form: m.form,
    amount: m.amount,
    ingredient: m.ingredient,
    batch: m.batch
  }

define function "ConditionResource"(condition Condition, profileURLs List<FHIR.canonical>):
  condition c
  return Condition{
    id: FHIR.id {value: 'LCR-' + c.id},
    meta: MetaElement(c, profileURLs),
    extension: c.extension,
    identifier: c.identifier,
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
    recorder: c.recorder,
    asserter: c.asserter,
    stage: c.stage,
    evidence: c.evidence,
    note: c.note
  }

define function "EncounterResource"(encounter Encounter, profileURLs List<FHIR.canonical>):
  encounter e
  return Encounter{
    id: FHIR.id{value: 'LCR-' + e.id},
    meta: MetaElement(e, profileURLs),
    extension: e.extension,
    identifier: e.identifier,
    status: e.status,
    statusHistory: e.statusHistory,
    class: e.class,
    classHistory: e.classHistory,
    type: e.type,
    serviceType: e.serviceType,
    priority: e.priority,
    subject: e.subject,
    episodeOfCare: e.episodeOfCare,
    basedOn: e.basedOn,
    participant: e.participant,
    appointment: e.appointment,
    period: e.period,
    length: e.length,
    reasonCode: e.reasonCode,
    reasonReference: e.reasonReference,
    diagnosis: e.diagnosis,
    account: e.account,
    hospitalization: e.hospitalization,
    location: e.location,
    serviceProvider: e.serviceProvider,
    partOf: e.partOf
  }

define function "PatientResource"(patient Patient, profileURLs List<FHIR.canonical>):
  patient p
  return Patient{
    id: FHIR.id{value: 'LCR-' + p.id},
    meta: MetaElement(p, profileURLs),
    extension: GetPatientExtensions(p) union GetIdExtensions(p),
    identifier: p.identifier,
    active: p.active,
    name: p.name,
    telecom: p.telecom,
    gender: p.gender,
    birthDate: p.birthDate,
    deceased: p.deceased,
    address: p.address,
    contact: p.contact,
    communication: p.communication,
    link: p.link
  }

define function "ObservationResource"(observation Observation, profileURLs List<FHIR.canonical>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: MetaElement(o, profileURLs),
    extension: o.extension,
    identifier: o.identifier,
    basedOn: o.basedOn,
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
    referenceRange: o.referenceRange,
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: o.component
  }

define function "ServiceRequestResource"(serviceRequest ServiceRequest, profileURLs List<FHIR.canonical>):
  serviceRequest sR
  return ServiceRequest{
    id: FHIR.id {value: 'LCR-' + sR.id},
    meta: MetaElement(sR, profileURLs),
    extension: sR.extension,
    identifier: sR.identifier,
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

define function "SpecimenResource"(specimen Specimen, profileURLs List<FHIR.canonical>):
  specimen s
  return Specimen{
    id: FHIR.id {value: 'LCR-' + s.id},
    meta: MetaElement(s, profileURLs),
    extension: s.extension,
    identifier: s.identifier,
    accessionIdentifier: s.accessionIdentifier,
    status: s.status,
    type: s.type,
    subject: s.subject,
    receivedTime: s.receivedTime,
    parent: s.parent,
    request: s.request,
    collection: s.collection,
    processing: s.processing,
    container: s.container,
    condition: s.condition,
    note: s.note
  }

define function "CoverageResource"(coverage Coverage, profileURLs List<FHIR.canonical>):
  coverage c
  return Coverage{
    id: FHIR.id{value: 'LCR-' + c.id},
    meta: MetaElement(c, profileURLs),
    extension: c.extension,
    identifier: c.identifier,
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
    class: c.class,
    order: c.order,
    network: c.network,
    costToBeneficiary: c.costToBeneficiary,
    subrogation: c.subrogation,
    contract: c.contract
  }

define function "ProcedureResource"(procedure Procedure, profileURLs List<FHIR.canonical>):
  procedure p
  return Procedure{
    id: FHIR.id {value: 'LCR-' + p.id},
    meta: MetaElement(p, profileURLs),
    extension: p.extension,
    identifier: p.identifier,
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
    performer: p.performer,
    location: p.location,
    reasonCode: p.reasonCode,
    reasonReference: p.reasonReference,
    bodySite: p.bodySite,
    outcome: p.outcome,
    report: p.report,
    complication: p.complication,
    followUp: p.followUp,
    note: p.note,
    focalDevice: p.focalDevice,
    usedReference: p.usedReference,
    usedCode: p.usedCode
  }

define function "LocationResource"(location Location, profileURLs List<FHIR.canonical>):
  location l
  return Location{
    id: FHIR.id {value: 'LCR-' + l.id},
    meta: MetaElement(l, profileURLs),
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
    address: l.address,
    physicalType: l.physicalType,
    position: l.position,
    managingOrganization: l.managingOrganization,
    partOf: l.partOf,
    hoursOfOperation: l.hoursOfOperation,
    availabilityExceptions: l.availabilityExceptions,
    endpoint: l.endpoint
  }

define function "DiagnosticReportResource"(diagnosticReport DiagnosticReport, profileURLs List<FHIR.canonical>):
  diagnosticReport d
  return DiagnosticReport{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: MetaElement(d, profileURLs),
    extension: d.extension,
    identifier: d.identifier,
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
    imagingStudy: d.imagingStudy,
    media: d.media,
    conclusion: d.conclusion,
    conclusionCode: d.conclusionCode,
    presentedForm: d.presentedForm
  }

define function "DeviceResource"(device Device, profileURLs List<FHIR.canonical>):
  device d
  return Device{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: MetaElement(d, profileURLs),
    extension: d.extension,
    identifier: d.identifier,
    definition: d.definition,
    udiCarrier: d.udiCarrier,
    status: d.status,
    statusReason: d.statusReason,
    distinctIdentifier: d.distinctIdentifier,
    manufacturer: d.manufacturer,
    manufactureDate: d.manufactureDate,
    expirationDate: d.expirationDate,
    lotNumber: d.lotNumber,
    serialNumber: d.serialNumber,
    deviceName: d.deviceName,
    modelNumber: d.modelNumber,
    partNumber: d.partNumber,
    type: d.type,
    specialization: d.specialization,
    version: d.version,
    property: d.property,
    patient: d.patient,
    owner: d.owner,
    contact: d.contact,
    location: d.location,
    url: d.url,
    note: d.note,
    safety: d.safety,
    parent: d.parent
  }

define function "OperationOutcomeResource"(errorId String, resourceId FHIR.id, message String):
  OperationOutcome{
      id: FHIR.id{value: errorId},
      issue: {
          FHIR.OperationOutcome.Issue{
          severity: FHIR.IssueSeverity{value: 'error'},
          code: FHIR.IssueType{value: 'exception'},
          details: 
              FHIR.CodeableConcept{
                  coding: {
                      Coding{
                      system: uri{value: 'https://lantanagroup.com/validation-error'},
                      code: code{value: 'Error'},
                      display: string{value: 'Resource ' + resourceId.value + ' failed validation: ' + message}
                      }
                  }
              }
          }
      }
  }