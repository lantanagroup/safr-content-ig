library HRDMeasure version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

// Terminology definitions
codesystem "SNOMEDCT": 'http://snomed.info/sct'
codesystem "LocationPhysicalType": 'http://terminology.hl7.org/CodeSystem/location-physical-type'
codesystem "HealthcareCapacity": 'http://hl7.org/fhir/us/safr/CodeSystem/us-safr-bed-capacity-example-codes'
codesystem "Observation Category": 'http://terminology.hl7.org/CodeSystem/observation-category'

// Value sets
valueset "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1142'
valueset "COVID_19 (Tests for SARS_CoV_2 Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1158'
valueset "Influenza (Tests for influenza A or B virus Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.336'
valueset "Influenza (Tests for influenza A or B virus Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.337'
valueset "RSV (Tests for RSV Antigen)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1311'
valueset "RSV (Tests for RSV Nucleic Acid)": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1312'

//Codes
code "Bed": 'bd' from "LocationPhysicalType" display 'Bed'

code "HOSP": 'HOSP' from "HealthcareCapacity" display 'Hospital'
code "IRF": 'IRF' from "HealthcareCapacity" display 'Inpatient Rehabilitation'
code "IPF": 'IPF' from "HealthcareCapacity" display 'Inpatient Psychiatric'
code "CHLD": 'CHLD' from "HealthcareCapacity" display 'Children\'s or Pediatric'
code "OTH": 'OTH' from "HealthcareCapacity" display 'Other facility-within-facility or subunit'

code "laboratory": 'laboratory' from "Observation Category" display 'Laboratory'

code "detected": '260373001' from "SNOMEDCT" display 'Detected'
code "N95 mask": '409533008' from "SNOMEDCT" display 'Air-purifying respirator (physical object)'
code "Surgical mask": '409528009' from "SNOMEDCT" display 'Surgical face mask (physical object)'
code "Face shield": '706724001' from "SNOMEDCT" display 'Face shield (physical object)'
code "Patient gown": '1141676007' from "SNOMEDCT" display 'Patient gown (physical object)'
code "Surgical glove": '462245005' from "SNOMEDCT" display 'Nitrile surgical glove, powdered (physical object)'

// Parameter for measurement period
parameter "Measurement Period" Interval<Date>
  default Interval[@2025-03-01, @2025-03-07]

context Location

//Initial Populations
define "Inpatient Beds Initial Population":
  IsBedLocation
  and LocationIsHOSP
  and (
    LocationIsIPF
    or LocationIsIRF
    or LocationIsCHLD
  )

define "Occupied Inpatient Beds Initial Population":
  "Inpatient Beds Initial Population"
  and EncounterCheck
  
define "Adult Inpatient Beds Initial Population":
  IsBedLocation
  and LocationIsHOSP
  and (
    LocationIsIPF
    or LocationIsIRF
  )
  and not LocationIsCHLD

define "Occupied Adult Inpatient Beds Initial Population":
  "Adult Inpatient Beds Initial Population"
  and EncounterCheck

define "Pediatric Inpatient Beds Initial Population":
  IsBedLocation
  and LocationIsHOSP
  and LocationIsCHLD
  and not (
    LocationIsIPF
    or LocationIsIRF
  )

define "Occupied Pediatric Inpatient Beds Initial Population":
  "Pediatric Inpatient Beds Initial Population"
  and EncounterCheck

define "ICU Beds Initial Population":
  IsBedLocation
  and (
    LocationIsHOSP
    or LocationIsOTH
  )

define "Occupied ICU Beds Initial Population":
  "ICU Beds Initial Population"
  and EncounterCheck

define "Adult ICU Beds Initial Population":
  IsBedLocation
  and (
    LocationIsHOSP
    or LocationIsOTH
  )
  and not LocationIsCHLD

define "Occupied Adult ICU Beds Initial Population":
  "Adult ICU Beds Initial Population"
  and EncounterCheck

define "Pediatric ICU Beds Initial Population":
  IsBedLocation
  and LocationIsCHLD
  and (
    LocationIsHOSP
    or LocationIsOTH
  )

