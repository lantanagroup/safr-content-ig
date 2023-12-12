Profile: RespiratoryPathogensSurveillanceEventEncounter
Parent: USCoreEncounterProfile
Id: rps-encounter
Title: "Respiratory Pathogens Surveillance Event Report Encounter"
Description: "This profile contains Required and Must Support data elements for reporting encounter information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core Encounter Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier 1..
  * use MS
  * type MS
  * period MS
* status from RespiratoryPathogensSurveillanceEventEncounterStatus (required)
* status ^short = "triaged | in-progress | onleave | finished"
* status ^definition = "triaged | in-progress | onleave | finished."
* statusHistory.status 1.. // TODO Verify this is actually required when statusHistory is not nor is MS as per the DD
* classHistory MS
* period 1..
* hospitalization
  * admitSource MS
  * reAdmission MS
* location 1..
  * ^short = "List of locations where the patient has been. Used in part to discern whether the patient is Inpatient, Emergency and or Observation status."
  * status MS
  * period 1..


  // TODO MEASDEV-703
  /* Add invariant to address Initial Population (IP) requirement
  (Encounter.class = EMER, IMP, ACUTE, NONAC, or SS [Short Stay]) 
    OR ((Encounter.type = Emergency Hospital admission, Hospital admission, or elective hospital admission [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307])
    OR (Encounter.type = Emergency department patient visit [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292])
    OR (Encounter.type = Admission to Observation unit [http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143]))
    OR (Encounter.location:Location.type in http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265)
  
  */