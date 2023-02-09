library NHSNRespiratoryPathogenSurveillanceInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SharedResourceCreation version '0.0.001' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "LOINC": 'http://loinc.org' 
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category' 
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265' 
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143' 

//===========================================
//New valuese start
//===========================================
//Flu Tests for lab
valueset "Influenza (Tests for influenza A or B virus Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.336'
valueset "Influenza (Tests for influenza A or B virus Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.337'

//Flu Test Result
valueset "Influenza (influenza A or B virus in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.340'

//Covid Tests for lab
valueset "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1142'
valueset "COVID_19 (Tests for SARS_CoV_2 Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1158'

//Covid Test result
valueset "COVID_19 (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1143'

//RSV Tests for lab
valueset "RSV (Tests for RSV Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1311'
valueset "RSV (Tests for RSV Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1312'

//RSV Test result
valueset "RSV (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1308'

//???Test result shared among Covid, Flu and RSV
valueset "LIVD SARS CoV2 Test Result Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1114.10'

//???FLU and Covid medication
valueset "Oseltamivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2078'

//COVID medication
valueset "Baricitinib": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2046'
valueset "Anakinra": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2054'
valueset "Sarilumab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2084'
valueset "COVID19 RxNorm Value Set for Tocilizumab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2087'
valueset "Casirivimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2097'
valueset "Imdevimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2098'
valueset "Bamlanivimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2099'
valueset "Etesevimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2100'
valueset "Sotrovimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2101'
valueset "Tofacitinib": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2102'
valueset "Casirivimab / Imdevimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2103'
valueset "Molnupiravir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2119'
valueset "Remdesivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2081'
valueset "Nirmatrelvir / Ritonavir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2104'
valueset "Bebtelovimab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2105'


valueset "Transmission Based Precaution Types": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.10.20.22.5.300'

//==========================
//new valueset end
//==========================

//====================================
// ??? There is not medication for RSV
//====================================


code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

parameter "Measurement Period" 
  default Interval[@2022-01-01T00:00:00.0, @2022-01-02T00:00:00.0)

context Patient

define "Qualifying Encounter During Measurement Period":
  ( "EncounterInpatient"
  union "EncounterObservation") QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged'}
    and QualifyingEncounters.period overlaps "Measurement Period"

define "Inpatient and Observation Encounters that ended within the last twenty four Hours":
  ( "EncounterInpatient"
    union "EncounterObservation") QualifyingEncounters
      where end of QualifyingEncounters.period during "CalendarDayOfOrDayBefore" (end of QualifyingEncounters.period)

define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Inpatient and Observation Encounters that ended within the last twenty four Hours"

define "EncounterInpatient":
  [Encounter: "Encounter Inpatient"]

define "EncounterObservation":
  [Encounter: "Observation Services"]

define "SDE Minimal Patient":
  Patient p
  where exists("Initial Population")
  return SharedResource.PatientResource(p)

define "SDE Location":
  [Location] Locations
  where exists("Initial Population")
  return SharedResource.LocationResource(Locations)

define "SDE Medication Administration":
  [MedicationAdministration] MedicationAdministration
  with "Initial Population" InitialPopulation
  such that Global."Normalize Interval"(MedicationAdministration.effective) during InitialPopulation.period

define "SDE Medication Request":
  [MedicationRequest] MedicationRequest
  with "Initial Population" InitialPopulation 
  such that Global."Normalize Interval"(MedicationRequest.authoredOn) during InitialPopulation.period

