Instance: list-example-patients-of-interest
InstanceOf: PatientsOfInterestList
Title: "List - Example Patients of Interest List 1"
Description: "List - Patients of Interest Example 1"
Usage: #example
* identifier.system = "https://nhsnlink.org"
* identifier.value = "NHSNdQMAcuteCareHospitalInitialPopulation"
* status = #current
* mode = #changes
* date = "2021-07-28T00:00:00Z"
* entry[0].item = Reference(patient-example-sameresultdiffday)