Instance: medicationrequest-example-ltc-monthly-pneumonia-levofloxacin
InstanceOf: LongTermCareMonthlyEventMedicationRequest
Title: "MedicationRequest - Example LTC Monthly - Levofloxacin 500 MG"
Description: "MedicationRequest - Example LTC Monthly - Levofloxacin 500 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888811"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference = Reference(medication-example-levofloxacin-500)
* medicationReference.display = "Levofloxacin 500 MG"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"
* encounter = Reference(encounter-example-ltc-monthly-pneumonia-1)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-02T13:43:00-05:00"
* requester = Reference(patient-example-ltc-monthly-pneumonia)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "500mg by mouth once a day for 7 days"
//* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#26643006 "Oral route"
* dosageInstruction.doseAndRate[0].doseQuantity.value = 500
* dosageInstruction.doseAndRate[0].doseQuantity.unit = "MG"
* dosageInstruction.doseAndRate[0].doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.asNeededBoolean = false