library NHSNRespiratoryPathogenSurveillanceInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global
include SharedResourceCreation version '0.1.001' called SharedResource

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "LOINC": 'http://loinc.org' 
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category' 
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307' 
valueset "Inpatient, Emergency, and Observation Locations": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265' 
valueset "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143' 
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'

//Covid Tests for lab
valueset "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1142'
valueset "COVID_19 (Tests for SARS_CoV_2 Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1158'

//Covid Test result
valueset "COVID_19 (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1143'

//Influenza Tests for lab
valueset "Influenza (Tests for influenza A or B virus Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.336'
valueset "Influenza (Tests for influenza A or B virus Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.337'

//Influenza Test Result
valueset "Influenza (influenza A or B virus in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.340'

//RSV Tests for lab
valueset "RSV (Tests for RSV Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1311'
valueset "RSV (Tests for RSV Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1312'

//RSV Test result
valueset "RSV (Organism or Substance in Lab Results)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1308'

//Test result shared among Covid, Influenza and RSV
valueset "LIVD SARS CoV2 Test Result Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1114.10'

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

//Influenza medication
valueset "Baloxavir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.85'
valueset "Peramivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.86'
valueset "Zanamivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.87'
valueset "Oseltamivir": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.3616.200.110.102.2078'

//Isolation Precautions
valueset "Transmission Based Precaution Types": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.10.20.22.5.300'

//Observation Category Codes
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

//Encounter Class Codes
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "short stay": 'SS' from "ActCode" display 'short stay'

parameter "Measurement Period" 
  default Interval[@2022-01-01T00:00:00.0, @2022-01-02T00:00:00.0)

context Patient

//----------------------------------
// Initial Population
//----------------------------------
define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Qualifying Location During Measurement Period"

define "EncounterInpatient":
  [Encounter: "Encounter Inpatient"]
    union [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "short stay"}]

define "EncounterObservation":
  [Encounter: "Observation Services"]
    union [Encounter: class in {"observation encounter"}]

define "Qualifying Location During Measurement Period":
  [Encounter] Encounters
  where exists(
    Encounters.location EncounterLocation
    where Global.GetLocation(EncounterLocation.location).type in "Inpatient, Emergency, and Observation Locations"
      and EncounterLocation.period overlaps Encounters.period
  )

define "Qualifying Encounter During Measurement Period":
  ( "EncounterInpatient"
  union "EncounterObservation") QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged'}
    and QualifyingEncounters.period overlaps "Measurement Period"

//-----------------------------------------------
// Start logic related to Laboratory
//-----------------------------------------------
//seperate RSV from COVID and Influenza due to they have different lookback days
define "COVID And Influenza Observation":
  ([Observation: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] 
  union [Observation: "Influenza (Tests for influenza A or B virus Antigen)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]
  ) Observations
    where exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "RSV Observation":
  ([Observation: "RSV (Tests for RSV Nucleic Acid)"]
  union [Observation: "RSV (Tests for RSV Antigen)"]   
  ) Observations
    where exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

define "RPS Observation":
  "RSV Observation"
  union "COVID And Influenza Observation"

//further constrain with lookback 14 days
define "COVID And Influenza PRE Admission Observation":
  "COVID And Influenza Observation" O 
   where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(O.effective) 14 days or less on or before start of E.period
      or Global."Normalize Interval"(GetSpecimen(O.specimen).collection.collected) 14 days or less on or before start of E.period
      )
      and start of E.period during "Measurement Period"
    )  

//further constrain with lookback 8 days
define "RSV PRE Admission Observation":
  "RSV Observation" O 
  where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(O.effective) 8 days or less on or before start of E.period
      or Global."Normalize Interval"(GetSpecimen(O.specimen).collection.collected) 8 days or less on or before start of E.period
      )
      and start of E.period during "Measurement Period"
    )

//Retrieve RSV, and COVID and Influenza DiagnosticReport separately due to they have different lookback days
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

