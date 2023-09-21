Instance: list-example-individual-measurereport-list
InstanceOf: IndividualMeasureReportList
Usage: #example
* meta.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-received-date-extension"
* meta.extension.valueDateTime = "2023-05-23T06:07:08Z"
* status = #current
* mode = #snapshot
* entry[0].item.reference = "MeasureReport/measurereport-example-individual-measurereport-sameresultdiffday"
* entry[+].item.reference = "MeasureReport/measurereport-example-individual-measurereport-hypo"