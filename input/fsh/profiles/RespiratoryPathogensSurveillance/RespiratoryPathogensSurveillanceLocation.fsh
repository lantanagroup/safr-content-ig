Profile: RespiratoryPathogensSurveillanceEventLocation
Parent: USCoreLocation
Id: rps-location
Title: "RPS Event Location"
Description: "This profile contains Required and Must Support data elements for reporting location information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core Location Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-location.html)."

* obeys location-type-initial-population
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* alias MS
* address.use MS
* physicalType from http://hl7.org/fhir/ValueSet/location-physical-type (extensible)
* physicalType MS
* type 1..
* type from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType (extensible)
* partOf MS
