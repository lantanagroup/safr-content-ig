Instance: medicationrequest-example-hypo-sameresultdiffday2
InstanceOf: HypoglycemicReportMedicationRequest
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888895"
* status = #stopped
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eY82JB.8ppTTV5RktPwJbpUHKAGfJmD2YuyeQZY4c6pgp3uu5d4Ip9Kje-bi3zAF2Kd.pcEag3zNHvMZ3ZAowUNmGzpyyXXZ0tImXpg90ojw3"
* medicationReference.reference = "Medication/medication-example-hypo-sameresultdiffday2"
* medicationReference.display = "glyBURIDE (DIABETA) tablet"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.reference = "Encounter/encounter-example-hypo-sameresultdiffday"
* encounter.display = "Hospital Encounter"
* authoredOn = "2022-08-17T16:15:04Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#continuous "Continuous long term therapy"
* courseOfTherapyType.text = "Continuous long term therapy"
* dosageInstruction.text = "2.5 mg, Oral, EVERY MORNING\nGive 30 minutes before meal.\nFirst dose on Thu 8/18/22 at 0900, Until Discontinued"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2022-08-18T13:00:00Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2022-08-22T20:03:08Z"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "QAM"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#26643006 "Oral Use"
* dosageInstruction.route.text = "Oral"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 2.5 'mg' "mg"
* dosageInstruction.doseAndRate[+].type.text = "Administered Amount"
* dosageInstruction.doseAndRate[=].doseQuantity.value = 1
* dosageInstruction.doseAndRate[=].doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate[=].doseQuantity.unit = "tablet"
* dosageInstruction.doseAndRate[+].type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate[=].type.text = "ordered"
* dosageInstruction.doseAndRate[=].doseQuantity = 2.5 'mg' "mg"
* priorPrescription.display = "glyBURIDE 2.5 mg tablet"