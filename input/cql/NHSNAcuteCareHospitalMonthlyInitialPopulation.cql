library NHSNAcuteCareHospitalMonthlyInitialPopulation version '1.0.0-dev'

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
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "MedicationRequest Category": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'

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
//code "problem-list-item": 'problem-list-item' from "Condition Category" display 'Problem List Item'
code "encounter-diagnosis": 'encounter-diagnosis' from "Condition Category" display 'Encounter Diagnosis'
//code "health-concern": 'health-concern' from "US Core Condition Category" display 'Health Concern'

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

//code for Procedure category
code "Surgical procedure": '3877713003' from "SNOMEDCT" display 'Surgical procedure'
code "Diagnostic procedure": '103693007' from "SNOMEDCT" display 'Diagnostic procedure'

//code for MedicationRequest category
code "inpatient": 'inpatient' from "MedicationRequest Category" display 'Inpatient'
code "outpatient": 'outpatient' from "MedicationRequest Category" display 'Outpatient'

//code for ServiceRequest category (also uses Surgical procedure from Procedure categories)
code "Laboratory procedure": '108252007' from "SNOMEDCT" display 'Laboratory procedure'
code "Imaging": '363679005' from "SNOMEDCT" display 'Imaging'

parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-01-31T23:59:59.0)

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
     where 
      (exists(IP.diagnosis Diagnoses
          where GetCondition(Diagnoses.condition).id = Conditions.id
        )
        or GetEncounter(Conditions.encounter).id = IP.id
      )
      and exists (Conditions.category categories
        where categories ~ "encounter-diagnosis"
    )
  )
  return ConditionResource(Conditions,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-condition'}},
   {"encounter-diagnosis"})

define "SDE Coverage": 
	[Coverage] Coverages
  where exists(
    "Initial Population" IP
    where Coverages.period overlaps IP.period)
  return CoverageResource(Coverages,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-coverage'}})

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
  return DiagnosticReportLabResource(DiagnosticReports,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-diagnosticreport-lab'}},
  {"LAB", "Radiology", "Pathology", "Cardiology"})
 
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
  return MedicationAdministrationResource(MedicationAdministrations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-medicationadministration'}},
  {"inpatient", "outpatient"})
 
define "SDE Medication Request":
  [MedicationRequest] MedicationRequests 
  where exists(
    "Initial Population" IP
    where MedicationRequests.authoredOn during IP.period)
  return MedicationRequestResource(MedicationRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-medicationrequest'}},
  {"inpatient", "outpatient"})

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
  return ObservationLabResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation-lab'}},
  {"imaging", "procedure", "vital-signs", "laboratory"})

//Vital Signs Observation has its own profile in FHIR Base
define "SDE Observation Vital Signs Category":
  "Observations" Observations 
  where (exists(Observations.category Category where Category ~ "vital-signs"))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationVitalSignsResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation-vitals'}},
  {"imaging", "procedure", "vital-signs", "laboratory"})

//Defaulting to base FHIR profile as there are no individual profiles in US Core 3.1.1 that cover these Observation categories
define "SDE Observation Category":
  "Observations" Observations 
  where (/*(exists(Observations.category Category where Category ~ "social-history"))
    or (exists(Observations.category Category where Category ~ "survey"))
    or */(exists(Observations.category Category where Category ~ "imaging"))
    or (exists(Observations.category Category where Category ~ "procedure")))
    and exists(
      "Initial Population" IP
      where NHSNHelpers."Normalize Interval"(Observations.effective) overlaps IP.period)
  return ObservationResource(Observations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-observation'}},
  {"imaging", "procedure", "vital-signs", "laboratory"})

define "SDE Procedure":
  [Procedure] Procedures 
  where exists(
    "Initial Population" IP
    where NHSNHelpers."Normalize Interval"(Procedures.performed) overlaps IP.period)
     return ProcedureResource(Procedures,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-procedure'}},
  {"Surgical procedure", "Diagnostic procedure"})

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
  return ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-monthly-servicerequest'}},
  {"Laboratory procedure", "Surgical procedure", "Imaging"})

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
    code: c.code,
    subject: c.subject,
    encounter: c.encounter,
    onset: c.onset,
    abatement: c.abatement,
    recordedDate: c.recordedDate
  }

