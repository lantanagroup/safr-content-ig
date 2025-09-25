Profile: AcuteCareHospitalMonthlyReportingMedication
Parent: USCoreMedicationProfile|6.1.0
Id: ach-monthly-medication
Title: "ACH Monthly Event Medication"
Description: "This profile contains Required and Must Support data elements for reporting medication information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® US Core Medication Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medication.html)."
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medication|6.1.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* status MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes (extensible)
* form MS
* amount MS
* ingredient MS
  * itemReference.reference 1.. MS