Profile: RespiratoryPathogensSurveillanceEventObservation
Parent: Observation
Id: rps-observation
Title: "RPS Event Observation"
Description: "This profile contains Required and Must Support data elements for reporting observation information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® R4 Observation Resource v4.0.1](https://hl7.org/fhir/R4/observation.html)."
* ^status = #active
* id 1..
* basedOn MS
* partOf MS
* category MS
* subject 1..
* encounter MS
* effective[x] 1..
* issued MS
* value[x] MS
* interpretation MS
* method MS
* hasMember MS
* component MS
* component.value[x] MS
* component.interpretation MS