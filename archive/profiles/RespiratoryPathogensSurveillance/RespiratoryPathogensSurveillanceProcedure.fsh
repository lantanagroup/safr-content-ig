Profile: RespiratoryPathogensSurveillanceEventProcedure
Parent: USCoreProcedureProfile
Id: rps-procedure
Title: "RPS Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting transmission-based precaution procedure information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core Procedure Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-procedure.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* location MS