Instance: list-example-ach-monthly-patients-of-interest
InstanceOf: PatientsOfInterestList
Title: "List - Example ACH Monthly Patients Of Interest"
Description: "List - Example ACH Monthly Patients Of Interest"
Usage: #example
* extension[0].url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-patient-list-applicable-period-extension"
* extension[=].valuePeriod.start = "2021-07-28T00:00:00Z"
* extension[=].valuePeriod.end = "2021-08-28T00:00:00Z"

* identifier.system = "https://nhsnlink.org"
* identifier.value = "NHSNdQMAcuteCareHospitalMonthlyInitialPopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
//* entry[0].item = Reference(patient-example-sameresultdiffday)
* entry[+].item = Reference(patient-example-ach-monthly-pass1)
* entry[+].item = Reference(patient-example-ach-monthly-pass2)
* entry[+].item = Reference(patient-example-ach-monthly-pass3)