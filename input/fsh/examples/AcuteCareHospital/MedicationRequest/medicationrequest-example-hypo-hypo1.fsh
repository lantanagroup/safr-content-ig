Instance: medicationrequest-example-hypo-hypo1
InstanceOf: AcuteCareHospitalReportingMedicationRequest
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101903002"
* status = #stopped
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eDqE6JdEkh8mZo4TPwrQ9EeahisqKXGVniOD2rN80PE2EUeGATq60KM.KVXjzcHYMVMeCDuUpqdqoATqaUjUNVXwPRyqWkRVYyVVq2UgaecU3"
* medicationReference.reference = "Medication/medication-example-hypo-hypo2"
* medicationReference.display = "insulin lispro (HumaLOG) correction scale injection"
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
* dosageInstruction.text = "1-12 units, Subcutaneous, 4 TIMES DAILY BEFORE MEALS & AT BEDTIME, First dose on Wed 8/17/22 at 1345, Until Discontinued"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2022-08-17T17:45:00Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2022-08-22T20:10:09Z"
* dosageInstruction.timing.repeat.frequency = 4
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "4x Daily AC & HS"
* dosageInstruction.asNeededBoolean = false
* dosageInstruction.route = $sct#34206005 "Subcutaneous route"
* dosageInstruction.route.text = "Subcutaneous"
* dosageInstruction.doseAndRate[0].type = $dose-rate-type#calculated "Calculated"
* dosageInstruction.doseAndRate[=].type.text = "calculated"
* dosageInstruction.doseAndRate[=].doseRange.low = 1 'U' "units"
* dosageInstruction.doseAndRate[=].doseRange.high = 12 'U' "units"
* dosageInstruction.doseAndRate[+].type.text = "Administered Amount"
* dosageInstruction.doseAndRate[=].doseRange.low = 0.01 'mL' "mL"
* dosageInstruction.doseAndRate[=].doseRange.high = 0.12 'mL' "mL"
* dosageInstruction.doseAndRate[+].type = $dose-rate-type#ordered "Ordered"
* dosageInstruction.doseAndRate[=].type.text = "ordered"
* dosageInstruction.doseAndRate[=].doseRange.low = 1 'U' "units"
* dosageInstruction.doseAndRate[=].doseRange.high = 12 'U' "units"