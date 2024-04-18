Profile: RespiratoryPathogensSurveillanceEventSpecimen
Parent: Specimen
Id: rps-specimen
Title: "RPS Event Specimen"
Description: "This profile contains Required and Must Support data elements for reporting COVID-19, Influenza, and Respiratory Syncytial Virus (RSV) specimen information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR R4 Specimen Resource v4.0.1](http://hl7.org/fhir/R4/specimen.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* identifier MS
* accessionIdentifier MS
* status MS
* type 1..
* collection 1..
* collection.collected[x] 1..
* collection.bodySite 1..
