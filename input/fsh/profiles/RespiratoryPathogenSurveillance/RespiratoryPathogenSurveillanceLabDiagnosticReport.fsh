Profile: RespiratoryPathogensSurveillanceEventLabDiagnosticReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: rps-lab-diagnostic-report
Title: "Respiratory Pathogens Surveillance Event Laboratory Diagnostic Report"
Description: "This profile contains Required and Must Support data elements for reporting laboratory result report information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 US Core Diagnostic Report - Lab Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-diagnosticreport-lab.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
// * status  TODO verify is binding needed as stated in DD:w The following constraints are written into the CQL: 'final','registered','preliminary','partial'
* encounter MS
* specimen MS
* performer MS // TODO verify this is really MS as stated in DD
* conclusion MS
* conclusionCode MS