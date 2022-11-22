library NHSNGlycemicControlHypoglycemicInitialPopulation version '0.0.003'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Specimen Type": 'http://terminology.hl7.org/CodeSystem/v2-0487'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "Condition Category": 'http://terminology.hl7.org/CodeSystem/condition-category' 

valueset "Blood Glucose Laboratory and Point of Care Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.38'
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'
valueset "Antidiabetic Medications": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'
valueset "Payer": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591' 

code "Chief Complaint": 'CC' from "Diagnosis Role" display 'Chief complaint'
code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display'encounter-diagnosis'



parameter "Measurement Period" Interval<DateTime>
 default Interval[@2022-01-01T00:00:00.0, @2022-01-31T00:00:00.0)

context Patient

/*
@author Arvind Jagannathan
*/
define "Initial Population":
  ("Inpatient Encounter"
  union "Patient Hospital Locations") InpatientEncounters
  with "Antidiabetic Drugs Administered or Ordered" ADD
  such that Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn)
      during "HospitalizationWithObservationOrEmergency"(InpatientEncounters)
    and Coalesce(start of Global."Normalize Interval"(ADD.effective), ADD.authoredOn) during "Measurement Period"

define "Inpatient Encounter":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "short stay"}]
    union [Encounter: "Encounter Inpatient"] Encounters
  where Encounters.status in {'in-progress', 'finished'}
    and Encounters.period overlaps "Measurement Period"

define "Patient Hospital Locations":
  [Encounter] Encounters
  where exists(
    Encounters.location EncounterLocation
    where Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period during Encounters.period
  )

define "Antidiabetic Drugs Administered or Ordered":
  ([MedicationAdministration] ADDMedAdmin
    where GetMedicationCode(ADDMedAdmin.medication) in "Antidiabetic Medications"
      and ADDMedAdmin.status ~ 'completed')
  union (
    [MedicationRequest] MedicationRequests
      where GetMedicationCode(MedicationRequests.medication) in "Antidiabetic Medications"
  )

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
    [Medication] M where M.id = Global.GetId(reference.reference)
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
    [Specimen] S where S.id = Global.GetId(reference.reference)
  )

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

define function "GetPatientAddress"(addresses List<FHIR.Address>):
  addresses address
  return FHIR.Address{
    postalCode: address.postalCode
  }

define function "GetDosage"(medicationRequest MedicationRequest):
  medicationRequest m
  let dosages: m.dosageInstruction
  return 
    dosages d
    return Dosage{
      timing: d.timing,
      doseAndRate: d.doseAndRate,
      route: d.route
    }

define function "getDiagnosis"(encounter Encounter):
  encounter e
  let diagnoses: e.diagnosis
  return
    diagnoses d
    where d.use ~ "Chief Complaint"
    return d
    
define function "getDischargeDisposition"(encounter Encounter):
  encounter e
  let dischargeDisposition: e.hospitalization.dischargeDisposition
  return
    dischargeDisposition d
    where d in "Discharge Disposition"
    return e.hospitalization
    
define function "getEncounterLocation"(encounter Encounter):
  encounter e
  let locations: e.location
  return
    locations l
    where l.physicalType in "Inpatient, Emergency, and Observation Locations"
    or Global.GetLocation(l.location).type in "Inpatient, Emergency, and Observation Locations"
    return l

define function "GetMedicationFrom"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference)
    else
      null
  end

//Resource Modification and Return Functions
define function "MedicationRequestResource"(medicationRequest MedicationRequest):
  medicationRequest m
  return MedicationRequest{
    id: FHIR.id {value: 'LCR-' + m.id},
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

define function "MedicationAdministrationResource"(medicationAdministration MedicationAdministration):
  medicationAdministration m
  return MedicationAdministration{
    id: FHIR.id {value: 'LCR-' + m.id},
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

define function "MedicationResource"(medication Medication):
  medication m
  return Medication{
    id: FHIR.id {value: 'LCR-' + m.id},
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

define function "ConditionResource"(condition Condition):
  condition c
  return Condition{
    id: FHIR.id {value: 'LCR-' + c.id},
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

define function "EncounterResource"(encounter Encounter):
  encounter e
  return Encounter{
    id: FHIR.id{value: 'LCR-' + e.id},
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
    communication: p.communication
  }

define function "ObservationResource"(observation Observation):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
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

define function "SpecimenResource"(specimen Specimen):
  specimen s
  return Specimen{
    id: FHIR.id {value: 'LCR-' + s.id},
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

define function "CoverageResource"(coverage Coverage):
  coverage c
  return Coverage{
    id: FHIR.id{value: 'LCR-' + c.id},
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

//Supplement Data Elements
define "SDE Blood Glucose Observation":
	[Observation: "Blood Glucose Laboratory and Point of Care Tests"] Observations 
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(Observations.effective) during InitialPopulation.period
    or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during InitialPopulation.period
  with Observations.category category
  such that category ~ "laboratory"
  return ObservationResource(Observations)

define "SDE Chief Complaint":
  "Initial Population" IP
  with IP.diagnosis InitialPopulationDiagnosis
  such that InitialPopulationDiagnosis.use ~ "Chief Complaint"
  return EncounterResource(IP)

define "SDE Condition":
  [Condition] Conditions
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Conditions.onset) overlaps InitialPopulation.period
  return ConditionResource(Conditions)
  
define "SDE Condition during Encounter":
  [Condition] ConditionEncounterDiagnosis
  with ConditionEncounterDiagnosis.category Category
  such that Category ~ "encounter-diagnosis"
    and exists("Initial Population")
  return ConditionResource(ConditionEncounterDiagnosis)
    
define "SDE Encounter Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"
  return EncounterResource(DischargeDispositions)
  
define "SDE Encounter Locations":
  "Initial Population" InitialPopulation 
  where exists ( 
    InitialPopulation.location InitialPopulationLocation
    where (Global.GetLocation(InitialPopulationLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and InitialPopulationLocation.period during InitialPopulation.period)
  )
  return EncounterResource(InitialPopulation)

define "SDE Initial Population Encounters":
  "Initial Population" IP
  return EncounterResource(IP)

define "SDE Medication":
  ("SDE Medication Request"
  union "SDE Medication Administration") MedReqOrAdmin
  return MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication))

define "SDE Medication Administration":
	[MedicationAdministration] MedicationAdministrations
  with "Initial Population" InitialPopulation
  such that start of Global."Normalize Interval"(MedicationAdministrations.effective) during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
    and start of Global."Normalize Interval"(MedicationAdministrations.effective) during "Measurement Period"
  return MedicationAdministrationResource(MedicationAdministrations)

define "SDE Medication Request":
	[MedicationRequest] MedicationRequests
  with "Initial Population" InitialPopulation
	such that MedicationRequests.authoredOn during "HospitalizationWithObservationOrEmergency"(InitialPopulation)
    and MedicationRequests.authoredOn during "Measurement Period"
  return MedicationRequestResource(MedicationRequests)

define "SDE Minimal Patient":
  Patient p
  return PatientResource(p)

define "SDE Payer": 
	[Coverage] Coverages
  with "Initial Population" InitialPopulation
  such that start of Coverages.period before end of InitialPopulation.period
  where Coverages.type in "Payer"
  return CoverageResource(Coverages)
  
define "SDE Specimen":
  [Specimen] Specimen
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(Specimen.collection.collected) during InitialPopulation.period
  return SpecimenResource(Specimen)

