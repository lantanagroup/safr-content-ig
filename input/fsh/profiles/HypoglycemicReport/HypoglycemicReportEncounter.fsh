
Profile: HypoglycemicReportEncounter
Parent: USCoreEncounterProfile
Id: hypoglycemic-reporting-encounter
Title: "Hypoglycemic Event Encounter"
Description: "This profile contains Required and Must Support data elements for reporting encounter information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 US Core Encounter Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier 1..
  * use MS
  * type MS
  * period MS
* status from AcuteCareHospitalMonthlyEncounterStatus (required) // MEASDEV-703, MEASDEV-756
* status ^short = "triaged | in-progress | finished | onleave | entered-in-error"
* status ^definition = "triaged | in-progress | finished | onleave | entered-in-error."
* classHistory MS
* subject.reference 1.. MS
* period 1..
* diagnosis MS
  * use MS
* hospitalization
  * admitSource MS
  * reAdmission MS
* location 1..
  * ^short = "List of locations where the patient has been. Used in part to discern whether the patient is Inpatient, Emergency and or Observation status."
  * status MS
  * period 1..
  * location.reference 1.. MS