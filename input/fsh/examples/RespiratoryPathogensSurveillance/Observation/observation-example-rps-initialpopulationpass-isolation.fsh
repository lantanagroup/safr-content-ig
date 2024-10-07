Instance: observation-example-rps-initialpopulationpass-isolation
InstanceOf: RespiratoryPathogensSurveillanceEventObservation
Title: "Observation - Example RPS Initial Population Pass Gestational Age"
Description: "Observation - Example RPS Initial Population Pass - Lab: Gestational age at birth"
Usage: #example
//https://build.fhir.org/ig/HL7/fhir-qi-core/Observation-example-gestation.json.html
* status = #final
//* category[+] = $observation-category#laboratory "Laboratory"
* category[+] = $observation-category#exam "exam"
* category[=].text = "Exam"
* code = $sct#422650009 "Social isolation"
* code.text = "Social isolation"
* subject = Reference(patient-example-rps-initialpopulationpass)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-rps-initialpopulationpass-1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T16:02:00-05:00"
* issued = "2024-02-01T16:02:00-05:00"
* valueBoolean = true