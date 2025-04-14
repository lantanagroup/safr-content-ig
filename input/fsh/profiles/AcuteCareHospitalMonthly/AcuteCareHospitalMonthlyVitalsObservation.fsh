Profile: AcuteCareHospitalMonthlyReportingVitalsObservation
Parent: $vital-sign-profile
Id: ach-monthly-observation-vitals
Title: "ACH Monthly Event Observation - Vital Signs"
Description: "This profile contains Required and Must Support data elements for reporting observation-vital signs information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 Observation Vital Signs Profile v4.0.1](https://hl7.org/fhir/R4/vitalsigns.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* partOf MS
* code from http://hl7.org/fhir/ValueSet/observation-vitalsignresult (extensible)
* encounter MS
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
* component
  * interpretation MS
  * referenceRange MS
    * low MS
    * high MS
    * age MS