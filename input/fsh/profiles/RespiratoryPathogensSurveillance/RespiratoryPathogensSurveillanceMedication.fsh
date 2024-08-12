Profile: RespiratoryPathogensSurveillanceEventMedication
Parent: USCoreMedicationProfile
Id: rps-medication
Title: "RPS Event Medication"
Description: "This profile contains Required and Must Support data elements for reporting medication information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core Medication Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medication.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* status MS
* form MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes (extensible)
* amount MS
* ingredient MS