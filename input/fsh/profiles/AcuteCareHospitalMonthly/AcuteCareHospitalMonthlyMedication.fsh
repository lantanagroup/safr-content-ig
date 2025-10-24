Profile: AcuteCareHospitalMonthlyReportingMedication
Parent: QICoreMedication|6.0.0
Id: ach-monthly-medication
Title: "ACH Monthly Event Medication"
Description: "This profile contains Required and Must Support data elements for reporting medication information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [Medication](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medication.html) profile, which inherits from the US Core 6.1.0 [Medication](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-medication.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medication|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* status MS
* form from http://hl7.org/fhir/ValueSet/medication-form-codes (extensible)
* form MS
* amount MS
* ingredient MS
  * itemReference.reference 1.. MS