define "RPS DiagnosticReport":
  "COVID And Influenza DiagnosticReport"
    union "RSV DiagnosticReport"

//further constrain with lookback 14 days
define "COVID And Influenza DiagnosticReport PRE Admission":
  "COVID And Influenza DiagnosticReport" R 
  where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(R.effective) 14 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

//further constrain with lookback 8 days
define "RSV DiagnosticReport PRE Admission":
  "RSV DiagnosticReport" R 
  where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(R.effective) 8 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

//retrieve RSV, and COVID and Influenza DiagnosticReport based on the result in the DiagnosticReport separately due to they have different lookback days
define "COVID and Influenza DiagnosticReport Result from Lab":
  "DiagnosticReports" Reports
    where (GetObservations(Reports.result).code in "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"
      or GetObservations(Reports.result).code in "COVID_19 (Tests for SARS_CoV_2 Antigen)"
      or GetObservations(Reports.result).code in "Influenza (Tests for influenza A or B virus Nucleic Acid)"
      or GetObservations(Reports.result).code in "Influenza (Tests for influenza A or B virus Antigen)")
      and Reports.status in {'final','registered','preliminary','partial'}
      and exists("Initial Population")
 
define "RSV DiagnosticReport Result from Lab":
  "DiagnosticReports" Reports
    where (GetObservations(Reports.result).code in "RSV (Tests for RSV Nucleic Acid)"
      or GetObservations(Reports.result).code in "RSV (Tests for RSV Antigen)")
      and Reports.status in {'final','registered','preliminary','partial'}
      and exists("Initial Population")

define "RPS DiagnosticReport Result from Lab":
  "COVID and Influenza DiagnosticReport Result from Lab"
    union "RSV DiagnosticReport Result from Lab"

//further constrain with lookback 14 days
define "COVID and Influenza DiagnosticReport Result from Lab PRE Admission":
  "COVID and Influenza DiagnosticReport Result from Lab" R 
  where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(R.effective) 14 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )

//further constrain with lookback 8 days
define "RSV DiagnosticReport Result from Lab PRE Admission":
  "RSV DiagnosticReport Result from Lab" R 
  where exists(EncounterInpatient E 
    where (
      Global."Normalize Interval"(R.effective) 8 days or less on or before start of E.period)
      and start of E.period during "Measurement Period"
    )
    
//----------------------------------
// SDE
//----------------------------------
define "SDE Minimal Patient":
  Patient p
  where exists("Initial Population")
  return SharedResource.PatientResource(p)

define "SDE Location":
  [Location] Locations
  where exists("Initial Population")
  return SharedResource.LocationResource(Locations)
   
define "SDE Encounter Discharge Dispositions":
	"Initial Population" DischargeDispositions 
  where DischargeDispositions.hospitalization.dischargeDisposition in "Discharge Disposition"
  return SharedResource.EncounterResource(DischargeDispositions)

//return the Observation during the Measurement Period
define "SDE RPSObservation":
  "RPS Observation" Observations
    return SharedResource.ObservationResource(Observations)

//return the RSV Observation Pre Admission    
define "SDE RSV PRE Admission Observation":
  "RSV PRE Admission Observation" Observations
    return SharedResource.ObservationResource(Observations)

//return the COVID And Influenza Observation Pre Admission
define "SDE COVID And Influenza PRE Admission Observation":
  "COVID And Influenza PRE Admission Observation" Observations
    return SharedResource.ObservationResource(Observations)

//return the Specimen related to the Observation during the Measurement Period
define "SDE RPS Specimen":
  "RPS Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen)

//return the Specimen related to the RSV Observation Pre Admission
define "SDE RSV Specimen":
  "RSV PRE Admission Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen)

//return the Specimen related to the COVID And Influenza Observation Pre Admission
define "SDE COVID And Influenza Specimen":
  "COVID And Influenza PRE Admission Observation" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen)

//return the DiagnosticReport during the Measurement Period
define "SDE RPS DiagnosticReport":
  "RPS DiagnosticReport" Reports
    return SharedResource.DiagnosticReportResource(Reports)

