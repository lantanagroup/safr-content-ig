Profile: HypoglycemicReportMedicationRequest
Parent: USCoreMedicationRequestProfile
Id: hypoglycemic-reporting-medicationrequest
Title: "Hypoglycemic Event MedicationRequest"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 US Core MedicationRequest Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-medicationrequest.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* category MS
* doNotPerform MS
* reasonCode MS
* instantiatesCanonical MS
* instantiatesUri MS
* courseOfTherapyType MS
* dosageInstruction
  * timing MS
  * asNeeded[x] MS
  * site MS
  * route MS
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS