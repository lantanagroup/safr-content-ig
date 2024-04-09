Instance: medicationadministration-example-rps-negativepcr
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-rps-negativepcr"
* medicationReference.display = "Molnupiravir 200 mg PO BID"
* subject.reference = "Patient/patient-example-rps-negativepcr"
* subject.display = "RPS, NegativePCR"
* effectivePeriod.start = "2024-01-02T09:00:00Z"
* effectivePeriod.end = "2022-01-06T08:59:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-rps-negativepcr"
* dosage.text = "Take Molnupiravir 200 mg 4 capsules by mouth twice a day x 5 days"
* dosage.route = $sct#385049006 "Capsule"
* dosage.dose = 200 'mg' "mg"