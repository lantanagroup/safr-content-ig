Profile: RespiratoryPathogensSurveillanceEventMedicationRequest
Parent: USCoreMedicationRequestProfile
Id: rps-medicationrequest
Title: "RPS Event MedicationRequest"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR® US Core MedicationRequest Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medicationrequest.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
// * status TODO check does there need to be a requirement binding of code = completed 
* category MS
* priority MS
* doNotPerform MS
* reasonCode MS
* instantiatesCanonical MS
* instantiatesUri MS
* dosageInstruction
  * timing MS
  * asNeeded[x] MS
  * site MS
  * route 1..
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS
    * rate[x] MS