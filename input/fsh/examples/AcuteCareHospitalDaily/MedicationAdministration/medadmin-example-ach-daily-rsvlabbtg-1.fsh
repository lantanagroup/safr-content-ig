Instance: medadmin-example-ach-daily-rsvlabbtg-1
InstanceOf: AcuteCareHospitalDailyEventMedicationAdministration
Title: "Medication Administration - ACH Daily Medication Administration Example RSV Lab BTG 1"
Description: "Medication Administration - Example ACH Daily Medication Administration RSV Lab BTG 1"
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-ach-daily-rsvlabbtg-1"
* medicationReference.display = "Ribavirin inhalation solution 6g/vial via nebulizer"
* subject.reference = "Patient/patient-example-ach-daily-rsvlabbtg"
* subject.display = "ACHDaily, RSVLabBTG"
* effectivePeriod.start = "2024-01-01T12:30:00Z"
* effectivePeriod.end = "2024-01-01T17:30:09Z"
* request.reference = "MedicationRequest/medicationrequest-example-ach-daily-rsvlabbtg-1"
* dosage.text = "Ribavirin inhalation solution 6g/vial via nebulizer every hour x 6"
* dosage.route = $sct#26643006 "Oral route"
* dosage.dose = 6 'g' "g"