define "Occupied Pediatric ICU Beds Initial Population":
  "Pediatric ICU Beds Initial Population"
  and EncounterCheck

//Stratifiers
//COVID_19
define "Adult Inpatient COVID_19 Patients Stratifier":
  if "Adult Inpatient Beds Initial Population" then
    "Count Confirmed COVID_19 Patients in Bed Location"
  else 0

define "Pediatric Inpatient COVID_19 Patients Stratifier":
  if "Pediatric Inpatient Beds Initial Population" then
    "Count Confirmed COVID_19 Patients in Bed Location"
  else 0

define "Adult ICU COVID_19 Patients Stratifier":
  if "Adult ICU Beds Initial Population" then
    "Count Confirmed COVID_19 Patients in Bed Location"
  else 0

define "Pediatric ICU COVID_19 Patients Stratifier":
  if "Pediatric ICU Beds Initial Population" then
    "Count Confirmed COVID_19 Patients in Bed Location"
  else 0

define "New Pediatric COVID_19 Patients Between 0 to 4 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted COVID_19 Patient IDs" , 0, 4 )
  )

define "New Pediatric COVID_19 Patients Between 5 to 17 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted COVID_19 Patient IDs", 5, 17 )
  )

define "New Adult COVID_19 Patients Between 18 to 49 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted COVID_19 Patient IDs", 18, 49 )
  )

define "New Adult COVID_19 Patients Between 50 to 64 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted COVID_19 Patient IDs", 50, 64 )
  )

define "New Adult COVID_19 Patients Between 65 to 74 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted COVID_19 Patient IDs", 65, 74 )
  )

define "New Adult COVID_19 Patients 75 and Above Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Above Specified Age"( "Newly Admitted COVID_19 Patient IDs", 75 )
  )

define "New COVID_19 Patients with Unknown Age Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location and Unknown Age"( "Newly Admitted COVID_19 Patient IDs" )
  )
  
//Influenza
define "Adult Inpatient Influenza Patients Stratifier":
  if "Adult Inpatient Beds Initial Population" then
    "Count Confirmed Influenza Patients in Bed Location"
  else 0

define "Pediatric Inpatient Influenza Patients Stratifier":
  if "Pediatric Inpatient Beds Initial Population" then
    "Count Confirmed Influenza Patients in Bed Location"
  else 0

define "Adult ICU Influenza Patients Stratifier":
  if "Adult ICU Beds Initial Population" then
    "Count Confirmed Influenza Patients in Bed Location"
  else 0

define "Pediatric ICU Influenza Patients Stratifier":
  if "Pediatric ICU Beds Initial Population" then
    "Count Confirmed Influenza Patients in Bed Location"
  else 0

define "New Pediatric Influenza Patients Between 0 to 4 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted Influenza Patient IDs" , 0, 4 )
  )

define "New Pediatric Influenza Patients Between 5 to 17 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted Influenza Patient IDs", 5, 17 )
  )

define "New Adult Influenza Patients Between 18 to 49 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted Influenza Patient IDs", 18, 49 )
  )

define "New Adult Influenza Patients Between 50 to 64 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted Influenza Patient IDs", 50, 64 )
  )

define "New Adult Influenza Patients Between 65 to 74 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted Influenza Patient IDs", 65, 74 )
  )

define "New Adult Influenza Patients 75 and Above Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Above Specified Age"( "Newly Admitted Influenza Patient IDs", 75 )
  )

define "New Influenza Patients with Unknown Age Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location and Unknown Age"( "Newly Admitted Influenza Patient IDs" )
  )

//RSV
define "Adult Inpatient RSV Patients Stratifier":
  if "Adult Inpatient Beds Initial Population" then
    "Count Confirmed RSV Patients in Bed Location"
  else 0

define "Pediatric Inpatient RSV Patients Stratifier":
  if "Pediatric Inpatient Beds Initial Population" then
    "Count Confirmed RSV Patients in Bed Location"
  else 0