//Observation for Lab test and result
define "influenza A or B virus Nucleic Acid Observation":
  [Observation: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "influenza A or B virus Antigen Observation":
  [Observation: "Influenza (Tests for influenza A or B virus Antigen)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "SARS_CoV_2 Nucleic Acid Observation":
  [Observation: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "SARS_CoV_2 Antigen Observation":
  [Observation: "COVID_19 (Tests for SARS_CoV_2 Antigen)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "RSV Nucleic Acid Observation":
  [Observation: "RSV (Tests for RSV Nucleic Acid)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "SDE RSV Antigen Observation":
  [Observation: "RSV (Tests for RSV Antigen)"] Observations
    where (start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period")
      and exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")
return SharedResource.ObservationResource(Observations)
  
/*
define "SDE Observation For All RPS Test":
  ("SARS_CoV_2 Nucleic Acid Observation"
  union 
    "SARS_CoV_2 Antigen Observation"
  union
    "influenza A or B virus Nucleic Acid Observation"
  union 
    "influenza A or B virus Antigen Observation"
  union
    "RSV Nucleic Acid Observation"
  union 
    "RSV Antigen Observation") Observations
  return SharedResource.ObservationResource(Observations)
*/

//Diagonostic Report for test and result
define "SARS_CoV_2 Nucleic Acid Diagnostic Report":
  [DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "SARS_CoV_2 Antigen Diagnostic Report":
  [DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Antigen)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "influenza A or B virus Nucleic Acid Diagnostic Report":
  [DiagnosticReport: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "influenza A or B virus Antigen Diagnostic Report":
  [DiagnosticReport: "Influenza (Tests for influenza A or B virus Antigen)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "RSV Nucleic Acid Diagnostic Report":
  [DiagnosticReport: "RSV (Tests for RSV Nucleic Acid)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "RSV Antigen Diagnostic Report":
  [DiagnosticReport: "RSV (Tests for RSV Antigen)"] DiagnosticReports
    where start of Global."Normalize Interval"(DiagnosticReports.effective) during "Measurement Period"
      and DiagnosticReports.status in {'final'}
      and exists("Initial Population")

define "SDE Diagnostic Report For All RPS Test":
  ("SARS_CoV_2 Nucleic Acid Diagnostic Report"
  union
    "SARS_CoV_2 Antigen Diagnostic Report"
  union
    "influenza A or B virus Nucleic Acid Diagnostic Report"
  union
    "influenza A or B virus Antigen Diagnostic Report"
  union
    "RSV Nucleic Acid Diagnostic Report"
  union
    "RSV Antigen Diagnostic Report") DiagnosticReports
  return SharedResource.DiagnosticReportResource(DiagnosticReports)

//ServiceRequest - order
define "SARS_CoV_2 Nucleic Acid ServiceRequest":
  [ServiceRequest: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "SARS_CoV_2 Antigen ServiceRequest":
  [ServiceRequest: "COVID_19 (Tests for SARS_CoV_2 Antigen)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "influenza A or B virus Nucleic Acid ServiceRequest":
  [ServiceRequest: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "influenza A or B virus Antigen ServiceRequest":
  [ServiceRequest: "Influenza (Tests for influenza A or B virus Antigen)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "RSV Nucleic Acid ServiceRequest":
  [ServiceRequest: "RSV (Tests for RSV Nucleic Acid)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "RSV Antigen ServiceRequest":
  [ServiceRequest: "RSV (Tests for RSV Antigen)"] ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")

define "SDE ServiceRequest For All RPS Lab Order":
  ("SARS_CoV_2 Nucleic Acid ServiceRequest"
  union
    "SARS_CoV_2 Antigen ServiceRequest"
  union
    "influenza A or B virus Nucleic Acid ServiceRequest"
  union
    "influenza A or B virus Antigen ServiceRequest"
  union
    "RSV Nucleic Acid ServiceRequest"
  union
    "RSV Antigen ServiceRequest") ServiceRequests
  return SharedResource.ServiceRequestResource(ServiceRequests)

//Procedure for Isolation Precautions
define "SDE Isolation Precautions Implemented":
  [Procedure: "Transmission Based Precaution Types"] IsolationPrecautions
    where Global."Normalize Interval"(IsolationPrecautions.performed) during "Measurement Period"
    and exists("Initial Population")
  return SharedResource.ProcedureResource(IsolationPrecautions)
   

define function "GetSpecimen"(reference Reference ):
  singleton from (
    [Specimen] S where S.id = Global.GetId(reference.reference)
  )

define function "CalendarDayOfOrDayBefore"(StartValue DateTime ):
  Interval["TruncateTime"( StartValue ), "TruncateTime"( StartValue - 1 days ) )

define function "TruncateTime"(Value DateTime ):
  DateTime(year from Value, month from Value, day from Value, 0, 0, 0, 0, timezoneoffset from Value)

