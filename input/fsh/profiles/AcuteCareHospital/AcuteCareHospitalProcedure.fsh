Profile: AcuteCareHospitalReportingProcedure
Parent: USCoreProcedureProfile
Id: ach-procedure
Title: "ACH Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting procedure information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Procedure Profile v3.1.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* location MS
* reasonCode MS
* reasonReference MS
* bodySite MS