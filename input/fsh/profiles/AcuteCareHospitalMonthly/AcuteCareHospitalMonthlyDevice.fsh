Profile: AcuteCareHospitalMonthlyDevice
Parent: QICoreDevice|6.0.0
Id: ach-monthly-device
Title: "ACH Monthly Event Device"
Description: "This profile contains Required and Must Support data elements for reporting device information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile covers both implantable and other types of devices and inherits from the QI Core 6.0.0 [Device](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-device.html) profile, and applies some of the requirements from the US Core 6.1.0 [Implantable Device](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-implantable-device.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-device|6.0.0"
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* status MS
* type from http://hl7.org/fhir/ValueSet/device-type (extensible)
* type 1..
* patient 1..
  * reference 1.. MS
* patient only Reference(CrossMeasurePatient)