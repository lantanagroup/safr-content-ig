Profile: AcuteCareHospitalDailyEventMedication
Parent: USCoreMedicationProfile
Id: ach-daily-medication
Title: "ACH Daily Event Medication"
Description: "This profile contains Required and Must Support data elements for reporting medication information to the NHSN Acute Care Hospital (ACH) Daily Module. This profile is based on the [HL7 FHIR® US Core Medication Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medication.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* code from http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes (extensible)
* status MS
* form MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes (extensible)
* amount MS
* ingredient MS