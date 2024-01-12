Profile: AcuteCareHospitalReportingObservation
Parent: Observation
Id: ach-reporting-observation
Title: "ACH Event Observation"
Description: "This profile contains Required and Must Support data elements for reporting observation information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 Observation Resource v4.0.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-observation-lab.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* partOf MS
* category 1.. // TODO, should we require a VS? DD says: CQL constrains to these Categories:  Social-history, vital-signs, imaging, laboratory, procedure, survey
* subject 1..
* encounter MS
* effective[x] 1..
* issued MS
* value[x] MS
* interpretation MS
* bodySite MS
* method MS
* referenceRange MS
  * low MS
  * high MS
  * age MS
* hasMember MS
* component MS
  * code MS  // TODO verify is this really MS? DD has it as MS, but in general Required elements are not marked as MS
  * value[x] MS
  * interpretation MS 
  * referenceRange MS  // TODO verify is component.referenceRange really MS when referenceRange is not?
    * low MS
    * high MS
    * age MS