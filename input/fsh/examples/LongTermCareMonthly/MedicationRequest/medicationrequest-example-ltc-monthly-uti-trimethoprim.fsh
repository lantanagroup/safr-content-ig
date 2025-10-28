Instance: medicationrequest-example-ltc-monthly-uti-trimethoprim
InstanceOf: LongTermCareMonthlyEventMedicationRequest
Title: "MedicationRequest - Example LTC Monthly UTI - Trimethoprim 160 MG / Sulfamethoxazole 800 MG oral tablet"
Description: "MedicationRequest - Example LTC Monthly UTI - Trimethoprim 160 MG / Sulfamethoxazole 800 MG oral tablet"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888894"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-trimethoprim)
* medicationReference.display = "Sulfamethoxazole 800 MG / Trimethoprim 160 MG Oral Tablet"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* encounter = Reference(encounter-example-ltc-monthly-uti)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-01T12:00:00-05:00"
* requester = Reference(patient-example-ltc-monthly-uti)
//* recorder.display = "Patient Identified"
* dosageInstruction[+].text = "Sulfamethoxazole 800 mg by mouth twice daily for 3 days"
* dosageInstruction[=].timing.repeat.frequency = 2
* dosageInstruction[=].timing.repeat.period = 3
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].asNeededBoolean = false
* dosageInstruction[=].route = $sct#26643006 "Oral route"
* dosageInstruction[=].route.text = "Oral"
//* dosageInstruction[=].doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
//* dosageInstruction[=].doseAndRate[=].type.text = "calculated"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 160
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "MG"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 800
* dosageInstruction[=].doseAndRate[=].doseQuantity.unit = "MG"

