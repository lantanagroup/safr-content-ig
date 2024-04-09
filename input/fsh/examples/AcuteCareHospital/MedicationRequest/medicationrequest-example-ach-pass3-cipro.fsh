Instance: medicationrequest-example-ach-pass3-cipro
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Usage: #inline
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888892"
* status = #active
* intent = #plan
* reportedBoolean = true
* category = $medicationrequest-category#community "Community"
* category.text = "Home Medication"
* medicationReference = Reference(medication-example-cipro-500)
* medicationReference.display = "Ciprofloxacin 500 MG"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-short-stay)
* encounter.display = "Short Stay"
* authoredOn = "2024-02-01T19:15:00-05:00"
* requester = Reference(patient-example-ach-ach-pass3)
* recorder.display = "Patient Identified"
* dosageInstruction.text = "500mg tablet by mouth twice daily"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 500 'mg' "mg"