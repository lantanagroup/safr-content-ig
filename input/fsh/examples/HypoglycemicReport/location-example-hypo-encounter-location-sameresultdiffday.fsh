Instance: location-example-hypo-encounter-location-sameresultdiffday
InstanceOf: AcuteCareHospitalReportingLocation
Title: "Location - Hypo Encounter Location Example Sameersultdiffday"
Description: "Location - Example Hypo Encounter Location Sameresultdiffday"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-location"
* identifier.system = "http://www.example.com/location"
* identifier.value = "29"
* status = #active
* name = "Health Level Seven International - Amherst"
* description = "HL7 Headquarters - East"
* type = $v3-RoleCode#HOSP "Hospital"
* type.text = "Hospital"
* telecom.system = #phone
* telecom.value = "(+1) 734-677-7777"
* address.line = "3300 Washtenaw Avenue, Suite 227"
* address.city = "Amherst"
* address.state = "MA"
* address.postalCode = "01002"
* address.country = "USA"
* position.longitude = -72.519854
* position.latitude = 42.373222
* managingOrganization.display = "Health Level Seven International"