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
valueset "Discharge Disposition": 'http://terminology.hl7.org/ValueSet/encounter-discharge-disposition'

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

//medication Flu antivirals
code "baloxavir":  '2197842'   from "RXNORM"  display  'baloxavir'
code "Xofluza":  '2100001'   from "RXNORM"  display  'Xofluza' 
code "Xofluza 40 MG Dose Pack (2 x 20 MG Tablets)":  '2100099'   from "RXNORM"  display  'Xofluza 40 MG Dose Pack (2 x 20 MG Tablets)' 
code "Xofluza 80 MG Dose Pack (2 x 40 MG Tablets)":  '2100100'   from "RXNORM"  display  'Xofluza 80 MG Dose Pack (2 x 40 MG Tablets)' 
code "Granules for Oral Suspension":  '1540454'   from "RXNORM"  display  'Granules for Oral Suspension' 
code "Oral Tablet":  '317541'   from "RXNORM"  display  'Oral Tablet' 
code "Oral Product":  '1151131'   from "RXNORM"  display  'Oral Product' 
code "Pill":  '1151133'   from "RXNORM"  display  'Pill' 
code "Granule Product":  '1294708'   from "RXNORM"  display  'Granule Product' 
code "{2 (baloxavir marboxil 20 MG Oral Tablet) } Pack":  '2100024'   from "RXNORM"  display  '{2 (baloxavir marboxil 20 MG Oral Tablet) } Pack' 
code "{2 (baloxavir marboxil 40 MG Oral Tablet) } Pack":  '2100026'   from "RXNORM"  display  '{2 (baloxavir marboxil 40 MG Oral Tablet) } Pack' 
code "baloxavir marboxil":  '2099995'   from "RXNORM"  display  'baloxavir marboxil' 
code "Xofluza 20 MG Oral Tablet":  '2100006'   from "RXNORM"  display  'Xofluza 20 MG Oral Tablet' 
code "Xofluza 40 MG Oral Tablet":  '2100010'   from "RXNORM"  display  'Xofluza 40 MG Oral Tablet' 
code "Xofluza 40 MG Granules for Oral Suspension":  '2467539'   from "RXNORM"  display  'Xofluza 40 MG Granules for Oral Suspension' 
code "Xofluza 80 MG Oral Tablet":  '2536742'   from "RXNORM"  display  'Xofluza 80 MG Oral Tablet' 
code "baloxavir marboxil 20 MG [Xofluza]":  '2100002'   from "RXNORM"  display  'baloxavir marboxil 20 MG [Xofluza]' 
code "baloxavir marboxil 40 MG [Xofluza]":  '2100009'   from "RXNORM"  display  'baloxavir marboxil 40 MG [Xofluza]' 
code "baloxavir marboxil 80 MG [Xofluza]":  '2536741'   from "RXNORM"  display  'baloxavir marboxil 80 MG [Xofluza]' 
code "baloxavir marboxil Oral Tablet [Xofluza]":  '2100003'   from "RXNORM"  display  'baloxavir marboxil Oral Tablet [Xofluza]' 
code "baloxavir marboxil Granules for Oral Suspension [Xofluza]":  '2467538'   from "RXNORM"  display  'baloxavir marboxil Granules for Oral Suspension [Xofluza]' 
code "Xofluza Oral Product":  '2100004'   from "RXNORM"  display  'Xofluza Oral Product' 
code "Xofluza Pill":  '2100005'   from "RXNORM"  display  'Xofluza Pill' 
code "Xofluza Granule Product":  '2467534'   from "RXNORM"  display  'Xofluza Granule Product' 
code "baloxavir marboxil 20 MG Oral Tablet":  '2100000'   from "RXNORM"  display  'baloxavir marboxil 20 MG Oral Tablet' 
code "baloxavir marboxil 40 MG Oral Tablet":  '2100008'   from "RXNORM"  display  'baloxavir marboxil 40 MG Oral Tablet' 
code "baloxavir marboxil 40 MG Granules for Oral Suspension":  '2467537'   from "RXNORM"  display  'baloxavir marboxil 40 MG Granules for Oral Suspension' 
code "baloxavir marboxil 80 MG Oral Tablet":  '2536740'   from "RXNORM"  display  'baloxavir marboxil 80 MG Oral Tablet' 
code "baloxavir marboxil 20 MG":  '2099996'   from "RXNORM"  display  'baloxavir marboxil 20 MG' 
code "baloxavir marboxil 40 MG":  '2100007'   from "RXNORM"  display  'baloxavir marboxil 40 MG' 
code "baloxavir marboxil 80 MG":  '2536739'   from "RXNORM"  display  'baloxavir marboxil 80 MG' 
code "baloxavir marboxil Oral Tablet":  '2099999'   from "RXNORM"  display  'baloxavir marboxil Oral Tablet' 
code "baloxavir marboxil Granules for Oral Suspension":  '2467536'   from "RXNORM"  display  'baloxavir marboxil Granules for Oral Suspension' 
code "baloxavir marboxil Oral Product":  '2099997'   from "RXNORM"  display  'baloxavir marboxil Oral Product' 
code "baloxavir marboxil Pill":  '2099998'   from "RXNORM"  display  'baloxavir marboxil Pill' 
code "baloxavir marboxil Granule Product":  '2467530'   from "RXNORM"  display  'baloxavir marboxil Granule Product' 

