Instance: medicationrequest-example-ltc-monthly-uti-ceftriaxone
InstanceOf: LongTermCareMonthlyEventMedicationRequest
Title: "MedicationRequest - Example LTC Monthly UTI - ceftriaxone 1 G Prefilled Syringe"
Description: "MedicationRequest - Example LTC Monthly UTI - ceftriaxone 1 G Prefilled Syringe"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888895"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* priority = $request-priority#stat "STAT"
* medicationReference = Reference(medication-example-ceftriaxone-1000)
* medicationReference.display = "ceftriaxone 1 G Prefilled Syringe"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* encounter = Reference(encounter-example-ltc-monthly-uti)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-01T12:00:00-05:00"
* requester = Reference(patient-example-ltc-monthly-uti)
//* recorder.display = "Patient Identified"
* dosageInstruction[+].text = "ceftriaxone 1 G IV"
* dosageInstruction[=].site = $sct#368208006 "Left arm"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].asNeededBoolean = false
* dosageInstruction[=].route = $sct#47625008 "Intravenous route"
* dosageInstruction[=].route.text = "IV"
//* dosageInstruction[=].doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
//* dosageInstruction[=].doseAndRate[=].type.text = "calculated"
* dosageInstruction[=].doseAndRate[+].doseQuantity = 1 'G' "G"

