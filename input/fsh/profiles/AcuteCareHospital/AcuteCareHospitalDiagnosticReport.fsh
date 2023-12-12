Profile: AcuteCareHospitalDiagnosticReport
Parent: DiagnosticReport
Id: ach-reporting-diagnostic-report
Title: "Acute Care Hospital General Diagnostic Report"
Description: "TO BE REPLACED - This profile includes the name and version of the device or software submitting the report Bundle, and may include other information about the device."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* basedOn MS
* status MS
* category 1.. MS
* category from report-codes (extensible)
* code MS
* code from report-codes (extensible)
* subject 1.. MS
* encounter MS
* effective[x] MS
* issued MS
* performer MS
* conclusionCode MS
* presentedForm MS

