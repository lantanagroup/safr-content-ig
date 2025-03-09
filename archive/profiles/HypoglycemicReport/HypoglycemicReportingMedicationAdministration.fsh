
Profile: HypoglycemicReportingMedicationAdministration
Parent: MedicationAdministration
Id: hypoglycemic-reporting-medicationadministration
Title: "Hypoglycemic Event MedicationAdministration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 MedicationAdministration Profile v4.0.1](http://hl7.org/fhir/R4/medicationadministration.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* statusReason MS
* category MS
* medicationReference.reference 1.. MS
* subject.reference 1.. MS
* reasonCode MS
* reasonReference MS
  * reference 1.. MS
* dosage 1..
  * route 1..
  * method MS
  * dose 1..
