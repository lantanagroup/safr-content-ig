Instance: medicationrequest-example-ltc-monthly-pneumonia-amoxicillin
InstanceOf: LongTermCareMonthlyEventMedicationRequest
Title: "MedicationRequest - Example LTC Monthly Pneumonia - Amoxicillin 1000 MG"
Description: "MedicationRequest - Example LTC Monthly Pneumonia - Amoxicillin 1000 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888892"
* status = #active
* intent = #plan
* category = $medicationrequest-category#outpatient "Outpatient"
* category.text = "Outpatient"
* medicationReference = Reference(medication-example-amoxicillin-1000)
* medicationReference.display = "Amoxicillin 1000 MG"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"
* encounter = Reference(encounter-example-ltc-monthly-pneumonia-2)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-01-31T04:46:00-05:00"
* requester = Reference(patient-example-ltc-monthly-pneumonia)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "2gram PO 30-60 minutes before dental procedure"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 30
* dosageInstruction.timing.repeat.periodUnit = #min
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral route"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 2 'g' "g"