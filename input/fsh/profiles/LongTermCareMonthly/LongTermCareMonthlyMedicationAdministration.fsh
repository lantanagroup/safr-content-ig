Profile: LongTermCareMonthlyEventMedicationAdministration
Parent: MedicationAdministration
Id: ltc-monthly-medicationadministration
Title: "LTC Monthly Event Medication Administration"
Description: "This profile contains Required and Must Support data elements for reporting medication administration information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® R4 MedicationAdministration Resource v4.0.1](https://hl7.org/fhir/R4/medicationadministration.html) and applies capabilities of the QI Core 6.0.0 [MedicationAdministration](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationadministration.html) profile and QI Core 6.0.0 [MedicationAdministration Not Done](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationadministrationnotdone.html) profile."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* status MS
* status ^short = "(QI-Core) in-progress | on-hold | completed | entered-in-error | stopped | unknown"
* statusReason MS
* statusReason from http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes (extensible)
* category MS
* category from http://hl7.org/fhir/ValueSet/medication-admin-category (extensible)
* medication[x] obeys not-done-extension-present
* medication[x] MS
* medication[x] ^short = "(QI-Core) What was administered"
* medicationCodeableConcept.extension contains $QICoreNotDoneValueSet named notDoneValueSet 0..1
* medicationCodeableConcept.extension[notDoneValueSet] ^short = "(QI-Core) If not administered, Url of a value set of medications not administered"
* medicationCodeableConcept from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* medicationReference.reference 1.. MS
* medicationReference only Reference(AcuteCareHospitalMonthlyReportingMedication)
* subject.reference 1.. MS
* subject only Reference(CrossMeasurePatient)
* subject ^short = "(QI-Core) Who received medication"
* context MS
* context ^short = "(QI-Core) Encounter or Episode of Care administered as part of"
* context.reference 1.. MS
* effective[x] MS
* effective[x] ^short = "(QI-Core) Start and end time of administration"
* subject.reference 1.. MS
* context MS
* context.reference 1.. MS
* reasonCode MS
* reasonReference MS
* request.reference 1.. MS
* request only Reference(AcuteCareHospitalMonthlyReportingMedicationRequest)
* request ^short = "(QI-Core) Request administration performed against"
* dosage 1.. MS
  * route 1.. MS
  * route ^short = "(QI-Core) Path of substance into body"
  * method MS
  * dose 1.. MS
  * dose ^short = "(QI-Core) Amount of medication per dose"