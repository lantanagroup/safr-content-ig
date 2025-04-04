Profile: RespiratoryPathogensSurveillanceEventObservation
Parent: Observation
Id: rps-observation
Title: "RPS Daily Event Observation"
Description: "This profile contains Required and Must Support data elements for reporting observation information to the NHSN Respiratory Pathogens Surveillance (RPS) Daily Module. This profile is based on the [HL7 FHIR® R4 Observation Resource v4.0.1](https://hl7.org/fhir/R4/observation.html)."
* ^status = #active
* id 1..
* basedOn MS
  * reference 1.. MS
* partOf MS
  * reference 1.. MS
* category MS
* code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
* subject 1..
  * reference 1.. MS
* encounter MS
  * reference 1.. MS
* effective[x] 1..
* issued MS
* value[x] MS
* interpretation MS
* method MS
* method from http://hl7.org/fhir/ValueSet/observation-methods (extensible)
* hasMember MS
  * reference 1.. MS
* component MS
* component.code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
* component.value[x] MS
* component.interpretation MS