define "Adult ICU RSV Patients Stratifier":
  if "Adult ICU Beds Initial Population" then
    "Count Confirmed RSV Patients in Bed Location"
  else 0

define "Pediatric ICU RSV Patients Stratifier":
  if "Pediatric ICU Beds Initial Population" then
    "Count Confirmed RSV Patients in Bed Location"
  else 0

define "New Pediatric RSV Patients Between 0 to 4 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted RSV Patient IDs" , 0, 4 )
  )

define "New Pediatric RSV Patients Between 5 to 17 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted RSV Patient IDs", 5, 17 )
  )

define "New Adult RSV Patients Between 18 to 49 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted RSV Patient IDs", 18, 49 )
  )

define "New Adult RSV Patients Between 50 to 64 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted RSV Patient IDs", 50, 64 )
  )

define "New Adult RSV Patients Between 65 to 74 Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( "Newly Admitted RSV Patient IDs", 65, 74 )
  )

define "New Adult RSV Patients 75 and Above Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location Above Specified Age"( "Newly Admitted RSV Patient IDs", 75 )
  )

define "New RSV Patients with Unknown Age Stratifier":
  Count(
    "Get Confirmed Patient IDs in Bed Location and Unknown Age"( "Newly Admitted RSV Patient IDs" )
  )

//Devices (Supply is divided by average used per day (estimated))
define "N95 Mask Supply in Days Stratifier":
  Floor( Count(
    "Devices" Devices
    where Devices.type ~ "N95 mask"
  ) / 10 )

define "N95 Mask 3 Day Supply Stratifier":
  if "N95 Mask Supply in Days Stratifier" > 3 then 'y'
  else 'n'

define "OR Surgical Mask Supply in Days Stratifier":
  Floor( Count(
    "Devices" Devices
    where Devices.type ~ "Surgical mask"
  ) / 10 )

define "OR Surgical Mask 3 Day Supply Stratifier":
  if "OR Surgical Mask Supply in Days Stratifier" > 3 then 'y'
  else 'n'

define "Face Shield Supply in Days Stratifier":
  Floor( Count(
    "Devices" Devices
    where Devices.type ~ "Face shield"
  ) / 10 )

define "Face Shield 3 Day Supply Stratifier":
  if "Face Shield Supply in Days Stratifier" > 3 then 'y'
  else 'n'

define "Gown Supply in Days Stratifier":
  Floor( Count(
    "Devices" Devices
    where Devices.type ~ "Patient gown"
  ) / 5 )

define "Gown 3 Day Supply Stratifier":
  if "Gown Supply in Days Stratifier" > 3 then 'y'
  else 'n'

define "Glove Supply in Days Stratifier":
  Floor( Count(
    "Devices" Devices
    where Devices.type ~ "Surgical glove"
  ) / 15 )

define "Glove 3 Day Supply Stratifier":
  if "Glove Supply in Days Stratifier" > 3 then 'y'
  else 'n'

//Functions and Helpers
define "COVID_19 Observations":
  [Observation: "COVID_19 (Tests for SARS_CoV_2 Nucleic Acid)"] 
    union [Observation: "COVID_19 (Tests for SARS_CoV_2 Antigen)"]

define "Newly Admitted COVID_19 Patient IDs":
  "Get Confirmed Patient IDs"( "Newly Admitted Encounters", "COVID_19 Observations" )

define "Count Confirmed COVID_19 Patients in Bed Location":
  Count(
    "Get Confirmed Patient IDs"( "Encounters", "COVID_19 Observations" )
  )

define "Influenza Observations":
  [Observation: "Influenza (Tests for influenza A or B virus Nucleic Acid)"] 
    union [Observation: "Influenza (Tests for influenza A or B virus Antigen)"]

define "Newly Admitted Influenza Patient IDs":
  "Get Confirmed Patient IDs"( "Newly Admitted Encounters", "Influenza Observations" )

define "Count Confirmed Influenza Patients in Bed Location":
  Count(
    "Get Confirmed Patient IDs"( "Encounters", "Influenza Observations" )
  )

define "RSV Observations":
  [Observation: "RSV (Tests for RSV Antigen)"] 
    union [Observation: "RSV (Tests for RSV Nucleic Acid)"]

