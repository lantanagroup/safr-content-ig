Instance: medicationrequest-example-hypo-hypo2
InstanceOf: HypoglycemicReportMedicationRequest
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101889053"
* status = #completed
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNlA99h1sjXKwuhGs.PNpjjUi.Dh2-U-oGW0c9xZjPn2b29S.YZMgFiH.76i57tFS1PARcjzOMkC6TPHQQXiH6vA3"
* medicationReference.reference = "Medication/medication-example-hypo-hypo1"
* medicationReference.display = "Insulin glargine (LANTUS) 100 unit/mL injection"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* authoredOn = "2022-08-17T16:32:05Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#continuous "Continuous long term therapy"
* courseOfTherapyType.text = "Continuous long term therapy"
* dosageInstruction.text = "18 units, Subcutaneous, ONCE, 1 dose\n**High Alert**\nOn Wed 8/17/22 at 1315"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2022-08-17T16:33:00Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2022-08-17T16:33:00Z"
* dosageInstruction.timing.repeat.count = 1
* dosageInstruction.timing.code.text = "Once"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#34206005 "Subcutaneous route"
* dosageInstruction.route.text = "Subcutaneous"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseQuantity = 18 'U' "units"
* dosageInstruction.doseAndRate[+].type.text = "Administered Amount"
* dosageInstruction.doseAndRate[=].doseQuantity = 0.18 'mL' "mL"
* dosageInstruction.doseAndRate[+].type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate[=].type.text = "ordered"
* dosageInstruction.doseAndRate[=].doseQuantity = 18 'U' "units"