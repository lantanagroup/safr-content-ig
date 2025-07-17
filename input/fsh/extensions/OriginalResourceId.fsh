Extension: OriginalResourceId
Id: link-original-resource-id-extension
Title: "Original Resource ID"
Description: "This extension stores the original {Resource}.id of a source that was modified by a processing system (e.g. NHSNLink) to make it usable for NHSN when the original did not meet FHIR-standard requirements. Resource IDs that are more than 64 characters long are not valid per the FHIR specification and must be modified."
* ^date = "2023-04-27T18:20:47-07:00"
* ^publisher = "HL7 Financial Management Working Group"
* ^contact.name = "HL7 Financial Management Working Group"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "http://www.hl7.org/Special/committees/fm"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "fm@lists.HL7.org"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^context[0].type = #element
* ^context[=].expression = "DomainResource"
* ^context[+].type = #element
* ^context[=].expression = "Reference"
* ^context[+].type = #fhirpath
* ^context[=].expression = "ofType(FHIR.Reference)"
* . ^short = "Original Resource Id"
  * ^definition = "This extension stores the original {Resource}.id of a source that was modified by a processing system (e.g. NHSNLink) to make it usable for NHSN when the original did not meet FHIR-standard requirements. Resource IDs that are more than 64 characters long are not valid per the FHIR specification and must be modified."
* value[x] 1..
* value[x] only string