Profile: AcuteCareHospitalMonthlyReportingObservation
Parent: QICoreSimpleObservation|6.0.0
Id: ach-monthly-observation
Title: "ACH Monthly Event Observation"
Description: "This profile contains Required and Must Support data elements for reporting observation information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [Simple Observation](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-simple-observation.html) profile, which inherits from the US Core 6.1.0 [Simple Observation](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-simple-observation.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-simple-observation|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* partOf MS
  * reference 1.. MS
//* status 1..
//* category 1.. 
* code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
* subject 1..
* subject only Reference(CrossMeasurePatient)
* subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* effective[x] 1..
* issued MS
* interpretation MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)
* bodySite MS
* method from http://hl7.org/fhir/ValueSet/observation-methods (extensible)
* method MS
* referenceRange MS
  * low MS
  * high MS
  * age MS
* hasMember MS
  * reference 1.. MS
* component MS
  * code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
  * code MS  // TODO verify is this really MS? DD has it as MS, but in general Required elements are not marked as MS
  * value[x] MS
  * interpretation MS 
  * referenceRange MS  // TODO verify is component.referenceRange really MS when referenceRange is not?
    * low MS
    * high MS
    * age MS