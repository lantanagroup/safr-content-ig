Profile: LongTermCareMonthlyEventLabObservation
Parent: QICoreLaboratoryResultObservation|6.0.0
Id: ltc-monthly-observation-lab
Title: "LTC Monthly Event Lab Result Observation"
Description: "This profile contains Required and Must Support data elements for reporting laboratory result information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [Laboratory Result Observation](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-observation-lab.html) profile, which inherits from the US Core 6.1.0 [Laboratory Result Observation](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-lab.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-observation-lab|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
// * subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* effective[x] 1..
* issued MS
* interpretation MS
* bodySite MS
* method MS
* method from http://hl7.org/fhir/ValueSet/observation-methods (extensible)
* specimen MS
  * reference 1.. MS
// * hasMember MS
//   * reference 1.. MS
// * derivedFrom MS
* component MS
  * code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
  * value[x] MS
  * interpretation MS