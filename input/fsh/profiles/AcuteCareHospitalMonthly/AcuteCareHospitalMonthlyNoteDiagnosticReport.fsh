Profile: AcuteCareHospitalMonthlyNoteDiagnosticReport
Parent: QICoreDiagnosticReportNote|6.0.0
Id: ach-monthly-diagnosticreport-note
Title: "ACH Monthly Event Diagnostic Report - Report and Note"
Description: "This profile contains Required and Must Support data elements for reporting diagnostic report- report and note information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [DiagnosticReport Profile for Report and Note Exchange](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-diagnosticreport-note.html) profile, which inherits from the US Core 6.1.0 [DiagnosticReport Profile for Report and Note Exchange](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-diagnosticreport-note.html) profile."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport-note|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* basedOn MS
  * reference 1.. MS
* subject.reference 1.. MS
* subject only Reference(CrossMeasurePatient)
* encounter.reference 1.. MS
* effective[x] 1..
* conclusionCode MS