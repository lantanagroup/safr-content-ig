Instance: measurereport-example-ach-daily-subjectlist
InstanceOf: SubjectListMeasureReportProfile
Title: "MeasureReport - Example ACH Daily Subject List"
Description: "Measure Report - Example ACH Daily Subject List Example"
Usage: #example
* meta.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-received-date-extension"
* meta.extension.valueDateTime = "2023-05-23T06:07:08Z"

* contained = list-example-ach-daily-individual-measurereport-list
* status = #complete
* type = #subject-list
* measure = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0-cibuild"
* period.start = "2022-08-01T00:00:00+00:00"
* period.end = "2022-08-31T23:59:59+00:00"
* group.population.code = $measure-population#initial-population "Initial Population"
* group.population.count = 4
* group.population.subjectResults = Reference(list-example-ach-daily-individual-measurereport-list)


Instance: list-example-ach-daily-individual-measurereport-list
InstanceOf: IndividualMeasureReportList
Title: "List - Example ACH Daily Individual Measure Report List"
Description: "List - Example ACH Daily Individual Measure Report List Example"
Usage: #example
* status = #current
* mode = #snapshot
* entry[+].item = Reference(measurereport-example-rps-initialpopulationpass)
* entry[+].item = Reference(measurereport-example-rps-negativepcr)
* entry[+].item = Reference(measurereport-example-rps-influenzatherapeutic)
* entry[+].item = Reference(measurereport-example-rps-rsvlabbtg)
/* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-initialpopulationpass"
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-negativepcr"
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-influenzatherapeutic"
* entry[+].item
  * identifier.system = "http://example.org/fhir/measurereport/id"
  * identifier.value = "123456789-rsvlabbtg"
*/
  