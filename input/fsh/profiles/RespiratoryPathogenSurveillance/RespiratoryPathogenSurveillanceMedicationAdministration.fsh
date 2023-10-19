Profile: RespiratoryPathogenSurveillanceEventMedicationAdministration
Parent: MedicationAdministration
Id: respiratory-pathogen-surveillance-event-medicationadministration
Title: "Respiratory Pathogen Surveillance Event MedicationAdministration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR R4 MedicationAdministration Profile v4.0.1](http://hl7.org/fhir/R4/medicationadministration.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* statusReason MS
* category MS
* context MS
* reasonCode MS
* reasonReference MS
* request MS