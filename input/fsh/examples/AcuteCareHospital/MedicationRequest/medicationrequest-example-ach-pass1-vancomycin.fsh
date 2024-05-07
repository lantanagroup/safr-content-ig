Instance: medicationrequest-example-ach-pass1-vancomycin
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Title: "MedicationRequest - Example ACH Pass1 Vancomycin"
Description: "MedicationRequest - Example ACH Pass1 - Vancomycin Injectable Solution 50MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888811"
* status = #completed
* intent = #order
* reportedBoolean = false
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference = Reference(medication-example-vancomycin-15)
* medicationReference.display = "vancomycin Injectable Solution 50MG"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-ach-pass1)
* encounter.display = "Hospital Admission"
* authoredOn = "2024-02-02T13:43:00-05:00"
* requester = Reference(patient-example-ach-ach-pass1)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "15mg/kg every 12 hours"
//* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#47625008 "Intravenous route"
* dosageInstruction.route.text = "IV"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 15 'mg/kg' "mg/kg"