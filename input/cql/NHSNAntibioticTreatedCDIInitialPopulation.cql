library NHSNAntibioticTreatedCDIInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "Diagnosis Role": 'http://terminology.hl7.org/CodeSystem/diagnosis-role'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'
codesystem "LOINC": 'http://loinc.org'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'
codesystem "ConditionCategoryCodes": 'http://hl7.org/fhir/2021Mar/codesystem-condition-category'

valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'

//pending valueSet for TherapeuticAtensForCDI
valueset "Medications for Clostridioides difficile Infection": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.71'
valueset "TherapeuticAgensForCDI": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'
valueset "Lab Tests for Clostridioides difficile Infection": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.62'

code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'
code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'
code "vital-signs": 'vital-signs'  from "Observation Category" display 'vital-signs'
code "encounter-diagnosis": 'encounter-diagnosis' from ConditionCategoryCodes display'encounter-diagnosis'

code "vancomycin1": '11124' from "RXNORM"
//code "vancomycin2": '2118449' from "RXNORM"


parameter "Measurement Period" 
    default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient 

//CDI initial Patient Population: All inpatient, ED, and Observation encounters during the Measurement Period
//Encounter.hospitalization.dischargeDisposition:CodeableConcept 0..1 no SDE need for this
//Encounter.diagnosis.use:CodeableConcept 0..1 no SDE need for this
define "EMR OBS Encounter":
  [Encounter: class in {"emergency", "observation encounter"}] EmrObsEnc
    where EmrObsEnc.period during "Measurement Period"
    //with "IP Encounter" IPEnc
    //such that EmrObsEnc.period ends 24 hours or less on or before start IPEnc.period

  
define "IP Encounter":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute"}] IPEnc
    where IPEnc.period overlaps "Measurement Period"

define "Initial Population":
  "IP Encounter" union "EMR OBS Encounter"

//HOT-CDI: All encounters for patients who arrived at an inpatient location for at least one calendar day during the Measurement Period
//COT-CDI: All encounters for patients who arrived at an inpatient location for at least one calendar day during the Measurement Period
//Outpatient CO-CDI: All patients with at least one ED or Observation encounter during the Measurement Period

//Encounter.location.location:Reference(Location) Location.type indicate type of function performed at the location
//Encounter.location.physicalType is the physical type of the location (usually the level in location hierachy)
//For CDI measure, we want to identify the function performed at the location, such as impatient location
//Each facility may have a map between CDC Location type to facility location, need to see how this play out in CoLab
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (GetLocation(EncounterLocation.location).type in "CDC Location Codes") 
      //or GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
    //and Encounter.period during "Measurement Period"
    //return Encounter.location EncLoc
    //let RefLoc: GetLocation(EncLoc.location)
    //return Tuple{
    //  locationType: GetCodeConcepts(RefLoc.type),
    //  period: FHIRHelpers.ToInterval(EncLoc.period)
    //}
    
//Encounter.hospitalization.origin:Reference(Location) 0..1 patient came before admission
//Encounter.hospitalization.destination:Reference(Location) 0..1 Location which patient discharged to
//Encounter.location.location:Reference(Location) 1..1 Location the encounter taskes place
define "SDE Locations":
  [Location] Loc
  where exists("Initial Population")

//add Observation.category in the condition for meeting requirement for EHR
define "SDE Stool Lab":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] ObsLab
    with "Initial Population" IP
    such that Global."Normalize Interval"(ObsLab.effective) during IP.period
      and ObsLab.status in {'final', 'amended', 'corrected', 'preliminary'}
      and GetCodeConcepts(ObsLab.category) ~  {"laboratory"}
      //and ObsLab.category.coding.code ~ {'laboratory'}

define "SDE Encounter with Chief Complaint":
  [Encounter] EncCC
    with "Initial Population" IP
    such that Global."Normalize Interval"(EncCC.period) during IP.period
      and EncCC.diagnosis.use.coding.code ~ {'Chief Complaint'}


//DiagnosticReport.result:Reference(Observation) 0..* the result is in the Observation
define "SDE Stool DiagnosticReport":
  [DiagnosticReport: code in "Lab Tests for Clostridioides difficile Infection"] DiaRepLab
    with "Initial Population" IP
    such that Global."Normalize Interval"(DiaRepLab.effective) during IP.period
      and DiaRepLab.status in {'final', 'amended', 'corrected', 'preliminary'}

