/*
replaced by dQM profile
Profile: NHSNSubmittingDevice
Parent: Device
Id: nhsn-submitting-device
Title: "NHSN Submitting Device"
Description: "This profile includes the name and version of the device or software submitting the report Bundle, and may include other information about the device."
* ^status = #active
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* deviceName 1..1
* version 1..*
*/