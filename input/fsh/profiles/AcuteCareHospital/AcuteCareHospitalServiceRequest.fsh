Profile: AcuteCareHospitalReportingServiceRequest
Parent: ServiceRequest
Id: ach-reporting-servicerequest
Title: "Acute Care Hospital Reporting ServiceRequest"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting blood glucose order information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 ServiceRequest Profile v4.0.1](http://hl7.org/fhir/R4/servicerequest.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* category MS
* priority MS
* doNotPerform MS
* code MS
//  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//  * ^binding.extension.valueString = "ServiceRequestCode"
//  * ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."
* encounter MS
* occurrence[x] MS
* asNeeded[x] MS
* authoredOn 1..
* reasonReference MS
* specimen MS

// TODO 10/2/2023 - Corey - Create an invariant requring that either category exists or code exists.