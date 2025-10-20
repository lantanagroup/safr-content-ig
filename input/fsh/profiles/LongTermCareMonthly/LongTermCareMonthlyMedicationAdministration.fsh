Profile: LongTermCareMonthlyEventMedicationAdministration
Parent: QICoreMedicationAdministration|6.0.0
Id: ltc-monthly-medicationadministration
Title: "LTC Monthly Event Medication Administration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® QI Core MedicationAdministration Profile v6.0.0](http://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationadministration.html)."
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