Profile: AcuteCareHospitalMonthlyReportingSpecimen
Parent: USCoreSpecimenProfile|6.1.0
Id: ach-monthly-specimen
Title: "ACH Monthly Event Specimen"
Description: "This profile contains Required and Must Support data elements for reporting specimen information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the US Core 6.1.0 [Specimen](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-specimen.html) profile."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen|6.1.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
//* type from http://terminology.hl7.org/ValueSet/v2-0487 (required)
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.54 (required)
//Requirement now inherited by USCoreSpecimenProfile
//* type 1..
* subject only Reference(CrossMeasurePatient)
* subject.reference 1.. MS

* collection 1.. MS
* collection.collected[x] 1.. MS
* collection.bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
* collection.bodySite 1.. MS

// TODO QUESTION ON DD, Which references should be changed to NHSN profiles or QI?