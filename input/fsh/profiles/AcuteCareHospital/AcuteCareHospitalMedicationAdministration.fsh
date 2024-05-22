Profile: AcuteCareHospitalReportingMedicationAdministration
Parent: MedicationAdministration
Id: ach-medicationadministration
Title: "ACH Event MedicationAdministration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 MedicationAdministration Resource v4.0.1](http://hl7.org/fhir/R4/medicationadministration.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* statusReason from http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes (extensible)
* statusReason MS
* category from http://hl7.org/fhir/ValueSet/medication-admin-category (extensible)
* category MS
* medication[x] from http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes (extensible)
* context MS
* reasonCode MS
* reasonReference MS
* request MS
* dosage 1..
  * route from http://hl7.org/fhir/ValueSet/route-codes (extensible)
  * route 1..
  * method MS
  * dose 1..