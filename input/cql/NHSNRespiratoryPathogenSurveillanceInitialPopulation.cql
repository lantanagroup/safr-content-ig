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

//return SDE
define "SDE RPSObservation":
  "RPS Observation 2" Observations
    return SharedResource.ObservationResource(Observations)

//return the Specimen related to the Observation
define "SDE RPS Specimen":
  "RPS Observation 2" ObservationWithSpecimen
    let Specimen: GetSpecimen(ObservationWithSpecimen.specimen)
    return SharedResource.SpecimenResource(Specimen)

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
  
define "SDE RPS DiagnosticReport Result from Lab":
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

define "SDE Covid or Influenza Medication Administered":
  "MedicationAdministrations" RPSMedAdmin
    let Meds: GetMedicationCode(RPSMedAdmin.medication)
   where (Meds in "Anakinra"
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
            or Meds in "Remdesivir"
            or Meds in "Sarilumab"
            or Meds in "Sotrovimab"    
            or Meds in "Tofacitinib")
      and RPSMedAdmin.status ~ 'completed'
      and exists("Initial Population")
      and Global."Normalize Interval"(RPSMedAdmin.effective) during "Measurement Period"
    return SharedResource.MedicationAdministrationResource(RPSMedAdmin)

define "SDE Covid or Influenza Medication Ordered":
  "MedicationRequests" RPSMedRequest
    let Meds: (GetMedicationCode(RPSMedRequest.medication))
    where (Meds in "Anakinra"
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
            or Meds in "Remdesivir"
            or Meds in "Sarilumab"
            or Meds in "Sotrovimab"    
            or Meds in "Tofacitinib")
      //and RPSMedRequest.status ~ 'completed' //This is not needed for the medication ordered
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



/*--------------------------------------------------------------------------------------------------------
Comment this logic out for now 
//further filter by result value set.
define "RPS Observation 3":
  from "RPS Observation 2" Observations 
    where FHIRHelpers.ToConcept(Observations.value) in "Influenza (influenza A or B virus in Lab Results)"
      or FHIRHelpers.ToConcept(Observations.value) in "COVID_19 (Organism or Substance in Lab Results)"
      or FHIRHelpers.ToConcept(Observations.value) in  "RSV (Organism or Substance in Lab Results)"
      or FHIRHelpers.ToConcept(Observations.value) in "LIVD SARS CoV2 Test Result Codes"

//This logic does not make sense.
define "Inpatient and Observation Encounters that ended within the last twenty four Hours":
  ( "EncounterInpatient"
    union "EncounterObservation") QualifyingEncounters
      where end of QualifyingEncounters.period before Today()
      and end of QualifyingEncounters.period after Today() - 1 day

//Remove by request of the CDC due to is a duplicate logic. 
define "Inpatient and Observation Encounters that ended within the last twenty four Hours":
  ( "EncounterInpatient"
    union "EncounterObservation") QualifyingEncounters
      where end of QualifyingEncounters.period during "Measurement Period"

-----------------------------------------------------------------------------------------------------------*/

