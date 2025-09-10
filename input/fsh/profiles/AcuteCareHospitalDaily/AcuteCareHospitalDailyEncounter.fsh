Profile: AcuteCareHospitalDailyEventEncounter
Parent: USCoreEncounterProfile
Id: ach-daily-encounter
Title: "ACH Daily Event Encounter"
Description: "This profile contains Required and Must Support data elements for reporting encounter information for the NHSN ACH Daily dQM. This profile is based on the [HL7 FHIR® US Core Encounter Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html)."

* obeys encounter-ach-daily-initial-population

* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier 1..
  * use MS
  * type MS
  * period MS
* status from AcuteCareHospitalDailyEncounterStatus (required)
* status ^short = "triaged | in-progress | finished | onleave | entered-in-error"
* status ^definition = "triaged | in-progress | finished | onleave | entered-in-error."
* statusHistory.status 1.. // TODO Verify this is actually required when statusHistory is not nor is MS as per the DD
* classHistory MS
* subject.reference 1.. MS
* period 1..
* hospitalization
  * admitSource MS
  * reAdmission MS
  * reAdmission from http://terminology.hl7.org/ValueSet/v2-0092 (preferred)
  * dischargeDisposition from http://hl7.org/fhir/ValueSet/encounter-discharge-disposition (required)
* location 1..
  * ^short = "List of locations where the patient has been. Used in part to discern whether the patient is Inpatient, Emergency and or Observation status."
  * status MS
  * period 1..
  * location.reference 1.. MS


  // TODO MEASDEV-703
  /* Add invariant to address Initial Population requirement
  (Encounter.class = EMER, IMP, ACUTE, NONAC, or SS [Short Stay]) 
    OR ((Encounter.type = Emergency Hospital admission, Hospital admission, or elective hospital admission [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307])
    OR (Encounter.type = Emergency department patient visit [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292])
    OR (Encounter.type = Admission to Observation unit [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143]))
    OR (Encounter.location:Location.type in http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265)
  
  */