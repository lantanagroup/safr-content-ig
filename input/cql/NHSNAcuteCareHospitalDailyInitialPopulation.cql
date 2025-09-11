library NHSNAcuteCareHospitalDailyInitialPopulation version '1.0.0-dev'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.2' called FHIRHelpers
include NHSNHelpers version '0.0.002' called NHSNHelpers
include SharedResourceCreation version '0.1.010' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "LOINC": 'http://loinc.org' 
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category' 
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265' 
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143' 
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'

//COVID-19 lab tests
valueset "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1142'
valueset "COVID_19 (Tests for SARS_CoV_2 Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1158'

//COVID-19 test results (unused)
valueset "COVID_19 (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1143'

//Influenza lab tests
valueset "Influenza (Tests for influenza A or B virus Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.336'
valueset "Influenza (Tests for influenza A or B virus Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.337'

//Influenza test Results (unused)
valueset "Influenza (influenza A or B virus in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.340'

//RSV lab tests
valueset "RSV (Tests for RSV Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1311'
valueset "RSV (Tests for RSV Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1312'

//RSV test results (unused)
valueset "RSV (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1308'

//Test results shared among COVID-19, Influenza and RSV (unused)
valueset "LIVD SARS CoV2 Test Result Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1114.10'

//COVID-19 medications
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

//Influenza medications
valueset "Baloxavir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.85'
valueset "Peramivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.86'
valueset "Zanamivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.87'
valueset "Oseltamivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2078'

//Isolation Precautions
valueset "Transmission Based Precaution Types": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.10.20.22.5.300'

//Encounter Class Codes
valueset "NHSN Inpatient Encounter Class Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.274'

//Observation Category Codes
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

//Observation Encounter Class Code
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

parameter "Measurement Period" 
  default Interval[@2022-01-01T00:00:00.0, @2022-01-02T00:00:00.0)

context Patient

//----------------------------------
// Initial Population
//----------------------------------
define "Initial Population":
  EncounterInpatient
  union EncounterObservation
  union "Encounters with Patient Hospital Locations"

define "EncounterInpatient":
  ([Encounter: "Encounter Inpatient"]
    union [Encounter: class in "NHSN Inpatient Encounter Class Codes"]) Encounters
  where Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and Encounters.period overlaps "Measurement Period"

define "EncounterObservation":
  ([Encounter: "Observation Services"]
    union [Encounter: class in {"observation encounter"}]) Encounters
  where Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error'}
    and Encounters.period overlaps "Measurement Period"

define "Encounters with Patient Hospital Locations":
  [Encounter] Encounters
  where exists(
    Encounters.location EncounterLocation
    let types: NHSNHelpers.GetLocation(EncounterLocation.location).type
    where exists(
      types type
      where type in "Inpatient, Emergency, and Observation Locations"
    )
    and EncounterLocation.period overlaps Encounters.period
    and Encounters.status in {'in-progress', 'finished', 'triaged', 'onleave', 'entered-in-error' }
    and Encounters.period overlaps "Measurement Period"
  )


//-----------------------------------------------
// Logic related to Laboratory
//-----------------------------------------------
//Lab Observations
define "COVID And Influenza Observation":
  ([Observation: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] 
  union [Observation: "Influenza (Tests for influenza A or B virus Antigen)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]
  ) Observations
    where exists(Observations.category Category where Category ~ "laboratory")
      and Observations.status in {'final','registered','preliminary','partial'}
      and exists("Initial Population")

define "RSV Observation":
  ([Observation: "RSV (Tests for RSV Nucleic Acid)"]
  union [Observation: "RSV (Tests for RSV Antigen)"]   
  ) Observations
    where exists(Observations.category Category where Category ~ "laboratory")
      and Observations.status in {'final','registered','preliminary','partial'}
      and exists("Initial Population")

define "ACH Daily Observation":
  "RSV Observation"
  union "COVID And Influenza Observation"

//further constrain COVID-19 and Influenza Observations for 14 day lookback
define "COVID And Influenza PRE Admission Observation":
  "COVID And Influenza Observation" O 
   where exists( EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(O.effective) 14 days or less on or before start of E.period
      or NHSNHelpers."Normalize Interval"(GetSpecimen(O.specimen).collection.collected) 14 days or less on or before start of E.period
      )
      and start of E.period during "Measurement Period"
    )  