define "Newly Admitted RSV Patient IDs":
  "Get Confirmed Patient IDs"( "Newly Admitted Encounters", "RSV Observations" )

define "Count Confirmed RSV Patients in Bed Location":
  Count(
    "Get Confirmed Patient IDs"( "Encounters", "RSV Observations" )
  )

define "IsBedLocation":
  Location.physicalType ~ "Bed"

define "Encounters":
  [Encounter]

define "Devices":
  [Device]

define "Newly Admitted Encounters":
  "Encounters" Encounters
  where Encounters.status in { 'in-progress', 'arrived', 'triaged' }

define "Patients":
  [Patient]

define function "Get Confirmed Patient IDs"( Encounters List<FHIR.Encounter>, Observations List<FHIR.Observation> ):
  Distinct(
    Encounters Encounter
    where exists(
      Observations Labs
      where exists(
        Labs.category category
        where category ~ "laboratory"
      )
      and Encounter.subject = Labs.subject
      and Labs.value ~ "detected"
      and "Normalize Interval"( Labs.effective ) overlaps Encounter.period
    )
    return Encounter.subject
  )

define function "Get Confirmed Patient IDs in Bed Location Between Specified Ages"( PatientIDs List<FHIR.Reference>, low System.Integer, high System.Integer ):
  PatientIDs PatientID
  where exists(
    "Patients" Patients
    let PatientAge: CalculateAgeInYearsAt( Patients.birthDate, start of "Measurement Period" )
    where Patients.id = GetId( PatientID.reference )
    and PatientAge >= low
    and PatientAge <= high
  )

define function "Get Confirmed Patient IDs in Bed Location Above Specified Age"( PatientIDs List<FHIR.Reference>, age System.Integer ):
  PatientIDs PatientID
  where exists(
    "Patients" Patients
    let PatientAge: CalculateAgeInYearsAt( Patients.birthDate, start of "Measurement Period" )
    where Patients.id = GetId( PatientID.reference )
    and PatientAge >= age
  )

define function "Get Confirmed Patient IDs in Bed Location and Unknown Age"( PatientIDs List<FHIR.Reference> ):
  PatientIDs PatientID
  where exists(
    "Patients" Patients
    where Patients.id = GetId( PatientID.reference )
    and Patients.birthDate = null
  )

define function "GetCondition"( reference Reference ):
  singleton from (
	[Condition] Conditions
		where Conditions.id = GetId( reference.reference )
  )

define function "GetId"( uri String ):
  Last(Split(uri, '/'))

define function "Normalize Interval"( choice Choice<FHIR.dateTime, FHIR.Period, FHIR.Timing, FHIR.instant> ):
  case
	  when choice is FHIR.dateTime then
    	Interval[FHIRHelpers.ToDateTime(choice as FHIR.dateTime), FHIRHelpers.ToDateTime(choice as FHIR.dateTime)]
		when choice is FHIR.Period then
  		FHIRHelpers.ToInterval(choice as FHIR.Period)
		when choice is FHIR.instant then
			Interval[FHIRHelpers.ToDateTime(choice as FHIR.instant), FHIRHelpers.ToDateTime(choice as FHIR.instant)]
		when choice is FHIR.Timing then
		  Message(null as Interval<DateTime>, true, '1', 'Error', 'Cannot compute a single interval from a Timing type')
		else
			null as Interval<DateTime>
	end

define "EncounterCheck":
  exists("Encounters" Encounters
  where Encounters.period overlaps "Measurement Period")

define "LocationIsHOSP":
  exists(
    Location.type types
    where types ~ "HOSP"
  )

define "LocationIsIPF":
  exists(
    Location.type types
    where types ~ "IPF"
  )

define "LocationIsIRF":
  exists(
    Location.type types
    where types ~ "IRF"
  )

define "LocationIsCHLD":
  exists(
    Location.type types
    where types ~ "CHLD"
  )

define "LocationIsOTH":
  exists(
    Location.type types
    where types ~ "OTH"
  )