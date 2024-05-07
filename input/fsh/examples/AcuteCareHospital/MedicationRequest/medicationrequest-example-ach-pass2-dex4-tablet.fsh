Instance: medicationrequest-example-ach-pass2-dex4-tablet
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Title: "MedicationRequest - Example ACH Pass2 Dex4 Tablet"
Description: "MedicationRequest - Example ACH Pass2 - Dex4 4 gm chewable tablet X1"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888892"
* status = #active
* intent = #plan
* reportedBoolean = true
* category = $medicationrequest-category#outpatient "Outpatient"
* category.text = "Outpatient"
* medicationReference = Reference(medication-example-dex4-tablet)
* medicationReference.display = "Dex4 4 gm chewable tablet X1"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-emergency)
* encounter.display = "Emergency Encounter"
* authoredOn = "2024-01-31T04:46:00-05:00"
* requester = Reference(patient-example-ach-ach-pass2)
//* recorder.display = "Patient Identified"
* dosageInstruction.text = "4 gm chewable tablet X1"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 4 'g' "g"