Profile: AcuteCareHospitalReportingSpecimen
Parent: Specimen
Id: ach-reporting-specimen
Title: "Acute Care Hospital Reporting Specimen"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting blood glucose specimen information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 Specimen Profile v4.0.1](http://hl7.org/fhir/R4/specimen.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
* type 1..
* collection 1..
  * collected[x] 1..