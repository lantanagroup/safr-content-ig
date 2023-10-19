Profile: AcuteCareHospitalReportingProcedure
Parent: USCoreProcedureProfile
Id: acute-care-hospital-reporting-procedure
Title: "Acute Care Hospital Reporting Procedure"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting blood glucose order information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 ServiceRequest Profile v4.0.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* location MS
* reasonCode MS
* reasonReference MS
* bodySite MS