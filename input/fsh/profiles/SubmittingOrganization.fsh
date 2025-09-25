
/* Replaces after Release 1.0.0, by inheriting from dQM
Profile: SubmittingOrganization
Parent: NHSNSubmittingOrganization
Id: nhsn-submitting-organization
Title: "NHSN Submitting Organization"
Description: "This profile includes the name and identifier of the organization submitting the report Bundle, and may include other information about the organization."
* ^version = "1.0.0-cibuild"
* ^status = #active
/* ^date = "2023-05-15T19:23:44-07:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.description = "Slice based on system value"
  * ^slicing.rules = #open
* identifier contains nhsn_org_id 1..1 MS
* identifier[nhsn_org_id] ^short = "NHSN Org ID"
  * system 1..
  * system = "https://www.cdc.gov/nhsn/OrgID"
  * value 1.. MS


// TODO - Review whether this requirement is still needed. The dQM IG does not require name
* name 1..
*/
