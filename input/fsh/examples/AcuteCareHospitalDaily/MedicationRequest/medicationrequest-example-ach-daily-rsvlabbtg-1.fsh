Instance: medicationrequest-example-ach-daily-rsvlabbtg-1
InstanceOf: AcuteCareHospitalDailyEventMedicationRequest
Title: "Medication Request - ACH Daily Medication Request Example RSV Lab BTG 1"
Description: "Medication Request - Example ACH Daily Medication Request RSV Lab BTG 1"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903002"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.reference = "Medication/medication-example-ach-daily-rsvlabbtg-1"
* medicationReference.display = "Ribavirin inhalation solution 6g/vial via nebulizer"
* subject.reference = "Patient/patient-example-ach-daily-rsvlabbtg"
* subject.display = "ACHDaily, RSVLabBTG"
* encounter.reference = "Encounter/encounter-example-ach-daily-rsvlabbtg"
* encounter.display = "Hospital Encounter"
* authoredOn = "2024-01-01T11:45:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#acute "Short course (acute) therapy"
* courseOfTherapyType.text = "Short course (acute) therapy"
* dosageInstruction.text = "Ribavirin inhalation solution 6g/vial via nebulizer every hour x 6"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2024-01-01T12:30:15Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2024-01-01T17:30:15Z"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 6
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.code.text = "Ribavirin inhalation solution 6g/vial via nebulizer every hour x 6"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral use"
* dosageInstruction.route.text = "Oral use"