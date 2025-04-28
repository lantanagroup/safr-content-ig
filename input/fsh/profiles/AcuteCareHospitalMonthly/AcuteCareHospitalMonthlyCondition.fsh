Profile: AcuteCareHospitalMonthlyReportingCondition
Parent: USCoreCondition
Id: ach-monthly-condition
Title: "ACH Monthly Event Condition"
Description: "This profile contains Required and Must Support data elements for reporting patient condition information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Condition Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition.html)."
* obeys Condition-coding-from-common-codesystems
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* onset[x] MS
* abatement[x] MS
* recordedDate MS