//return the COVID And Influenza DiagnosticReport pre admission
define "SDE COVID And Influenza DiagnosticReport":
  "COVID And Influenza DiagnosticReport" Reports
    return SharedResource.DiagnosticReportResource(Reports)

//return the RSV DiagnosticReport pre admission
define "SDE RSV DiagnosticReport":
  "RSV DiagnosticReport" Reports
    return SharedResource.DiagnosticReportResource(Reports)

//return the DiagnosticReport based on the result during the Measurement Period    
define "SDE RPS DiagnosticReport Result from Lab":
  "RPS DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportResource(Reports)

//return the COVID and Infrluenza DiagnosticReport based on the result pre admission
define "SDE COVID and Influenza DiagnosticReport Result from Lab":
  "COVID and Influenza DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportResource(Reports)

//return the RSV DiagnosticReport based on the result pre admission
define "SDE RSV DiagnosticReport Result from Lab":
  "RSV DiagnosticReport Result from Lab" Reports
    return SharedResource.DiagnosticReportResource(Reports)
  
define "SDE RPS ServiceRequest":
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
  return SharedResource.ServiceRequestResource(ServiceRequests)

define "SDE Isolation Precautions Implemented":
  [Procedure: "Transmission Based Precaution Types"] IsolationPrecautions
    where Global."Normalize Interval"(IsolationPrecautions.performed) during "Measurement Period"
    and exists("Initial Population")
  return SharedResource.ProcedureResource(IsolationPrecautions)

define "SDE Covid or Influenza Medication Administered":
  "MedicationAdministrations" RPSMedAdmin
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
      and Global."Normalize Interval"(RPSMedAdmin.effective) during "Measurement Period"
    return SharedResource.MedicationAdministrationResource(RPSMedAdmin)

define "SDE Covid or Influenza Medication Ordered":
  "MedicationRequests" RPSMedRequest
    let Meds: (GetMedicationCode(RPSMedRequest.medication))
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
      and Global."Normalize Interval"(RPSMedRequest.authoredOn) during "Measurement Period"
    return SharedResource.MedicationRequestResource(RPSMedRequest)

define "SDE Medication":
  ("SDE Covid or Influenza Medication Ordered"
  union "SDE Covid or Influenza Medication Administered") MedReqOrAdmin
  where MedReqOrAdmin.medication is FHIR.Reference
  return SharedResource.MedicationResource(GetMedicationFrom(MedReqOrAdmin.medication))

//To catch all isolation precautions
define "SDE All Observations":
  "Observations" O
  where exists("Initial Population")
  return SharedResource.ObservationResource(O)

//To catch all isolation precautions
define "SDE All ServiceRequests":
  [ServiceRequest] SR
  where exists("Initial Population")
  return SharedResource.ServiceRequestResource(SR)

//To catch all isolation precautions
define "SDE All Procedures":
  [Procedure] P
  where exists("Initial Population")
  return SharedResource.ProcedureResource(P)

 
//----------------------------------------------
//Retrieve Resources
//----------------------------------------------
define "Specimens":
  [Specimen]

define "DiagnosticReports":
  [DiagnosticReport]
   
define "MedicationRequests":
  [MedicationRequest]

define "MedicationAdministrations":
  [MedicationAdministration]

define "Medications":
  [Medication]

define "Observations":
  [Observation]

//-----------------------------------------------------
//functions
//-----------------------------------------------------
define function "GetMedication"(reference Reference ):
  First (
    "Medications" M where M.id = Global.GetId(reference.reference)
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

define function GetObservation(reference Reference):
  First (
    "Observations" O where O.id = Global.GetId(reference.reference)
  )

define function GetObservations(reference List<Reference>):
  reference reference
    return GetObservation(reference)

define function "GetSpecimen"(reference Reference):
  First (
    "Specimens" S where S.id = Global.GetId(reference.reference)
  )

