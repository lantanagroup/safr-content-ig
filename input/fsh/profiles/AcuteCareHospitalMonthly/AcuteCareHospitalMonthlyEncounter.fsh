Profile: AcuteCareHospitalMonthlyReportingEncounter
Parent: USCoreEncounterProfile
Id: ach-monthly-encounter
Title: "ACH Monthly Event Encounter"
Description: "This profile contains Required and Must Support data elements for reporting encounter information to the NHSN ACH Monthly dQM. This profile is based on the [HL7 FHIR® US Core Encounter Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-encounter.html)."

* obeys encounter-ach-monthly-initial-population
//* obeys encounter-ach-initial-population1
//* obeys encounter-ach-initial-population2
//* obeys encounter-ach-initial-population3
//* obeys encounter-ach-initial-population3a
//* obeys encounter-ach-initial-population3b
//* obeys encounter-ach-initial-population3c

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
  * rank MS
* hospitalization
  * origin MS
  * admitSource MS
  * reAdmission from http://terminology.hl7.org/ValueSet/v2-0092 (preferred)
  * reAdmission MS
  * dietPreference from http://hl7.org/fhir/ValueSet/encounter-diet (preferred)
  * dietPreference MS
  * dischargeDisposition from http://hl7.org/fhir/ValueSet/encounter-discharge-disposition (preferred)
* location 1..
  * ^short = "List of locations where the patient has been. Used in part to discern whether the patient is Inpatient, Emergency and or Observation status."
  * status MS
  * physicalType from http://hl7.org/fhir/ValueSet/location-physical-type (extensible)
  * physicalType MS
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