code "Rapivab":  '1598078'   from "RXNORM"  display  'Rapivab' 
code "Injection":  '1649574'   from "RXNORM"  display  'Injection' 
code "Injectable Product":  '1151126'   from "RXNORM"  display  'Injectable Product' 
code "peramivir":  '619693'   from "RXNORM"  display  'peramivir' 
code "peramivir anhydrous":  '1598096'   from "RXNORM"  display  'peramivir anhydrous' 
code "Rapivab 200 MG per 20 ML Injection":  '876203'   from "RXNORM"  display  'Rapivab 200 MG per 20 ML Injection' 
code "peramivir 10 MG/ML [Rapivab]":  '1598079'   from "RXNORM"  display  'peramivir 10 MG/ML [Rapivab]' 
code "peramivir Injection [Rapivab]":  '1724186'   from "RXNORM"  display  'peramivir Injection [Rapivab]' 
code "Rapivab Injectable Product":  '1598081'   from "RXNORM"  display  'Rapivab Injectable Product' 
code "20 ML peramivir 10 MG/ML Injection":  '1598082'   from "RXNORM"  display  '20 ML peramivir 10 MG/ML Injection' 
code "peramivir 10 MG/ML":  '876201'   from "RXNORM"  display  'peramivir 10 MG/ML' 
code "peramivir Injection":  '1724184'   from "RXNORM"  display  'peramivir Injection' 
code "peramivir Injectable Product":  '1161399'   from "RXNORM"  display  'peramivir Injectable Product' 

code "Relenza":  '261633'   from "RXNORM"  display  'Relenza' 
code "Dry Powder Inhaler":  '744995'   from "RXNORM"  display  'Dry Powder Inhaler' 
code "Inhalant Product":  '1151123'   from "RXNORM"  display  'Inhalant Product' 
code "zanamivir":  '69722'   from "RXNORM"  display  'zanamivir' 
code "20 ACTUAT Relenza 5 MG/ACTUAT Dry Powder Inhaler":  '759473'   from "RXNORM"  display  '20 ACTUAT Relenza 5 MG/ACTUAT Dry Powder Inhaler' 
code "zanamivir 5 MG/ACTUAT [Relenza]":  '582580'   from "RXNORM"  display  'zanamivir 5 MG/ACTUAT [Relenza]' 
code "zanamivir Dry Powder Inhaler [Relenza]":  '759472'   from "RXNORM"  display  'zanamivir Dry Powder Inhaler [Relenza]' 
code "Relenza Inhalant Product":  '1180701'   from "RXNORM"  display  'Relenza Inhalant Product' 
code "20 ACTUAT zanamivir 5 MG/ACTUAT Dry Powder Inhaler":  '759471'   from "RXNORM"  display  '20 ACTUAT zanamivir 5 MG/ACTUAT Dry Powder Inhaler' 
code "zanamivir 5 MG/ACTUAT":  '582578'   from "RXNORM"  display  'zanamivir 5 MG/ACTUAT' 
code "zanamivir Dry Powder Inhaler":  '759470'   from "RXNORM"  display  'zanamivir Dry Powder Inhaler' 
code "zanamivir Inhalant Product":  '1163025'   from "RXNORM"  display  'zanamivir Inhalant Product' 


