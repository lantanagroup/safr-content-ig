Profile: AcuteCareHospitalDailyEventLabDiagnosticReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: ach-daily-diagnosticreport-lab
Title: "ACH Daily Event Diagnostic Report (Lab)"
Description: "This profile contains Required and Must Support data elements for reporting diagnostic report lab information to the NHSN Acute Care Hospital (ACH) Daily Module. This profile is based on the [HL7 FHIR® US Core Diagnostic Report - Lab Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-diagnosticreport-lab.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
// * status  TODO verify is binding needed as stated in DD:w The following constraints are written into the CQL: 'final','registered','preliminary','partial'
* status from AcuteCareHospitalDailyEventDiagnosticReportStatus (required)
* status ^short = "final | registered | preliminary | partial"
* status ^definition = "final | registered | preliminary | partial"
* subject.reference 1.. MS

* encounter MS
  * reference 1.. MS
* specimen MS
  * reference 1.. MS
* conclusion MS
* conclusionCode MS