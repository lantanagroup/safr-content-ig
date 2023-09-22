Instance: list-example-patients-of-interest
InstanceOf: PatientsOfInterestList
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-patient-list-applicable-period-extension"
* extension.valuePeriod.start = "2022-08-01T00:00:00.000Z"
* extension.valuePeriod.end = "2022-08-31T23:59:59.000Z"
* identifier.system = "https://nhsnlink.org"
* identifier.value = "nhsnglycemiccontrolhypoglycemicinitialpopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
* entry[0].item.reference = "Patient/patient-example-sameresultdiffday"
* entry[+].item.reference = "Patient/patient-example-hypo"