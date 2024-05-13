Instance: medicationrequest-example-ach-pass2-insulin-lispro
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Title: "MedicationRequest - Example ACH Pass2 Insulin Lispro"
Description: "MedicationRequest - Example ACH Pass2 - Insulin Lispro"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888894"
* status = #completed
* intent = #order
* reportedBoolean = false
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-insulin-lispro)
* medicationReference.display = "Insulin Lispro"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-01T12:00:00-05:00"
* requester = Reference(patient-example-ach-ach-pass2)
//* recorder.display = "Patient Identified"
* dosageInstruction[+].text = "Give 5 units before breakfast"
* dosageInstruction[=].site = $sct#1255295007 "Structure of blood vessel of left upper arm (body structure)"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].timing.code = http://terminology.hl7.org/CodeSystem/v3-GTSAbbreviation#"AM"
* dosageInstruction[=].asNeededBoolean = false
* dosageInstruction[=].route = $sct#47625008 "Intravenous route"
* dosageInstruction[=].route.text = "IV"
//* dosageInstruction[=].doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
//* dosageInstruction[=].doseAndRate[=].type.text = "calculated"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 5

* dosageInstruction[+].text = "Give 4 units before dinner"
* dosageInstruction[=].site = $sct#1255295007 "Structure of blood vessel of left upper arm (body structure)"
* dosageInstruction[=].timing.repeat.frequency = 1
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].timing.code = http://terminology.hl7.org/CodeSystem/v3-GTSAbbreviation#"BED"
* dosageInstruction[=].asNeededBoolean = false
* dosageInstruction[=].route = $sct#47625008 "Intravenous route"
* dosageInstruction[=].route.text = "IV"
//* dosageInstruction[=].doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
//* dosageInstruction[=].doseAndRate[=].type.text = "calculated"
* dosageInstruction[=].doseAndRate[+].doseQuantity.value = 4

