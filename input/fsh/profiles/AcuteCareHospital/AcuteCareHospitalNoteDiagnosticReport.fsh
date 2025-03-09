Profile: AcuteCareHospitalNoteDiagnosticReport
Parent: USCoreDiagnosticReportProfileNoteExchange
Id: ach-diagnosticreport-note
Title: "ACH Event Diagnostic Report - Report and Note"
Description: "This profile contains Required and Must Support data elements for reporting diagnostic report- report and note information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Diagnostic Report - Report and Note Exchange](https://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-diagnosticreport-note.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* category from us-core-diagnosticreport-category (required)
* basedOn MS
  * reference 1.. MS
* subject.reference 1.. MS
* encounter.reference 1.. MS
* conclusionCode MS