//==========================
//new valueset end
//==========================

//====================================
// There is not medication for RSV
//====================================


code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

parameter "Measurement Period" 
  default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient

define "EncounterInpatient":
  [Encounter: "Encounter Inpatient"]

define "EncounterObservation":
  [Encounter: "Observation Services"]


define "Specimens":
  [Specimen]

define "Qualifying Encounter During Measurement Period":
  ( "EncounterInpatient"
  union "EncounterObservation") QualifyingEncounters
  where QualifyingEncounters.status in {'in-progress', 'finished', 'triaged'}
    and QualifyingEncounters.period overlaps "Measurement Period"

define "Inpatient and Observation Encounters that ended within the last twenty four Hours":
  ( "EncounterInpatient"
    union "EncounterObservation") QualifyingEncounters
      where end of QualifyingEncounters.period before Today()
      and end of QualifyingEncounters.period after Today() - 1 day

define "Initial Population":
  "Qualifying Encounter During Measurement Period"
  union "Inpatient and Observation Encounters that ended within the last twenty four Hours"

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

//Retrieve Observation categories and lab codes valuesets
define "RPS Observation 1":
  ([Observation: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] 
  union [Observation: "Influenza (Tests for influenza A or B virus Antigen)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"]
  union [Observation: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]
  union [Observation: "RSV (Tests for RSV Nucleic Acid)"]
  union [Observation: "RSV (Tests for RSV Antigen)"]   
  ) Observations
    where exists(Observations.category Category where Category ~ "laboratory")
      and exists("Initial Population")

//further filter by the timing 
define "RPS Observation 2":
  from "RPS Observation 1" Observations 
    where exists("Initial Population" InitialPopulation
        where Global."Normalize Interval"(Observations.effective) 14 days or less on or before start of InitialPopulation.period
          or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) 14 days or less on or before start of InitialPopulation.period)
      or start of Global."Normalize Interval"(Observations.effective) during "Measurement Period"
      or Global."Normalize Interval"(GetSpecimen(Observations.specimen).collection.collected) during "Measurement Period"    

//further filter by result value set
define "RPS Observation 3":
  from "RPS Observation 2" Observations 
    where FHIRHelpers.ToConcept(Observations.value) in "Influenza (influenza A or B virus in Lab Results)"
      or FHIRHelpers.ToConcept(Observations.value) in "LIVD SARS CoV2 Test Result Codes"

//return SDE
define "SDE RPSObservation":
  "RPS Observation 2" Observations
    return SharedResource.ObservationResource(Observations)

//return the Specimen related to the Observation
define "SDE RPS Specimen":
  "RPS Observation 2" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen)

define "DiagnosticReports":
  [DiagnosticReport]

