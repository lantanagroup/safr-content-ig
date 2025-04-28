Instance: medadmin-example-ach-daily-negativepcr
InstanceOf: AcuteCareHospitalDailyEventMedicationAdministration
Title: "Medication Administration - ACH Daily Medication Administration Example Negative PCR"
Description: "Medication Administration - Example ACH Daily Medication Administration Negative PCR"
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-ach-daily-negativepcr"
* medicationReference.display = "Molnupiravir 200 mg PO BID"
* subject.reference = "Patient/patient-example-ach-daily-negativepcr"
* subject.display = "ACHDaily, NegativePCR"
* effectivePeriod.start = "2024-01-02T09:00:00Z"
* effectivePeriod.end = "2024-01-06T08:59:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-ach-daily-negativepcr"
* dosage.text = "Take Molnupiravir 200 mg 4 capsules by mouth twice a day x 5 days"
* dosage.route = $sct#385049006 "Capsule"
* dosage.dose = 200 'mg' "mg"