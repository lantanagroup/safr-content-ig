Instance: medicationrequest-example-ach-daily-negativepcr
InstanceOf: AcuteCareHospitalDailyEventMedicationRequest
Title: "Medication Request - ACH Daily Medication Request Example Negative PCR"
Description: "Medication Request - Example ACH Daily Medication Request Negative PCR"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903002"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.reference = "Medication/medication-example-ach-daily-negativepcr"
* medicationReference.display = "Molnupiravir 200 mg"
* subject.reference = "Patient/patient-example-ach-daily-negativepcr"
* subject.display = "ACHDaily, NegativePCR"
* encounter.reference = "Encounter/encounter-example-ach-daily-negativepcr-1"
* encounter.display = "Hospital Encounter"
* authoredOn = "2024-01-02T21:30:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#acute "Short course (acute) therapy"
* courseOfTherapyType.text = "Short course (acute) therapy"
* dosageInstruction.text = "Molnupiravir 200 mg: Take 4 capsules by mouth twice a day x 5 days"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2024-01-02T21:30:15Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2024-01-06T21:30:15Z"
* dosageInstruction.timing.repeat.frequency = 4
* dosageInstruction.timing.repeat.period = 5
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "Take 4 Molnupiravir 200 mg capsules by mouth twice a day x 5 days"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral use"
* dosageInstruction.route.text = "Oral use"