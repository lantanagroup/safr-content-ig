Instance: medicationrequest-example-ach-pass2-heparin
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Usage: #inline
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888895"
* status = #completed
* intent = #order
* reportedBoolean = false
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-heparin)
* medicationReference.display = "'0.5 ML heparin sodium, porcine 10000 UNT/ML Prefilled Syringe"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-01T12:00:00-05:00"
* requester = Reference(patient-example-ach-ach-pass2)
//* recorder.display = "Patient Identified"
* dosageInstruction[+].text = "0.5 mL"
* dosageInstruction[=].site = $sct#1255295007 "Structure of blood vessel of left upper arm (body structure)"
* dosageInstruction[=].timing.repeat.frequency = 2
* dosageInstruction[=].timing.repeat.period = 1
* dosageInstruction[=].timing.repeat.periodUnit = #d
* dosageInstruction[=].asNeededBoolean = false
* dosageInstruction[=].route = $sct#47625008 "Intravenous route"
* dosageInstruction[=].route.text = "IV"
//* dosageInstruction[=].doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
//* dosageInstruction[=].doseAndRate[=].type.text = "calculated"
* dosageInstruction[=].doseAndRate[+].doseQuantity = 5000 'uL' "uL"

