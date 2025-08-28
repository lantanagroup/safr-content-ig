Profile: AcuteCareHospitalMonthlyReportingLabObservation
Parent: USCoreLaboratoryResultObservationProfile
Id: ach-monthly-observation-lab
Title: "ACH Monthly Event Lab Result Observation"
Description: "This profile contains Required and Must Support data elements for reporting laboratory result information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® US Core Lab Observation Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-observation-lab.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* encounter MS
  * reference 1.. MS
* effective[x] 1..
* issued MS
* interpretation MS
* bodySite MS
* method from http://hl7.org/fhir/ValueSet/observation-methods (extensible)
* method MS
* subject.reference 1.. MS
* specimen MS
  * reference 1.. MS
* component MS
  * code from http://hl7.org/fhir/ValueSet/observation-codes (extensible)
  * value[x] MS
  * interpretation MS