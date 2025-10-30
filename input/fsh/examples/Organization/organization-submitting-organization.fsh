/*
Instance: ProviderSubmittingOrganization
InstanceOf: USSafrSubmittingOrganization
Title: "Organization - Example Submitting Organization"
Description: "Organization - Submitting Organization Example"
Usage: #example
* identifier[nhsn_org_id].system = "https://www.cdc.gov/nhsn/OrgID"
* identifier[nhsn_org_id].value = "ExampleNHSNSubmitterOrgID"
* active = true
* type = $organization-type#prov "Healthcare Provider"
* name = "Example NHSN Submitter"
* address.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* address.extension.valueCode = #unknown
* telecom.system = #phone
* telecom.value = "5555555551"
* telecom.rank = 1
*/

// Define the reporting organization
Instance: MemorialHospitalOrganization
InstanceOf: USSafrSubmittingOrganization
Title: "Organization - Submitting Hospital Organization Example"
Description: "Organization - Example of a Submitting Hospital Organization"
Usage: #example
* identifier[nhsn_org_id].system = "https://www.cdc.gov/nhsn/OrgID"
* identifier[nhsn_org_id].value = "123456789"
* active = true
* name = "Memorial Hospital"
* address.line = "123 Healthcare Drive"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "USA"
* telecom.system = #phone
* telecom.value = "+1-555-123-4567"
* telecom.use = #work
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"