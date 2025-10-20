Profile: LongTermCareMonthlyEventMedication
Parent: QICoreMedication|6.0.0
Id: ltc-monthly-medication
Title: "LTC Monthly Event Medication"
Description: "This profile contains Required and Must Support data elements for reporting medication information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® QI Core Medication Profile v6.0.0](http://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medication.html)."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medication|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* code from http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes (extensible)
* status MS
* form MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes (extensible)
* amount MS
* ingredient MS
  * itemReference.reference 1.. MS