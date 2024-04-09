Instance: location-example-hypo-emergency
InstanceOf: AcuteCareHospitalReportingLocation
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.6869"
* identifier.value = "100001090"
* name = "EMERGENCY - PAVILION"
* alias[0] = "ED"
* alias[+] = "EDPAV"
* mode = #instance
* type = $v3-RoleCode#HOSP "Hospital"
* telecom[0].system = #phone
* telecom[=].value = "916-734-3790"
* telecom[=].rank = 1
* telecom[+].system = #fax
* telecom[=].value = "916-703-6549"
* address.line = "2315 Stockton Boulevard"
* address.city = "Sacramento"
* address.state = "CALIFORNIA"
* address.postalCode = "95817-2201"