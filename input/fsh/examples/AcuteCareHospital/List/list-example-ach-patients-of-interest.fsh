Instance: list-example-ach-patients-of-interest
InstanceOf: PatientsOfInterestList
Title: "List - Example ACH Patients Of Interest"
Description: "List - Example ACH Patients Of Interest"
Usage: #example
* extension[0].url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-patient-list-applicable-period-extension"
* extension[=].valuePeriod.start = "2021-07-28T00:00:00Z"
* extension[=].valuePeriod.end = "2021-08-28T00:00:00Z"

* identifier.system = "https://nhsnlink.org"
* identifier.value = "NHSNdQMAcuteCareHospitalInitialPopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
* entry[0].item = Reference(patient-example-sameresultdiffday)
* entry[+].item = Reference(patient-example-ach-ach-pass1)
* entry[+].item = Reference(patient-example-ach-ach-pass2)
* entry[+].item = Reference(patient-example-ach-ach-pass3)