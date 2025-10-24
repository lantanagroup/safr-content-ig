Profile: AcuteCareHospitalMonthlyLabDiagnosticReport
Parent: QICoreDiagnosticReportLab|6.0.0
Id: ach-monthly-diagnosticreport-lab
Title: "ACH Monthly Event Diagnostic Report (Lab)"
Description: "This profile contains Required and Must Support data elements for reporting diagnostic report lab information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-diagnosticreport-lab.html) profile, which inherits from the US Core 6.1.0 [DiagnosticReport Profile for Laboratory Results Reporting](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-diagnosticreport-lab.html) profile."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-diagnosticreport-lab|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* subject.reference 1.. MS
* subject only Reference(CrossMeasurePatient)
* encounter.reference 1.. MS
* specimen MS
  * reference 1.. MS
* specimen only Reference(AcuteCareHospitalMonthlyReportingSpecimen)
* result.reference 1.. MS