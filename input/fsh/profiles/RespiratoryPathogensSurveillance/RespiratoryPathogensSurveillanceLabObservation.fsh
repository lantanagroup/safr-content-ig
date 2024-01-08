Profile: RespiratoryPathogensSurveillanceEventLabObservation
Parent: USCoreLaboratoryResultObservationProfile
Id: rps-reporting-lab-observation
Title: "Respiratory Pathogens Surveillance Event Lab Observation"
Description: "This profile contains Required and Must Support data elements for reporting COVID-19, Influenza, and Respiratory Syncytial Virus (RSV) laboratory result information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core Laboratory Result Observation Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-observation-lab.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
* effective[x] 1..
* issued MS
* interpretation MS
* bodySite MS
* method MS
* specimen MS
* hasMember MS
* derivedFrom MS
* component MS
  * value[x] MS
  * interpretation MS