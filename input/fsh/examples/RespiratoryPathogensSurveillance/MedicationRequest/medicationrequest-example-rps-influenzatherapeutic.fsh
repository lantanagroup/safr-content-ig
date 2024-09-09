Instance: medicationrequest-example-rps-influenzatherapeutic
InstanceOf: RespiratoryPathogensSurveillanceEventMedicationRequest
Title: "Medication Request - RPS Medication Request Example Influenza Therapeutic"
Description: "Medication Request - Example RPS Medication Request Influenza Therapeutic"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903002"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference = Reference(medication-example-rps-influenzatherapeutic)
* medicationReference.display = "Oseltamivir 60 mg"
* subject = Reference(patient-example-rps-influenzatherapeutic)
* subject.display = "RPS, InfluenzaTherapeutic"
* encounter = Reference(encounter-example-rps-influenzatherapeutic)
* encounter.display = "Hospital Encounter"
* authoredOn = "2024-01-01T11:45:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#acute "Short course (acute) therapy"
* courseOfTherapyType.text = "Short course (acute) therapy"
* dosageInstruction.text = "Oseltamivir 60 mg PO twice daily x 5 days"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2024-01-01T12:30:15Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2024-01-06T12:30:15Z"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 5
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "Oseltamivir 60 mg PO twice daily x 5 days"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral use"
* dosageInstruction.route.text = "Oral use"