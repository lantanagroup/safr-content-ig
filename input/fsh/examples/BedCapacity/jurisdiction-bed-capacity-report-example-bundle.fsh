Alias: $bed-capacity-code-system = http://hl7.org/fhir/us/nhsn-dqm/CodeSystem/healthcare-capacity-codes

Instance: jurisdiction-bed-capacity-report-example
InstanceOf: Bundle
Title: "Jurisdiction Capacity Full Report Bundle Example"
Description: "Example Bundle of jurisidictional report for capacity reporting"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e1"
* type = #collection
* timestamp = "2023-08-28T07:01:07.563Z"
* entry[0].fullUrl = "http://example.com/fhir/MeasureReport/bed-capacity-measurereport-example-hosp"
* entry[=].resource = bed-capacity-measurereport-example-hosp
* entry[+].fullUrl = "http://example.com/fhir/MeasureReport/bed-capacity-measurereport-example-ipf"
* entry[=].resource = bed-capacity-measurereport-example-ipf
* entry[+].fullUrl = "http://example.com/fhir/MeasureReport/bed-capacity-measurereport-example-chld"
* entry[=].resource = bed-capacity-measurereport-example-chld
