Profile: RespiratoryPathogenSurveillanceEventLabObservation
Parent: USCoreLaboratoryResultObservationProfile
Id: rps-lab-observation
Title: "Respiratory Pathogen Surveillance Event Lab Observation"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting blood-glucose result information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 US Core Observation Lab Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-observation-lab.html)"
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