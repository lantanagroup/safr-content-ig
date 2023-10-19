Profile: AcuteCareHospitalImplantableDevice
Parent: USCoreImplantableDeviceProfile
Id: acute-care-hospital-reporting-implantable-device
Title: "Acute Care Hospital Implantable Device"
Description: "TO BE REPLACED - This profile includes the name and version of the device or software submitting the report Bundle, and may include other information about the device."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* udiCarrier.entryType MS
* status MS
* deviceName MS