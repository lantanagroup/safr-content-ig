Instance: medicationadministration-example-rps-initialpopulationpass-1
InstanceOf: RespiratoryPathogensSurveillanceEventMedicationAdministration
Title: "Medication Administration - RPS Daily Medication Administration Example Initial Population Pass 1"
Description: "Medication Administration - RPS Daily Medication Administration Example Initial Population Pass 1"
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-rps-initialpopulationpass"
* medicationReference.display = "Remdesivir 200 mg IV"
* subject.reference = "Patient/patient-example-rps-initialpopulationpass"
* subject.display = "RPS, InitialPopulationPass"
* effectivePeriod.start = "2024-01-01T22:00:00Z"
* effectivePeriod.end = "2024-01-02T22:00:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-rps-initialpopulationpass"
* dosage.text = "Remdesivir 200 mg IV once a day on day 1, then 100 mg IV once a day on days 2-5"
* dosage.route = $sct#47625008 "Intravenous use"
* dosage.dose = 200 'mg' "mg"