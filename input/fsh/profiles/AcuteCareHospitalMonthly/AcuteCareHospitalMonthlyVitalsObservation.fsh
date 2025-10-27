Profile: AcuteCareHospitalMonthlyReportingVitalsObservation
Parent: USCoreVitalSignsProfile|6.1.0
Id: ach-monthly-observation-vitals
Title: "ACH Monthly Event Observation - Vital Signs"
Description: "This profile contains Required and Must Support data elements for reporting observation-vital signs information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the US Core 6.1.0 [Vital Signs](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-vital-signs.html) "
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-vital-signs|6.1.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* partOf MS
  * reference 1.. MS
//* code from http://hl7.org/fhir/ValueSet/observation-vitalsignresult (extensible)
* subject.reference 1.. MS
* subject only Reference(CrossMeasurePatient)
* encounter.reference 1.. MS
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
* component
  * interpretation MS
  * referenceRange MS
    * low MS
    * high MS
    * age MS