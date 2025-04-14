Instance: observation-example-ach-monthly-pass1-gestational-age
InstanceOf: AcuteCareHospitalMonthlyReportingObservation
Title: "Observation - Example ACH Monthly Pass1 Gestational Age"
Description: "Observation - Example ACH Monthly Pass1 - Lab: Gestational age at birth"
Usage: #example
//https://build.fhir.org/ig/HL7/fhir-qi-core/Observation-example-gestation.json.html
* status = #final
//* category[+] = $observation-category#laboratory "Laboratory"
* category[+] = $observation-category#exam "exam"
* category[=].text = "Exam"
* code = $loinc#76516-4 "Gestational age--at birth"
* code.text = "Gestational age at birth"
* subject = Reference(patient-example-ach-monthly-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T16:02:00-05:00"
* issued = "2024-02-01T16:02:00-05:00"
* valueQuantity = 164 'd' "day"