define "SDE Vital Signs":
  [Observation] ObsVS
    with "Initial Population" IP 
    such that Global."Normalize Interval"(ObsVS.effective) during IP.period
      and ObsVS.status in {'final', 'amended', 'corrected', 'preliminary'}
      and GetCodeConcepts(ObsVS.category) ~  {"vital-signs"}
      //and ObsVS.category.coding.code ~ {'vital-signs'}

//in the master map sheet did not say what type the Condition is needed
//for now just for the encounter-diagnosis
//data requirement only to category levle did filter down the code level 
//not sure we should check the Condtion.onset, it is clear what that means, an acute condition for a chronic condtion
//need to check the run time it filter out the observation other than encounter-diagnosis or not?????
define "SDE Condition for Encounter Diagnosis":
  [Condition] ConEncDia 
    where GetCodeConcepts(ConEncDia.category) ~  {"encounter-diagnosis"}
    and exists("Initial Population")

//for the Observation has Specimen reference, this may not need if we have the Specimen Resource
define "SDE Lab With Spcimen":
  [Observation: code in "Lab Tests for Clostridioides difficile Infection"] ObsSpc 
    let RefSpe: GetSpecimen(ObsSpc.specimen)
    with "Initial Population" IP 
    such that Global."Normalize Interval"(RefSpe.collection.collected) during IP.period
    return RefSpe

define "SDE Stool Specimen":
  [Specimen] Spe
    with "Initial Population" IP
    such that Global."Normalize Interval"(Spe.collection.collected) during IP.period

//Lab orders
define "SDE Service Request":
	[ServiceRequest: code in "Lab Tests for Clostridioides difficile Infection"] SerLab
  with "Initial Population" InitialPopulation
  such that (SerLab.intent ~ 'order'
    and SerLab.status ~ 'completed')
    and start of Global."Normalize Interval"(SerLab.occurrence) during InitialPopulation.period

define "SDE MedicationRequest":
  [MedicationRequest] MedReq
    with "Initial Population" IP 
    such that Global."Normalize Interval"(MedReq.authoredOn) during IP.period
    and MedReq.status in {'active', 'completed'}

define "SDE MedicationRequest Filter With Code":
[MedicationRequest] MedReq 
  with "Initial Population" IP 
  such that Global."Normalize Interval"(MedReq.authoredOn) during IP.period
    and MedReq.status in {'active', 'completed'}
    and GetMedicationCode(MedReq.medication) in "Medications for Clostridioides difficile Infection"

   
define "SDE MedicationAdministration":
[MedicationAdministration] MedAdm
  with "Initial Population" IP
  such that Global."Normalize Interval"(MedAdm.effective) during IP.period
    and MedAdm.status in {'completed', 'in-progress'}

   
define "SDE MedicationAdministration Filter With Code":
[MedicationAdministration] MedAdm
  with "Initial Population" IP
  such that Global."Normalize Interval"(MedAdm.effective) during IP.period
    and MedAdm.status in {'completed', 'in-progress'}
    and GetMedicationCode(MedAdm.medication) in "Medications for Clostridioides difficile Infection"
   

define "SDE Claim":
  [Claim] Cla 
  where exists("Initial Population")

//Claim.insurance.coverage:Reference(Coverage)
//MedicationRequest.insurance:Reference(Coverage) 0..*
//ServiceRequest.insurance:Reference(Coverage) 0..*
define "SDE Coverage":
  [Coverage] Cov 
  where exists("Initial Population")

define "SDE ExplanationOfBenefit":
  [ExplanationOfBenefit] Exp 
    where exists("Initial Population")


//-----------------------------------------------------------------
// functions
//-----------------------------------------------------------------
define function GetCodeConcepts(CodeConcepts List<CodeableConcept>):
  CodeConcepts inCodeableConcept
  return  FHIRHelpers.ToConcept(inCodeableConcept)

//Returns the tail of the given uri (i.e. everything after the last slash in the URI).
define function "GetId"(uri String ):
  Last(Split(uri, '/'))

//Returns the Location resource specified by the given reference
define function "GetLocation"(reference Reference ):
  singleton from (
    [Location] L where L.id = GetId(reference.reference)
  )

define function "GetLocations"(references List<Reference>):
  references reference
  return GetLocation(reference)


define function "GetMedication"(reference Reference ):
  singleton from (
    [Medication] M where M.id = GetId(reference.reference)
  )

define function "GetMedications"(references List<Reference> ):
  references reference
  return GetMedication(reference)

define function "GetSpecimen"(reference Reference):
  singleton from (
    [Specimen] S where S.id = GetId(reference.reference)
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
