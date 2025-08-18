Profile: AcuteCareHospitalDailyEventMedicationAdministration
Parent: MedicationAdministration
Id: ach-daily-medicationadministration
Title: "ACH Daily Event Medication Administration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information for the NHSN Acute Care Hospital (ACH) Daily Digital Quality Measures. This profile is based on the [HL7 FHIR R4 MedicationAdministration Resource v4.0.1](http://hl7.org/fhir/R4/medicationadministration.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* status = #completed
* statusReason MS
* statusReason from http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes (extensible)
* category MS
* category from http://hl7.org/fhir/ValueSet/medication-admin-category (extensible)
* medication[x] from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* medicationReference.reference 1.. MS
* subject.reference 1.. MS
* context MS
* context.reference 1.. MS
* reasonCode MS
* reasonReference MS
  * reference 1.. MS
* request MS