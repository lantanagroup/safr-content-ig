Profile: HypoglycemicReportingServiceRequest
Parent: ServiceRequest
Id: hypoglycemic-reporting-servicerequest
Title: "Hypoglycemic Reporting ServiceRequest"
Description: "This profile contains Required and Must Support data elements for reporting blood glucose specimen information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 Specimen Profile v4.0.1](http://hl7.org/fhir/R4/specimen.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* category MS
* priority MS
* doNotPerform MS
* code MS
* code from $procedure-code (example)
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ServiceRequestCode"
  * ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."
* encounter MS
* occurrence[x] MS
* asNeeded[x] MS
* authoredOn 1..
* reasonReference MS
* specimen MS