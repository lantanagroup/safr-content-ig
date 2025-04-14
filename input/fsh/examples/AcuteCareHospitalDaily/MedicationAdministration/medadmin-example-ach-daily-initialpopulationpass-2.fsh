Instance: medadmin-example-ach-daily-initialpopulationpass-2
InstanceOf: AcuteCareHospitalDailyEventMedicationAdministration
Title: "Medication Administration - ACH Daily Medication Administration Example Initial Population Pass 2"
Description: "Medication Administration - Example ACH Daily Medication Administration Initial Population Pass 2"
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-ach-daily-initialpopulationpass"
* medicationReference.display = "Remdesivir 100 mg IV"
* subject.reference = "Patient/patient-example-ach-daily-initialpopulationpass"
* subject.display = "ACHDaily, InitialPopulationPass"
* effectivePeriod.start = "2024-01-02T22:00:00Z"
* effectivePeriod.end = "2024-01-05T22:00:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-ach-daily-initialpopulationpass"
* dosage.text = "Remdesivir 200 mg IV once a day on day 1, then 100 mg IV once a day on days 2-5"
* dosage.route = $sct#47625008 "Intravenous use"
* dosage.dose = 100 'mg' "mg"