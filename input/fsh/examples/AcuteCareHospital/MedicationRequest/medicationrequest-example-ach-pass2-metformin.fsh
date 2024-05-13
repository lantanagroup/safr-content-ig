Instance: medicationrequest-example-ach-pass2-metformin
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Title: "MedicationRequest - Example ACH Pass2 Metformin"
Description: "MedicationRequest - Example ACH Pass2 - Metformin hydrochloride 1000 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888892"
* status = #active
* intent = #plan
* reportedBoolean = true
* category = $medicationrequest-category#community "Community"
* category.text = "Home Medication"
* medicationReference = Reference(medication-example-metformin-1000)
* medicationReference.display = "Metformin hydrochloride 1000 MG"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-emergency)
* encounter.display = "Emergency Encounter"
* authoredOn = "2024-01-31T04:22:00-05:00"
* requester = Reference(patient-example-ach-ach-pass2)
* recorder.display = "Patient Identified"
* dosageInstruction.text = "1000 mg tablet by mouth twice daily"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 1000 'mg' "mg"