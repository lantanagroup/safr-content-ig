Profile: AcuteCareHospitalReportingVitalsObservation
Parent: $vital-sign-profile
Id: ach-reporting-vitals-observation
Title: "Acute Care Hospital Reporting Vital Signs Observation"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting blood-glucose result information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [FHIR Vital Signs Profile](https://hl7.org/fhir/R4/vitalsigns.html)"
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
  * age MS
* hasMember MS
* component
  * interpretation MS
  * referenceRange MS
    * low MS
    * high MS
    * age MS