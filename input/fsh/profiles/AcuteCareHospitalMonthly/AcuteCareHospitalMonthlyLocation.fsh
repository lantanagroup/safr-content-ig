Profile: AcuteCareHospitalMonthlyReportingLocation
Parent: USCoreLocation
Id: ach-monthly-location
Title: "ACH Monthly Event Location"
Description: "This profile contains Required and Must Support data elements for reporting location information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core Location Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-location.html)."

// The constraint should not be on location but referenced through Encounter. The requirement is not that all locations have this binding, but that an encounter either has a location with a code in the valueSet or an Encounter.class with a specific value or an Encounter.type with a specific valueSet
//* obeys location-type-initial-population
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* alias MS
* address.use MS
* physicalType from http://hl7.org/fhir/ValueSet/location-physical-type (extensible)
* physicalType MS
* type 1..
* type from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType|3.0.0 (extensible)
* partOf MS
  * reference 1.. MS