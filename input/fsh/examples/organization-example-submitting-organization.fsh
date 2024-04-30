Instance: organization-example-submitting-organization
InstanceOf: SubmittingOrganization
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