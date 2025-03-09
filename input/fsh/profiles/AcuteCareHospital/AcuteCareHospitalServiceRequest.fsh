Profile: AcuteCareHospitalReportingServiceRequest
Parent: ServiceRequest
Id: ach-servicerequest
Title: "ACH Event ServiceRequest"
Description: "This profile contains Required and Must Support data elements for reporting order information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 ServiceRequest Profile v4.0.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* category from http://hl7.org/fhir/ValueSet/servicerequest-category (extensible)
* category MS
* priority MS
* doNotPerform MS
* code from http://hl7.org/fhir/ValueSet/procedure-code (extensible)
* code MS
//  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//  * ^binding.extension.valueString = "ServiceRequestCode"
//  * ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."
* subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* occurrence[x] MS
* asNeeded[x] MS
* authoredOn 1..
* reasonReference MS
  * reference 1.. MS
* specimen MS
  * reference 1.. MS

// TODO 10/2/2023 - Corey - Create an invariant requring that either category exists or code exists.