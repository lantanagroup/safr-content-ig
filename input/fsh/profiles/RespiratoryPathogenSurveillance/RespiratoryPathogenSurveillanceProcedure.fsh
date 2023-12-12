Profile: RespiratoryPathogensSurveillanceEventProcedure
Parent: USCoreProcedureProfile
Id: rps-procedure
Title: "Respiratory Pathogens Surveillance Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting transmission-based precaution procedure information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR R4 ServiceRequest Profile v4.0.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* location MS