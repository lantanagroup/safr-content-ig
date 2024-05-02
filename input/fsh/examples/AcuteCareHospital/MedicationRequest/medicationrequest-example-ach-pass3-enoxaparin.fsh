Instance: medicationrequest-example-ach-pass3-enoxaparin
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888833"
* status = #active
* intent = #order
* reportedBoolean = false
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-enoxaparin)
* medicationReference.display = "0.4 ML enoxaparin sodium 100 MG/ML Prefilled Syringe"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-acute)
* encounter.display = "Critical care visit"
* authoredOn = "2024-02-02T12:21:00-05:00"
* requester = Reference(patient-example-ach-ach-pass3)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "0.4ml subcutaneous once daily in abdomen"
* dosageInstruction[=].site = $sct#42972002 "Subcutaneous tissue structure of anterior abdominal wall (body structure)"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 4000 'uL' "uL"
