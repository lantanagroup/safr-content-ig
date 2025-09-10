Profile: AcuteCareHospitalDailyEventSpecimen
Parent: Specimen
Id: ach-daily-specimen
Title: "ACH Daily Event Specimen"
Description: "This profile contains Required and Must Support data elements for reporting COVID-19, Influenza, and Respiratory Syncytial Virus (RSV) specimen information for the NHSN ACH Daily dQM. This profile is based on the [HL7 FHIR R4 Specimen Resource v4.0.1](http://hl7.org/fhir/R4/specimen.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
* type 1..
//* type from http://terminology.hl7.org/ValueSet/v2-0487 (extensible)
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1099.54 (extensible)
* collection 1..
* collection.collected[x] 1..
* collection.bodySite 1..
* collection.bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
