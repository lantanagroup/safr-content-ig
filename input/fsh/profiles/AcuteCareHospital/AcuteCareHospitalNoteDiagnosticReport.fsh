Profile: AcuteCareHospitalNoteDiagnosticReport
Parent: USCoreDiagnosticReportProfileNoteExchange
Id: ach-reporting-note-diagnostic-report
Title: "Acute Care Hospital Note Doagnostic Report"
Description: "TO BE REPLACED - This profile includes the name and version of the device or software submitting the report Bundle, and may include other information about the device."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* basedOn MS
* conclusionCode MS