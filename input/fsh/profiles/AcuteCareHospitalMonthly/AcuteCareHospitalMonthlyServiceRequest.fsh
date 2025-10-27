Profile: AcuteCareHospitalMonthlyReportingServiceRequest
Parent: USCoreServiceRequestProfile|6.1.0
Id: ach-monthly-servicerequest
Title: "ACH Monthly Event ServiceRequest"
Description: "This profile contains Required and Must Support data elements for reporting service request (order) information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the US Core 6.1.0 [ServiceRequest](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-servicerequest.html) profile and applies capabilities from the QI Core 6.0.0 [ServiceRequest](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-servicerequest.html) profile and QI Core 6.0.0 [Service Not Requested](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-servicenotrequested.html) profile."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-servicerequest|6.1.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1

* extension contains http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-doNotPerformReason named reasonRefused 0..1 MS
* status ^short = "(QI-Core)(USCDI) draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* doNotPerform ^short = "(QI-Core) True if service/procedure should not be performed"

* category from http://hl7.org/fhir/ValueSet/servicerequest-category (extensible)
* category MS
* priority MS
* doNotPerform MS
* code from http://hl7.org/fhir/ValueSet/procedure-code (extensible)
* code MS
* code.extension contains http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet named notDoneValueSet 0..1
* code.extension[notDoneValueSet] ^short = "(QI-Core) What was not requested"
* code obeys not-done-extension-present
//  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//  * ^binding.extension.valueString = "ServiceRequestCode"
//  * ^binding.description = "Codes for tests or services that can be carried out by a designated individual, organization or healthcare service."
* subject.reference 1.. MS
* subject only Reference(CrossMeasurePatient)
* subject ^short = "(QI-Core)(USCDI) Individual or Entity the service is ordered for"
* encounter MS
  * reference 1.. MS
* occurrence[x] MS
* occurrence[x] ^short = "(QI-Core)(USCDI) When service should occur"
* asNeeded[x] MS
* authoredOn 1..
* authoredOn ^short = "(QI-Core)(USCDI) Date request signed"
* reasonCode ^short = "(QI-Core)(USCDI) Explanation/Justification for procedure or service"
* reasonReference ^short = "(QI-Core)(USCDI) Explanation/Justification for service or service"  
* specimen MS
  * reference 1.. MS
* specimen only Reference(AcuteCareHospitalMonthlyReportingSpecimen)

// TODO 10/2/2023 - Corey - Create an invariant requring that either category exists or code exists.