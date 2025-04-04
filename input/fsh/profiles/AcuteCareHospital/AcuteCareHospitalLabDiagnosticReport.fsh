Profile: AcuteCareHospitalLabDiagnosticReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: ach-diagnosticreport-lab
Title: "ACH Monthly Event Diagnostic Report (Lab)"
Description: "This profile contains Required and Must Support data elements for reporting diagnostic report lab information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Diagnostic Report - Lab Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-diagnosticreport-lab.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* subject.reference 1.. MS
* encounter.reference 1.. MS
* specimen MS
  * reference 1.. MS