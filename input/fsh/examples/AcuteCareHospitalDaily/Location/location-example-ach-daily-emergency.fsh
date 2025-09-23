Instance: location-example-ach-daily-emergency
InstanceOf: AcuteCareHospitalDailyEventLocation
Title: "Location - Example ACH Daily - Emergency"
Description: "Location - Example ACH Daily - Emergency Department Pavilion"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.6869"
* identifier.value = "100001090"
* name = "EMERGENCY - PAVILION"
* alias[0] = "ED"
* alias[+] = "EDPAV"
* mode = #instance
* type = $hsloc.html#1108-0 "Emergency Department"
* telecom[0].system = #phone
* telecom[=].value = "916-734-3790"
* telecom[=].rank = 1
* telecom[+].system = #fax
* telecom[=].value = "916-703-6549"
* address.line = "2315 Stockton Boulevard"
* address.city = "Sacramento"
* address.state = "CALIFORNIA"
* address.postalCode = "95817-2201"