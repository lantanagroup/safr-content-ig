Instance: medicationadministration-example-rps-influenzatherapeudic
InstanceOf: RespiratoryPathogensSurveillanceEventMedicationAdministration
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-rps-influenzatherapeudic"
* medicationReference.display = "Oseltamivir 60 mg PO"
* subject.reference = "Patient/patient-example-rps-influenzatherapeudic"
* subject.display = "RPS, InfluenzaTherapeudic"
* effectivePeriod.start = "2024-01-01T20:00:00Z"
* effectivePeriod.end = "2022-01-04T20:00:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-rps-influenzatherapeudic"
* dosage.text = "Oseltamivir 60 mg PO twice daily x 5 days"
* dosage.route = $sct#385049006 "Capsule"
* dosage.dose = 60 'mg' "mg"