Instance: medicationrequest-example-hypo-hypo3
InstanceOf: AcuteCareHospitalMonthlyReportingMedicationRequest
Title: "MedicationRequest - Hypo MedicationRequest Example Hypo 3"
Description: "MedicationRequest - Example Hypo MedicationRequest Hypo 3"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-medicationrequest"
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101902997"
* status = #stopped
* intent = #order
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-hypo-hypo3"
* medicationReference.display = "Insulin glargine (LANTUS) 100 unit/mL injection"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* authoredOn = "2022-08-17T17:06:15Z"
* requester.type = "Practitioner"
* requester.display = "Faculty Physician Um_Cln, MD"
* recorder.type = "Practitioner"
* recorder.display = "Faculty Physician Um_Cln, MD"
* courseOfTherapyType = $medicationrequest-course-of-therapy#continuous "Continuous long term therapy"
* courseOfTherapyType.text = "Continuous long term therapy"
* dosageInstruction.text = "18 units (rounded from 18.2 units = 0.2 units/kg  per DOSE × 91 kg Order-specific weight), Subcutaneous, EVERY MORNING\n**High Alert**\nFirst dose on Thu 8/18/22 at 0900, Until Discontinued"
* dosageInstruction.timing.repeat.boundsPeriod.start = "2022-08-18T13:00:00Z"
* dosageInstruction.timing.repeat.boundsPeriod.end = "2022-08-22T20:10:09Z"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.code.text = "QAM"
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
* dosageInstruction.doseAndRate[=].doseQuantity = 0.2 'U/kg' "units/kg  per DOSE"
* priorPrescription.display = "insulin glargine (LANTUS SOLOSTAR) 100 unit/mL injection pen"