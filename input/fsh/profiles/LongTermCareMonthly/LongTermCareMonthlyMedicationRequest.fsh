Profile: LongTermCareMonthlyEventMedicationRequest
Parent: QICoreMedicationRequest|6.0.0
Id: ltc-monthly-medicationrequest
Title: "LTC Monthly Event Medication Request"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® QI Core MedicationRequest Profile v6.0.0](http://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationrequest.html)."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-medicationrequest|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
// * status TODO check does there need to be a requirement binding of code = completed 
* category MS
* category from http://hl7.org/fhir/ValueSet/medicationrequest-category (extensible)
* priority MS
* doNotPerform MS
* medicationReference.reference 1.. MS
* reportedReference.reference 1.. MS
* reasonCode MS
* reasonReference MS
  * reference 1.. MS
* subject.reference 1.. MS
* encounter.reference 1.. MS
* instantiatesCanonical MS
* instantiatesUri MS
* dosageInstruction
  * timing MS
  * asNeeded[x] MS
  * site MS
  * route MS
  * route from http://hl7.org/fhir/ValueSet/route-codes (extensible)
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS
    * rate[x] MS