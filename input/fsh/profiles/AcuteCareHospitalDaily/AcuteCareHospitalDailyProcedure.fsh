Profile: AcuteCareHospitalDailyEventProcedure
Parent: USCoreProcedureProfile
Id: ach-daily-procedure
Title: "ACH Daily Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting transmission-based precaution procedure information for the NHSN ACH Daily dQM. This profile is based on the [HL7 FHIR® US Core Procedure Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-procedure.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* location MS