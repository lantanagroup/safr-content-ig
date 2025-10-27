Profile: LongTermCareMonthlyEventSpecimen
Parent: USCoreSpecimenProfile|6.1.0
Id: ltc-monthly-specimen
Title: "LTC Monthly Event Specimen"
Description: "This profile contains Required and Must Support data elements for reporting specimen information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® US Core Specimen Profile v6.1.0](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-specimen.html)."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen|6.1.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
//Requirement now inherited by USCoreSpecimenProfile
//* type 1..
//* type from http://terminology.hl7.org/ValueSet/v2-0487 (extensible)
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.54 (required)
* collection 1..
* collection.collected[x] 1..
* collection.bodySite 1..
* collection.bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
