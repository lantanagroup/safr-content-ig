Profile: AcuteCareHospitalReportingProcedure
Parent: USCoreProcedureProfile
Id: ach-procedure
Title: "ACH Monthly Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting procedure information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Procedure Profile v3.1.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* location MS
  * reference 1.. MS
* reasonCode MS
* reasonCode from http://hl7.org/fhir/ValueSet/procedure-reason (extensible)
* reasonReference MS
  * reference 1.. MS
* bodySite MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)