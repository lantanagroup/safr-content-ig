Instance: medicationrequest-example-ach-pass3-metronidazole
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Title: "MedicationRequest - Example ACH Pass3 Metronidazole"
Description: "MedicationRequest - Example ACH Pass3 - Metronidazole 500 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888832"
* status = #active
* intent = #order
* reportedBoolean = false
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-metronidazole)
* medicationReference.display = "Metronidazole 500 MG"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-short-stay)
* encounter.display = "Short Stay"
* authoredOn = "2024-02-01T20:33:00-05:00"
* requester = Reference(patient-example-ach-ach-pass3)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "5mg tablet by mouth twice daily"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 5 'mg' "mg"