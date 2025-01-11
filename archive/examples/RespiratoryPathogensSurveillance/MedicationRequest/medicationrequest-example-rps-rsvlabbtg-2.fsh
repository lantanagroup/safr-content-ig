Instance: medicationrequest-example-rps-rsvlabbtg-2
InstanceOf: RespiratoryPathogensSurveillanceEventMedicationRequest
Title: "Medication Request - RPS Medication Request Example RSV Lab BTG 2"
Description: "Medication Request - Example RPS Medication Request RSV Lab BTG 2"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903002"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.reference = "Medication/medication-example-rps-rsvlabbtg-2"
* medicationReference.display = "Nasal Saline spray"
* subject.reference = "Patient/patient-example-rps-rsvlabbtg"
* subject.display = "RPS, RSVLabBTG"
* encounter.reference = "Encounter/encounter-example-rps-rsvlabbtg"
* encounter.display = "Hospital Encounter"
* authoredOn = "2024-01-01T11:45:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#acute "Short course (acute) therapy"
* courseOfTherapyType.text = "Short course (acute) therapy"
* dosageInstruction.text = "Nasal Saline spray, one spray each nostril QID"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2024-01-01T12:00:15Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2024-01-02T07:00:15Z"
* dosageInstruction.timing.code.text = "Nasal Saline spray, one spray each nostril QID"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#46713006 "Nasal use"
* dosageInstruction.route.text = "Nasal use"