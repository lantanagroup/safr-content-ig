Profile: SubmittingOrganization
Parent: Organization
Id: nhsn-submitting-organization
Title: "NHSN Submitting Organization"
Description: "This profile includes the name and identifier of the organization submitting the report Bundle, and may include other information about the organization."
* ^version = "1.0.0"
* ^status = #active
* ^date = "2023-05-15T19:23:44-07:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "system"
  * ^slicing.description = "Slice based on system pattern"
  * ^slicing.rules = #open
* identifier contains nhsn_org_id 1..1 MS
* identifier[nhsn_org_id] ^short = "NHSN Org ID"
  * system 1..
  * system = "https://www.cdc.gov/nhsn/OrgID"
  * value 1.. MS
* name 1..