Profile: AcuteCareHospitalDailyEventMedicationRequest
Parent: USCoreMedicationRequestProfile
Id: ach-daily-medicationrequest
Title: "ACH Daily Event Medication Request"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information for the NHSN Acute Care Hospital (ACH) Daily Digital Quality Measure. This profile is based on the [HL7 FHIR® US Core MedicationRequest Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medicationrequest.html)."
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
  * route 1..
  * route from http://hl7.org/fhir/ValueSet/route-codes (extensible)
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS
    * rate[x] MS