define "SDE RPS DiagnosticReport":
  from "Initial Population" InitialPopulation,
  ([DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"]
    union [DiagnosticReport: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]
    union [DiagnosticReport: "Influenza (Tests for influenza A or B virus Nucleic Acid)"]
    union [DiagnosticReport: "Influenza (Tests for influenza A or B virus Antigen)"]
    union [DiagnosticReport: "RSV (Tests for RSV Nucleic Acid)"]
    union [DiagnosticReport: "RSV (Tests for RSV Antigen)"]
  ) Reports
    where exists("Initial Population")
      and Reports.status in {'final'}
      and (start of Global."Normalize Interval"(Reports.effective) during "Measurement Period"
        or Global."Normalize Interval"(Reports.effective) 14 days or less on or before start of InitialPopulation.period)
    return SharedResource.DiagnosticReportResource(Reports)

define "RPS DiagnosticReport Result from Lab":
  from
  "DiagnosticReports" Reports,
  "Initial Population" InitialPopulation
    where (GetObservations(Reports.result).code in "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"
      or GetObservations(Reports.result).code in "COVID_19 (Tests for SARS_CoV_2 Antigen)"
      or GetObservations(Reports.result).code in "Influenza (Tests for influenza A or B virus Nucleic Acid)"
      or GetObservations(Reports.result).code in "Influenza (Tests for influenza A or B virus Antigen)"
      or GetObservations(Reports.result).code in "RSV (Tests for RSV Nucleic Acid)"
      or GetObservations(Reports.result).code in "RSV (Tests for RSV Antigen)")
      and Reports.status in {'final'}
      and exists("Initial Population")
      and (start of Global."Normalize Interval"(Reports.effective) during "Measurement Period"
        or Global."Normalize Interval"(Reports.effective) 14 days or less on or before start of InitialPopulation.period)
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
   
define "MedicationRequests":
  [MedicationRequest]

define "MedicationAdministrations":
  [MedicationAdministration]

define "Medications":
  [Medication]

define "SDE FLU or Covid Medication Administered":
  "MedicationAdministrations" RPSMedAdmin
    where (GetMedicationCode(RPSMedAdmin.medication) in "Anakinra"
            or GetMedicationCode(RPSMedAdmin.medication) in "Bamlanivimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Baricitinib"
            or GetMedicationCode(RPSMedAdmin.medication) in "Bebtelovimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Casirivimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Casirivimab / Imdevimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "COVID19 RxNorm Value Set for Tocilizumab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Etesevimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Imdevimab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Molnupiravir"
            or GetMedicationCode(RPSMedAdmin.medication) in "Nirmatrelvir / Ritonavir"
            or GetMedicationCode(RPSMedAdmin.medication) in "Oseltamivir"
            or GetMedicationCode(RPSMedAdmin.medication) in "Remdesivir"
            or GetMedicationCode(RPSMedAdmin.medication) in "Sarilumab"
            or GetMedicationCode(RPSMedAdmin.medication) in "Sotrovimab"    
            or GetMedicationCode(RPSMedAdmin.medication) in "Tofacitinib")
      and RPSMedAdmin.status ~ 'completed'
      and exists("Initial Population")
      and Global."Normalize Interval"(RPSMedAdmin.effective) during "Measurement Period"
    return SharedResource.MedicationAdministrationResource(RPSMedAdmin)

define "SDE FLU or Covid Medication Ordered":
  "MedicationRequests" RPSMedRequest
    where (GetMedicationCode(RPSMedRequest.medication) in "Anakinra"
            or GetMedicationCode(RPSMedRequest.medication) in "Bamlanivimab"
            or GetMedicationCode(RPSMedRequest.medication) in "Baricitinib"
            or GetMedicationCode(RPSMedRequest.medication) in "Bebtelovimab"
            or GetMedicationCode(RPSMedRequest.medication) in "Casirivimab"
            or GetMedicationCode(RPSMedRequest.medication) in "Casirivimab / Imdevimab"
            or GetMedicationCode(RPSMedRequest.medication) in "COVID19 RxNorm Value Set for Tocilizumab"
            or GetMedicationCode(RPSMedRequest.medication) in "Etesevimab"
            or GetMedicationCode(RPSMedRequest.medication) in "Imdevimab"
            or GetMedicationCode(RPSMedRequest.medication) in "Molnupiravir"
            or GetMedicationCode(RPSMedRequest.medication) in "Nirmatrelvir / Ritonavir"
            or GetMedicationCode(RPSMedRequest.medication) in "Oseltamivir"
            or GetMedicationCode(RPSMedRequest.medication) in "Remdesivir"
            or GetMedicationCode(RPSMedRequest.medication) in "Sarilumab"
            or GetMedicationCode(RPSMedRequest.medication) in "Sotrovimab"    
            or GetMedicationCode(RPSMedRequest.medication) in "Tofacitinib")
      and RPSMedRequest.status ~ 'completed'
      and exists("Initial Population")
      and Global."Normalize Interval"(RPSMedRequest.authoredOn) during "Measurement Period"
    return SharedResource.MedicationRequestResource(RPSMedRequest)
      
//-----------------------------------------------------
//functions
//-----------------------------------------------------
define function "GetSpecimen"(reference Reference):
  First (
    "Specimens" S where S.id = Global.GetId(reference.reference)
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
  First (
    "Medications" M where M.id = Global.GetId(reference.reference)
  )

define function GetObservations(reference List<Reference>):
  reference reference
    return GetObservation(reference)

define function GetObservation(reference Reference):
  First (
    "RPS Observation 2" Observations
      where reference.reference.value = Observations.id
  )


