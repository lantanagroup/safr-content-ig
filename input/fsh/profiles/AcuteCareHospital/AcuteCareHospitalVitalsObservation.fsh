Profile: AcuteCareHospitalReportingVitalsObservation
Parent: $vital-sign-profile
Id: ach-reporting-observation-vitals
Title: "Acute Care Hospital Reporting Vital Signs Observation"
Description: "This profile contains Required and Must Support data elements for reporting observation-vital signs information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 Observation Vital Signs Profile v4.0.1](https://hl7.org/fhir/R4/vitalsigns.html)."
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* partOf MS
* encounter MS
* issued MS
* interpretation MS
* bodySite MS
* method MS
* referenceRange MS
  * low MS
  * high MS
* hasMember MS
* component
  * interpretation MS
  * referenceRange MS
    * low MS
    * high MS