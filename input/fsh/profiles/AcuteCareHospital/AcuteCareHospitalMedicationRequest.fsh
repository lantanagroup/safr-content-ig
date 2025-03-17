Profile: AcuteCareHospitalReportingMedicationRequest
Parent: USCoreMedicationRequestProfile
Id: ach-medicationrequest
Title: "ACH Monthly Event MedicationRequest"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® US Core MedicationRequest Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medicationrequest.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* statusReason from http://hl7.org/fhir/ValueSet/medicationrequest-status-reason (extensible)
* statusReason MS
* category from http://hl7.org/fhir/ValueSet/medicationrequest-category (extensible)
* category MS
* priority MS
* doNotPerform MS
* reasonCode MS
* medication[x] from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* reasonReference MS
* instantiatesCanonical MS
* instantiatesUri MS
* courseOfTherapyType MS
* dosageInstruction
  * text MS
  * timing MS
  * asNeeded[x] MS
  * site MS
  * route from http://hl7.org/fhir/ValueSet/route-codes (extensible)
  * route 1..
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS
    * rate[x] MS