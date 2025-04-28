Instance: list-example-ach-daily-patients-of-interest
InstanceOf: PatientsOfInterestList
Title: "List - Example ACH Daily Patients Of Interest"
Description: "List - Example ACH Daily Patients Of Interest"
Usage: #example
* identifier.system = "https://nhsnlink.org"
* identifier.value = "NHSNdQMAcuteCareHospitalInitialPopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
* entry[0].item = Reference(patient-example-ach-daily-initialpopulationpass)
* entry[+].item = Reference(patient-example-ach-daily-negativepcr)
* entry[+].item = Reference(patient-example-ach-daily-influenzatherapeutic)
* entry[+].item = Reference(patient-example-ach-daily-rsvlabbtg)