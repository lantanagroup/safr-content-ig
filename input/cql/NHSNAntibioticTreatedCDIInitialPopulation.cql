library NHSNAntibioticTreatedCDIInitialPopulation version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include SupplementalDataElementsFHIR4 version '2.0.000' called SDE
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode' 
codesystem "LOINC": 'http://loinc.org'
codesystem "RXNORM": 'http://www.nlm.nih.gov/research/umls/rxnorm'

valueset "CDC Location Codes": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265'

//pending valueSet for TherapeuticAtensForCDI
valueset "TherapeuticAgensForCDI": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.58'
valueset "CDiffLab": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1190.62'

code "emergency": 'EMER' from "ActCode" display 'emergency'
code "inpatient acute": 'ACUTE' from "ActCode" display 'inpatient acute'
code "inpatient encounter": 'IMP' from "ActCode" display 'inpatient encounter'
code "inpatient non-acute": 'NONAC' from "ActCode" display 'inpatient non-acute'
code "observation encounter": 'OBSENC' from "ActCode" display 'observation encounter'

//code "vancomycin1": '1807513' from "RXNORM"
//code "vancomycin2": '2118449' from "RXNORM"


parameter "Measurement Period" 
    default Interval[DateTime(2022, 1, 1, 0, 0, 0, 0), DateTime(2022, 2, 1, 0, 0, 0, 0))

context Patient 

//CDI initial Patient Population: All inpatient, ED, and Observation encounters during the Measurement Period
define "Initial Population":
  [Encounter: class in {"inpatient encounter", "inpatient acute", "inpatient non-acute", "emergency", "observation encounter"}] Encounters
  where Encounters.period overlaps "Measurement Period"



//HOT-CDI: All encounters for patients who arrived at an inpatient location for at least one calendar day during the Measurement Period

//COT-CDI: All encounters for patients who arrived at an inpatient location for at least one calendar day during the Measurement Period

//Outpatient CO-CDI: All patients with at least one ED or Observation encounter during the Measurement Period
//All encounters for patient who has an ED encounter or a Observation encounter during the Measurement Period, 
//since we define the measure is under the patient context, and measure one patient at a time. The logic is needed, to guard the situation
//the patient continue on become an inptient with the ED or Observation encounter. 

//Patient aged one year old or less than one year old at the start of an admission/encounter will be excluded from HOT-CDI, COT-CDI, and CO-CDI
//event numerators and denominators. Data from these patient will be collected and complemenarty metrics provided based on this data. 
//make sure those data are made into data-requirment, need to find out to use SDE or just define will do it. 



//Encounter.location.location:Reference(Location) Location.type indicate type of function performed at the location
//Encounter.location.physicalType is the physical type of the location (usually the level in location hierachy)
//For CDI measure, we want to identify the function performed at the location, such as impatient location

//This will pull the Location resource in 
define "SDE Encounter Locations":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (GetLocation(EncounterLocation.location).type in "CDC Location Codes") 
      //or GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
    and Encounter.period during "Measurement Period"
    return Encounter.location EncLoc
    let RefLoc: GetLocation(EncLoc.location)
    return Tuple{
      locationType: GetCodeConcepts(RefLoc.type),
      period: FHIRHelpers.ToInterval(EncLoc.period)
    }

//Not sure we need this the define above may pull the releated Locaion in anyway
define "SDE Location":
  [Location: type in "CDC Location Codes"] LocCdc
  where exists("Initial Population")


define "SDE Encounter Locations No Return":
	[Encounter] Encounter
  with Encounter.location EncounterLocation
  such that (GetLocation(EncounterLocation.location).type in "CDC Location Codes") 
      //or GetLocation(EncounterLocation.location).physicalType in "CDC Location Codes")
  with "Initial Population" InitialPopulation
  such that start of Encounter.period during InitialPopulation.period
    and Encounter.period during "Measurement Period"
  
define "SDE Stool Lab":
  [Observation: code in CDiffLab] ObsLab
    where ObsLab.status in {'final', 'amended', 'corrected', 'preliminory'}
    and Global."Normalize Interval"(ObsLab.effective) during "Measurement Period"
    and ObsLab.category.coding.code ~ {'laboratary'}
    and exists("Initial Population")

define "SDE Stool DiagnosticReport":
  [DiagnosticReport: code in CDiffLab] DiaRepLab
    where DiaRepLab.status in {'final', 'amended', 'corrected', 'preliminory'}
     and Global."Normalize Interval"(DiaRepLab.effective) during "Measurement Period"
     and exists("Initial Population")

define "SDE Vital Signs":
  [Observation] ObsVS 
    where ObsVS.status in {'final', 'amended', 'corrected', 'preliminory'} 
    and ObsVS.category.coding.code ~ {'vital-signs'}
    and Global."Normalize Interval"(ObsVS.effective) during "Measurement Period"
    and exists("Initial Population")

//in the master map sheet did not say what type the Condition is needed
//for now just for the encounter-diagnosis
define "SDE Encounter Diagnosis":
  [Condition] ConEncDia 
  where ConEncDia.category.coding.code ~ {'encounter-diagnosis'}
  and exists("Initial Population")

define "SDE Lab With Spcimen":
  [Observation: code in CDiffLab] ObsSpc 
    let RefSpe: GetSpecimen(ObsSpc.specimen)
    where Global."Normalize Interval"(RefSpe.collection.collected) during "Measurement Period"
    
define "SDE Service Request":
	[ServiceRequest: code in CDiffLab] SerLab
  with "Initial Population" InitialPopulation
  such that (SerLab.intent ~ 'order'
    and SerLab.status ~ 'completed')
    and start of Global."Normalize Interval"(SerLab.occurrence) during InitialPopulation.period
    
define "SDE MedicationAdministration":
[MedicationAdministration: medication in TherapeuticAgensForCDI] MedAdm
  where MedAdm.status in {'completed', 'inprogress'}
    and Global."Normalize Interval"(MedAdm.effective) during "Measurement Period"

define "SDE MedicationRequest":
[MedicationRequest: medication in TherapeuticAgensForCDI] MedReq 
  where MedReq.status in {'active', 'completed'}
  and Global."Normalize Interval"(MedReq.authoredOn) during "Measurement Period"

define "SDE Claim":
  [Claim] Cla 
  where exists("Initial Population")

define "SDE Coverage":
  [Coverage] Cov 
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