define function CoverageResource(coverage Coverage, profileURLs List<FHIR.canonical>):
  coverage c
  return Coverage{
    id: FHIR.id{value: 'LCR-' + c.id},
    meta: SharedResource.MetaElement(c, profileURLs),
    extension: c.extension,
    status: c.status,
    type: c.type,
    beneficiary: c.beneficiary,
    period: c.period,
    payor: c.payor
  }

define function DeviceResource(device Device, profileURLs List<FHIR.canonical>):
  device d
  return Device{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: SharedResource.MetaElement(d, profileURLs),
    extension: d.extension,
    status: d.status,
    expirationDate: d.expirationDate,
    lotNumber: d.lotNumber,
    serialNumber: d.serialNumber,
    modelNumber: d.modelNumber,
    partNumber: d.partNumber,
    type: d.type,
    patient: d.patient,
    parent: d.parent
  }

define function DiagnosticReportCoding(coding List<Coding>):
  coding c
  return Coding{
    system: c.system,
    version: c.version,
    code: c.code,
    display: c.display
  }

define function DiagnosticReportCategory(category List<CodeableConcept>):
  category c
  return CodeableConcept{
    coding: DiagnosticReportCoding(c.coding)
  }

define function DiagnosticReportLabResource(diagnosticReport DiagnosticReport, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  diagnosticReport d
  return DiagnosticReport{
    id: FHIR.id{value: 'LCR-' + d.id},
    meta: SharedResource.MetaElement(d, profileURLs),
    extension: d.extension,
    basedOn: d.basedOn,
    status: d.status,
    category: FilterCodeableConcepts(DiagnosticReportCategory(d.category), acceptedCategories),
    code: d.code,
    subject: d.subject,
    encounter: d.encounter,
    effective: d.effective,
    issued: d.issued,
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

define function EncounterHospitalization(hospitalization FHIR.Encounter.Hospitalization):
  hospitalization h
  return FHIR.Encounter.Hospitalization{
    origin: h.origin,
    admitSource: h.admitSource,
    reAdmission: h.reAdmission,
    dietPreference: h.dietPreference,
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
    reasonCode: e.reasonCode,
    diagnosis: SharedResource.EncounterDiagnosis(e.diagnosis),
    hospitalization: EncounterHospitalization(e.hospitalization),
    location: SharedResource.EncounterLocation(e.location),
    partOf: e.partOf
  }

define function LocationResource(location Location, profileURLs List<FHIR.canonical>):
  location l
  return Location{
    id: FHIR.id {value: 'LCR-' + l.id},
    meta: SharedResource.MetaElement(l, profileURLs),
    extension: l.extension,
    status: l.status,
    name: l.name,
    alias: l.alias,
    type: l.type,
    physicalType: l.physicalType,
    managingOrganization: l.managingOrganization,
    partOf: l.partOf
  }

define function MedicationRequestResource(medicationRequest MedicationRequest, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  medicationRequest m
  return MedicationRequest{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: SharedResource.MetaElement(medicationRequest, profileURLs),
    extension: m.extension,
    status: m.status,
    statusReason: m.statusReason,
    intent: m.intent,
    category: FilterCodeableConcepts(m.category, acceptedCategories),
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
    dosageInstruction: SharedResource.MedicationRequestDosageInstruction(m.dosageInstruction)
  }

  define function MedicationAdministrationResource(medicationAdministration MedicationAdministration, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  medicationAdministration m
  return MedicationAdministration{
    id: FHIR.id {value: 'LCR-' + m.id},
    meta: SharedResource.MetaElement(m, profileURLs),
    extension: m.extension,
    instantiates: m.instantiates,
    partOf: m.partOf,
    status: m.status,
    statusReason: m.statusReason,
    category: FilterCodeableConcepts({m.category}, acceptedCategories)[0],
    medication: m.medication,
    subject: m.subject,
    context: m.context,
    supportingInformation: m.supportingInformation,
    effective: m.effective,
    performer: SharedResource.MedicationAdministrationPerformer(m.performer),
    reasonCode: m.reasonCode,
    reasonReference: m.reasonReference,
    request: m.request,
    device: m.device,
    note: m.note,
    dosage: SharedResource.MedicationAdministrationDosage(m.dosage),
    eventHistory: m.eventHistory
  }

define function ObservationLabReferenceRange(referenceRange List<FHIR.Observation.ReferenceRange>):
  referenceRange rR
  return FHIR.Observation.ReferenceRange{
    low: rR.low,
    high: rR.high,
    type: rR.type,
    appliesTo: rR.appliesTo,
    age: rR.age
  }

define function ObservationLabResource(observation Observation, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    partOf: o.partOf,
    status: o.status,
    category: FilterCodeableConcepts(SharedResource.ObservationLabCategory(o.category), acceptedCategories),
    code: o.code,
    subject: o.subject,
    encounter: o.encounter,
    effective: o.effective,
    issued: o.issued,
    value: o.value,
    dataAbsentReason: o.dataAbsentReason,
    interpretation: o.interpretation,
    bodySite: o.bodySite,
    method: o.method,
    specimen: o.specimen,
    referenceRange: ObservationLabReferenceRange(o.referenceRange),
    hasMember: o.hasMember,
    derivedFrom: o.derivedFrom,
    component: SharedResource.ObservationComponent(o.component)
  }

define function ObservationReferenceRange(referenceRange List<FHIR.Observation.ReferenceRange>):
  referenceRange rR
  return FHIR.Observation.ReferenceRange{
    low: rR.low,
    high: rR.high,
    type: rR.type,
    appliesTo: rR.appliesTo,
    age: rR.age
  }

define function ObservationResource(observation Observation, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    partOf: o.partOf,
    status: o.status,
    category: FilterCodeableConcepts(o.category, acceptedCategories),
    code: o.code,
    subject: o.subject,
    encounter: o.encounter,
    effective: o.effective,
    issued: o.issued,
    value: o.value,
    dataAbsentReason: o.dataAbsentReason,
    interpretation: o.interpretation,
    bodySite: o.bodySite,
    method: o.method,
    specimen: o.specimen,
    referenceRange: ObservationReferenceRange(o.referenceRange),
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

define function ObservationVitalSignsResource(observation Observation, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  observation o
  return Observation{
    id: FHIR.id {value: 'LCR-' + o.id},
    meta: SharedResource.MetaElement(o, profileURLs),
    extension: o.extension,
    partOf: o.partOf,
    status: o.status,
    category: FilterCodeableConcepts(ObservationVitalSignsCategory(o.category), acceptedCategories),
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


define function ProcedureResource(procedure Procedure, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  procedure p
  return Procedure{
    id: FHIR.id {value: 'LCR-' + p.id},
    meta: SharedResource.MetaElement(p, profileURLs),
    extension: p.extension,
    basedOn: p.basedOn,
    partOf: p.partOf,
    status: p.status,
    category: FilterCodeableConcepts({p.category}, acceptedCategories)[0],
    code: p.code,
    subject: p.subject,
    encounter: p.encounter,
    performed: p.performed,
    location: p.location,
    reasonCode: p.reasonCode,
    reasonReference: p.reasonReference,
    bodySite: p.bodySite
  }

  define function ServiceRequestResource(serviceRequest ServiceRequest, profileURLs List<FHIR.canonical>, acceptedCategories List<System.Code>):
  serviceRequest sR
  return ServiceRequest{
    id: FHIR.id {value: 'LCR-' + sR.id},
    meta: SharedResource.MetaElement(sR, profileURLs),
    extension: sR.extension,
    basedOn: sR.basedOn,
    status: sR.status,
    intent: sR.intent,
    category: FilterCodeableConcepts(sR.category, acceptedCategories),
    priority: sR.priority,
    doNotPerform: sR.doNotPerform,
    code: sR.code,
    quantity: sR.quantity,
    subject: sR.subject,
    encounter: sR.encounter,
    occurrence: sR.occurrence,
    asNeeded: sR.asNeeded,
    authoredOn: sR.authoredOn,
    requester: sR.requester,
    specimen: sR.specimen
  }

  define function SpecimenCollection(collection FHIR.Specimen.Collection):
  collection c
  return FHIR.Specimen.Collection{
    collector: c.collector,
    collected: c.collected,
    quantity: c.quantity,
    bodySite: c.bodySite
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
    parent: s.parent,
    request: s.request,
    collection: SpecimenCollection(s.collection),
    note: s.note
  }