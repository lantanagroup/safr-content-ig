Instance: location-example-ach-monthly-crit-part
InstanceOf: AcuteCareHospitalMonthlyReportingLocation
Title: "Location (part of)- Example ACH Monthly - Medical Critical Care"
Description: "Location (part of) - Example ACH Monthly - Medical Critical Care, demonstrating location that is part of another"
Usage: #example
* identifier.system = "http://www.example.com/location"
* identifier.value = "2936"
* status = #active
* name = "ACH Monthly Medical Critical Care"
* description = "ACH Monthly Medical Critical Care"
* type = $hsloc.html#1027-2 "Medical Critical Care"
* type.text = "Medical Critical Care"
* partOf = Reference(location-example-ach-monthly-crit)