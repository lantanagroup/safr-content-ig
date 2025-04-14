Profile: AcuteCareHospitalMonthlyReportingSpecimen
Parent: Specimen
Id: ach-monthly-specimen
Title: "ACH Monthly Event Specimen"
Description: "This profile contains Required and Must Support data elements for reporting specimen information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 Specimen Profile v4.0.1](http://hl7.org/fhir/R4/specimen.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
//* type from http://terminology.hl7.org/ValueSet/v2-0487 (required)
* type from $SpecimenType (extensible)
* type 1..
* collection 1.. 
* collection.collected[x] 1..
* collection.bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
* collection.bodySite 1..