//further constrain RSV observation for 8 day lookback
define "RSV PRE Admission Observation":
  "RSV Observation" O 
  where exists(EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(O.effective) 8 days or less on or before start of E.period
      or NHSNHelpers."Normalize Interval"(GetSpecimen(O.specimen).collection.collected) 8 days or less on or before start of E.period
      )
      and start of E.period during "Measurement Period"
    )

//Lab DiagnosticReport
define "COVID And Influenza DiagnosticReport":
  ([DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"]
    union [DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]
    union [DiagnosticReport: "Influenza (Tests for influenza A or B virus Nucleic Acid)"]
    union [DiagnosticReport: "Influenza (Tests for influenza A or B virus Antigen)"]
  ) Reports
    where exists("Initial Population")
      and Reports.status in {'final','registered','preliminary','partial'}

define "RSV DiagnosticReport":
  ([DiagnosticReport: "RSV (Tests for RSV Nucleic Acid)"]
    union [DiagnosticReport: "RSV (Tests for RSV Antigen)"]
  ) Reports
    where exists("Initial Population")
      and Reports.status in {'final','registered','preliminary','partial'}

define "ACH Daily DiagnosticReport":
  "COVID And Influenza DiagnosticReport"
    union "RSV DiagnosticReport"

//further constrain COVID-19 and Influenza with 14 day lookback 
define "COVID And Influenza DiagnosticReport PRE Admission":
  "COVID And Influenza DiagnosticReport" R 
  where exists(EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(R.effective) 14 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

//further constrain RSV for 8 day lookback
define "RSV DiagnosticReport PRE Admission":
  "RSV DiagnosticReport" R 
  where exists(EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(R.effective) 8 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

define "COVID and Influenza DiagnosticReport Result from Lab":
  "DiagnosticReports" Reports
    where exists(
      "COVID and Influenza DiagnosticReport Observations" Observations
      where Reports.result.references(Observations)
    )
    and Reports.status in {'final','registered','preliminary','partial'}
    and exists("Initial Population")

define "COVID and Influenza DiagnosticReport Observations":
  "Observations" Observations
  where Observations.code in "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"
    or Observations.code in "COVID_19 (Tests for SARS_CoV_2 Antigen)"
    or Observations.code in "Influenza (Tests for influenza A or B virus Nucleic Acid)"
    or Observations.code in "Influenza (Tests for influenza A or B virus Antigen)"

 
define "RSV DiagnosticReport Result from Lab":
  [DiagnosticReport] Reports
    where exists("RSV DiagnosticReport Observations")
      and Reports.status in {'final','registered','preliminary','partial'}
      and exists("Initial Population")

define "RSV Observations":
  "Observations" Observations
  where Observations.code in "RSV (Tests for RSV Nucleic Acid)"
    or Observations.code in "RSV (Tests for RSV Antigen)"
    
define "RSV DiagnosticReport Observations":
  "DiagnosticReports" Reports
  where exists(
    "RSV Observations" Observations
    where Reports.result.references(Observations)
  )

define "ACH Daily DiagnosticReport Result from Lab":
  "COVID and Influenza DiagnosticReport Result from Lab"
    union "RSV DiagnosticReport Result from Lab"

//further constrain COVID-19 and Influenza with 14 day lookback
define "COVID and Influenza DiagnosticReport Result from Lab PRE Admission":
  "COVID and Influenza DiagnosticReport Result from Lab" R 
  where exists(EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(R.effective) 14 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

//further constrain RSV with 8 day lookback
define "RSV DiagnosticReport Result from Lab PRE Admission":
  "RSV DiagnosticReport Result from Lab" R 
  where exists(EncounterInpatient E 
    where (
      NHSNHelpers."Normalize Interval"(R.effective) 8 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )
    
//----------------------------------
// SDE
//----------------------------------
define "SDE IP Encounters":
  "Initial Population" IP
  return SharedResource.EncounterResource(IP, 
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-encounter'}})

define "SDE Encounter": 
  "Encounters" Encounters
  where not CheckIP(Encounters)
  and exists(
    "Initial Population" IP
    where Encounters.period overlaps IP.period)
  return SharedResource.EncounterResource(Encounters,
  {FHIR.canonical{value: 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-encounter'}})

define "SDE Minimal Patient":
  Patient p
  where exists("Initial Population")
  return SharedResource.PatientResource(p, 
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/cross-measure-patient'}})

define "SDE Location":
  [Location] Locations
  where exists("Initial Population")
  return SharedResource.LocationResource(Locations,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-location'}})
   
define "SDE Encounter Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"
  return SharedResource.EncounterResource(DischargeDispositions,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-encounter'}})

//return the Observation during the Measurement Period
define "SDE ACH Daily Observation":
  "ACH Daily Observation" Observations
    return SharedResource.ObservationLabResource(Observations,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-observation-lab'}})

//return the RSV Observation Pre Admission    
define "SDE RSV PRE Admission Observation":
  "RSV PRE Admission Observation" Observations
    return SharedResource.ObservationLabResource(Observations, 
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-observation-lab'}})

//return the COVID-19 and Influenza Observation Pre Admission
define "SDE COVID And Influenza PRE Admission Observation":
  "COVID And Influenza PRE Admission Observation" Observations
    return SharedResource.ObservationLabResource(Observations,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-observation-lab'}})

//return the Specimen related to the Observation during the Measurement Period
define "SDE ACH Daily Specimen":
  "ACH Daily Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-specimen'}})

//return the Specimen related to the RSV Observation Pre Admission
define "SDE RSV Specimen":
  "RSV PRE Admission Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-specimen'}})

//return the Specimen related to the COVID-19 And Influenza Observation Pre Admission
define "SDE COVID And Influenza Specimen":
  "COVID And Influenza PRE Admission Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-specimen'}})

//return the DiagnosticReport during the Measurement Period
define "SDE ACH Daily DiagnosticReport":
  "ACH Daily DiagnosticReport" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})

//return the COVID-19 And Influenza DiagnosticReport pre admission
define "SDE COVID And Influenza DiagnosticReport":
  "COVID And Influenza DiagnosticReport" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})

//return the RSV DiagnosticReport pre admission
define "SDE RSV DiagnosticReport":
  "RSV DiagnosticReport" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})

//return the DiagnosticReport based on the result during the Measurement Period    
define "SDE ACH Daily DiagnosticReport Result from Lab":
  "ACH Daily DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})

//return the COVID-19 and Influenza DiagnosticReport based on the result pre admission
define "SDE COVID and Influenza DiagnosticReport Result from Lab":
  "COVID and Influenza DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})

//return the RSV DiagnosticReport based on the result pre admission
define "SDE RSV DiagnosticReport Result from Lab":
  "RSV DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportLabResource(Reports,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-diagnosticreport-lab'}})
  
define "SDE ACH Daily ServiceRequest":
  ([ServiceRequest: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"] 
  union  [ServiceRequest: "COVID_19 (Tests for SARS_CoV_2 Antigen)"] 
  union  [ServiceRequest: "Influenza (Tests for influenza A or B virus Nucleic Acid)"]
  union  [ServiceRequest: "Influenza (Tests for influenza A or B virus Antigen)"]
  union  [ServiceRequest: "RSV (Tests for RSV Nucleic Acid)"]
  union  [ServiceRequest: "RSV (Tests for RSV Antigen)"]
  ) ServiceRequests
    where ServiceRequests.intent ~ 'order'
      and ServiceRequests.status ~ 'completed'
      and exists("Initial Population")
  return SharedResource.ServiceRequestResource(ServiceRequests,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-servicerequest'}})

define "SDE Isolation Precautions Implemented":
  [Procedure: "Transmission Based Precaution Types"] IsolationPrecautions
    where NHSNHelpers."Normalize Interval"(IsolationPrecautions.performed) during "Measurement Period"
    and exists("Initial Population")
  return SharedResource.ProcedureResource(IsolationPrecautions,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-procedure'}})

define "SDE Covid or Influenza Medication Administered":
  [MedicationAdministration] RPSMedAdmin
    let Meds: GetMedicationCode(RPSMedAdmin.medication)
   where (Meds in "Anakinra"
            or Meds in "Bamlanivimab"
            or Meds in "Baloxavir"
            or Meds in "Baricitinib"
            or Meds in "Bebtelovimab"
            or Meds in "Casirivimab"
            or Meds in "Casirivimab / Imdevimab"
            or Meds in "COVID19 RxNorm Value Set for Tocilizumab"
            or Meds in "Etesevimab"
            or Meds in "Imdevimab"
            or Meds in "Molnupiravir"
            or Meds in "Nirmatrelvir / Ritonavir"
            or Meds in "Oseltamivir"
            or Meds in "Peramivir"
            or Meds in "Remdesivir"
            or Meds in "Sarilumab"
            or Meds in "Sotrovimab"    
            or Meds in "Tofacitinib"
            or Meds in "Zanamivir")
      and RPSMedAdmin.status ~ 'completed'
      and exists("Initial Population")
      and NHSNHelpers."Normalize Interval"(RPSMedAdmin.effective) during "Measurement Period"
    return SharedResource.MedicationAdministrationResource(RPSMedAdmin,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-medicationadministration'}})

define "SDE Covid or Influenza Medication Ordered":
  [MedicationRequest] RPSMedRequest
    let Meds: GetMedicationCode(RPSMedRequest.medication)
    where (Meds in "Anakinra"
            or Meds in "Baloxavir"
            or Meds in "Bamlanivimab"
            or Meds in "Baricitinib"
            or Meds in "Bebtelovimab"
            or Meds in "Casirivimab"
            or Meds in "Casirivimab / Imdevimab"
            or Meds in "COVID19 RxNorm Value Set for Tocilizumab"
            or Meds in "Etesevimab"
            or Meds in "Imdevimab"
            or Meds in "Molnupiravir"
            or Meds in "Nirmatrelvir / Ritonavir"
            or Meds in "Oseltamivir"
            or Meds in "Peramivir"
            or Meds in "Remdesivir"
            or Meds in "Sarilumab"
            or Meds in "Sotrovimab"    
            or Meds in "Tofacitinib"
            or Meds in "Zanamivir")
      and exists("Initial Population")
      and NHSNHelpers."Normalize Interval"(RPSMedRequest.authoredOn) during "Measurement Period"
    return SharedResource.MedicationRequestResource(RPSMedRequest,
    {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-medicationrequest'}})

define "SDE Medication":
  ("SDE Covid or Influenza Medication Ordered"
  union "SDE Covid or Influenza Medication Administered") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication),
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-medication'}})

//To catch all isolation precautions
define "SDE All Observations":
  "Observations" O
  where exists("Initial Population")
  return SharedResource.ObservationLabResource(O,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-observation'}})

//To catch all isolation precautions
define "SDE All ServiceRequests":
  [ServiceRequest] SR
  where exists("Initial Population")
  return SharedResource.ServiceRequestResource(SR,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-servicerequest'}})

//To catch all isolation precautions
define "SDE All Procedures":
  [Procedure] P
  where exists("Initial Population")
  return SharedResource.ProcedureResource(P,
  {FHIR.canonical{value: 'http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/ach-daily-procedure'}})


//-----------------------------------------------------
//functions
//-----------------------------------------------------
define function "CheckIP"(encounter Encounter):
  exists("Initial Population" IP
  where encounter.id = IP.id)

define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication: id in {NHSNHelpers.GetId(reference.reference)}]
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

define function "GetMedicationFrom"(choice Choice<FHIR.CodeableConcept, FHIR.Reference>):
  case
    when choice is FHIR.Reference then
      GetMedication(choice as FHIR.Reference)
    else
      null
  end

define function "GetSpecimen"(reference FHIR.Reference):
  singleton from (
    [Specimen] Specimens
    where Specimens.id = NHSNHelpers.GetId(reference.reference)
  )

define function "GetEncounter"(reference FHIR.Reference):
  singleton from (
    "Encounters" Encounters
    where Encounters.id = NHSNHelpers.GetId(reference.reference)
  )

define fluent function references(reference FHIR.Reference, resource FHIR.Resource):
  resource.id = Last(Split(reference.reference, '/'))

define fluent function references(references List<FHIR.Reference>, resource FHIR.Resource):
  exists(references R where R.references(resource))

//Common Retrievals
define "Encounters":
  [Encounter]

define "Observations":
  [Observation]

define "DiagnosticReports":
  [DiagnosticReport]
