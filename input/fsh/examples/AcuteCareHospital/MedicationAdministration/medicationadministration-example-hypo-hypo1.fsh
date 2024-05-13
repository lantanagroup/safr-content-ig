Instance: medicationadministration-example-hypo-hypo1
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Hypo Medication Administration Example Hypo 1"
Description: "MedicationAdministration - Example Hypo Medication Administration Hypo 1"
Usage: #example
* status = #completed
* medicationReference.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* medicationReference.extension.valueString = "Medication/eZeW55xkBH0DrR0Xj004fNid0iluLJl6nT2adScy2TI9SbXSOBJPdED7Qjms.Fj48j0.MQxtisgjhubwnqaIImzMAo7axKzx4khlfA7xEkUU3"
* medicationReference.reference = "Medication/medication-example-hypo-hypo3"
* medicationReference.display = "Insulin glargine (LANTUS) 100 unit/mL injection"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* effectivePeriod.start = "2022-08-18T13:00:00Z"
* effectivePeriod.end = "2022-08-22T20:10:09Z"
* performer.actor.display = "Patrick Pump"
* request.reference = "MedicationRequest/medicationrequest-example-hypo-hypo3"
* dosage.text = "18 Units SC before breakfast"
* dosage.route = $sct#263887005 "Subcutaneous (qualifier value)"
* dosage.dose = 18 'U' "U"