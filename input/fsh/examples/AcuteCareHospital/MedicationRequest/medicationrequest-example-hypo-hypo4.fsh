Instance: medicationrequest-example-hypo-hypo4
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903000"
* status = #stopped
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/e11kF5DQLQwz8WrCTi-fTXUBZW8CRdsY0CXeVGHY.RA8LNuzDmn9GrZmbcWKSA1xb2ES.RitNJ5o-LqrwbAoS-zJZ9Wp8oS-UB1RNw-eZ22o3"
* medicationReference.reference = "Medication/medication-example-hypo-hypo4"
* medicationReference.display = "dextrose 50% in water injection syringe"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* authoredOn = "2022-08-17T17:06:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#acute "Short course (acute) therapy"
* courseOfTherapyType.text = "Short course (acute) therapy"
* dosageInstruction.text = "25 mL, Intravenous, PRN, other, blood glucose < 70 mg/dL\nFor patients unresponsive and/or unable to eat (per protocol)\nStarting on Wed 8/17/22 at 1305, Until Mon 8/22/22 at 1610"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2022-08-17T17:05:00Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2022-08-22T20:10:09Z"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "PRN"
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.route = $sct#47625008 "Intravenous use"
* dosageInstruction.route.text = "Intravenous"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 25 'mL' "mL"
* dosageInstruction.doseAndRate[+].type.text = "Administered Amount"
* dosageInstruction.doseAndRate[=].doseQuantity = 25 'mL' "mL"
* dosageInstruction.doseAndRate[+].type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate[=].type.text = "ordered"
* dosageInstruction.doseAndRate[=].doseQuantity = 25 'mL' "mL"