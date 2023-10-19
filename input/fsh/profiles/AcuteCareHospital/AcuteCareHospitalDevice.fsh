Profile: AcuteCareHospitalDevice
Parent: Device
Id: acute-care-hospital-reporting-device
Title: "Acute Care Hospital Device"
Description: "TO BE REPLACED - This profile includes the name and version of the device or software submitting the report Bundle, and may include other information about the device."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* udiCarrier MS
  * deviceIdentifier MS
  * carrierAIDC MS
  * carrierHRF MS
  * entryType MS
* status MS
* distinctIdentifier MS
* deviceName MS
* type 1..
* patient 1..