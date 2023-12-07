Profile: AcuteCareHospitalReportingCondition
Parent: USCoreCondition
Id: ach-reporting-condition
Title: "Acute Care Hospital Reporting Condition"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting patient condition information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 US Core Condition Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* onset[x] MS
* abatement[x] MS
* recordedDate MS