Instance: observation-example-ach-daily-initialpopulationpass-isolation
InstanceOf: AcuteCareHospitalDailyEventObservation
Title: "Observation - Example ACH Daily Initial Population Pass Isolation"
Description: "Observation - Example ACH Daily Initial Population Pass - Lab: Isolation"
Usage: #example
//https://build.fhir.org/ig/HL7/fhir-qi-core/Observation-example-gestation.json.html
* status = #final
//* category[+] = $observation-category#laboratory "Laboratory"
* category[+] = $observation-category#exam "exam"
* category[=].text = "Exam"
* code = $sct#422650009 "Respiratory isolation"
* code.text = "Respiratory isolation"
* subject = Reference(patient-example-ach-daily-initialpopulationpass)
* subject.display = "ACHDaily InitialPopulationPass"
* encounter = Reference(encounter-example-ach-daily-initialpopulationpass-1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T16:02:00-05:00"
* issued = "2024-02-01T16:02:00-05:00"
* valueBoolean = true