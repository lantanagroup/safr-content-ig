Profile: AcuteCareHospitalMonthlyReportingLocation
Parent: QICoreLocation|6.0.0
Id: ach-monthly-location
Title: "ACH Monthly Event Location"
Description: "This profile contains Required and Must Support data elements for reporting location information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [Location](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-location.html) profile, which inherits from the US Core 6.1.0 [Location](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-location.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
// The constraint should not be on location but referenced through Encounter. The requirement is not that all locations have this binding, but that an encounter either has a location with a code in the valueSet or an Encounter.class with a specific value or an Encounter.type with a specific valueSet
//* obeys location-type-initial-population
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* alias MS
* physicalType from http://hl7.org/fhir/ValueSet/location-physical-type (extensible)
* physicalType MS
* type 1..
* type from http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType|3.0.0 (extensible)
* partOf MS
  * reference 1.. MS