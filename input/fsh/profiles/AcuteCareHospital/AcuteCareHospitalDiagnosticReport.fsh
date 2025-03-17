Profile: AcuteCareHospitalDiagnosticReport
Parent: DiagnosticReport
Id: ach-diagnosticreport
Title: "ACH Monthly Event General Diagnostic Report"
Description: "This profile contains Required and Must Support data elements for reporting general diagnostic report information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 DiagnosticReport Resource v4.0.1](https://hl7.org/fhir/R4/diagnosticreport.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* basedOn MS
* status MS
* category 1.. MS
* category from $daig-serv-section (extensible)
* code MS
* code from report-codes (extensible)
* subject 1.. MS
* encounter MS
* effective[x] 1..1 MS
* issued MS
//* performer MS
* conclusionCode MS
//* presentedForm MS

