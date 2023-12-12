Profile: RespiratoryPathogensSurveillanceEventServiceRequest
Parent: ServiceRequest
Id: rps-servicerequest
Title: "Respiratory Pathogens Surveillance Event ServiceRequest"
Description: "This profile contains Required and Must Support data elements for reporting COVID-19, Influenza, and Respiratory Syncytial Virus (RSV) laboratory order information to the NHSN Respiratory Pathogens Surveillance (RPS) Module. This profile is based on the [HL7 FHIR R4 ServiceRequest Resource v4.0.1](http://hl7.org/fhir/R4/servicerequest.html)."
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