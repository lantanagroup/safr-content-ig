Instance: list-example-rps-patients-of-interest
InstanceOf: PatientsOfInterestList
Title: "List - Example RPS Patients Of Interest"
Description: "List - Example RPS Patients Of Interest"
Usage: #example
* identifier.system = "https://nhsnlink.org"
* identifier.value = "NHSNdQMAcuteCareHospitalInitialPopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
* entry[0].item = Reference(patient-example-rps-initialpopulationpass)
* entry[+].item = Reference(patient-example-rps-negativepcr)
* entry[+].item = Reference(patient-example-rps-influenzatherapeutic)
* entry[+].item = Reference(patient-example-rps-rsvlabbtg)