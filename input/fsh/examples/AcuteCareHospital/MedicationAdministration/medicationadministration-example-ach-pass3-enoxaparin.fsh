Instance: medicationadministration-example-ach-pass3-enoxaparin
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Example ACH Pass3 Enoxaparin"
Description: "MedicationAdministration - Example ACH Pass3 - Enoxaparin sodium, 0.4 ML, 100 MG/ML Prefilled Syringe"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888833"
* status = #not-done
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-enoxaparin)
* medicationReference.display = "0.4 ML enoxaparin sodium 100 MG/ML Prefilled Syringe"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ach-ach-pass3-acute)
* context.display = "Critical care visit"
* effectiveDateTime = "2024-02-02T21:04:00-05:00"
* request = Reference(medicationrequest-example-ach-pass3-enoxaparin)
//* recorder.display = "Patient Identified"
* dosage.text = "0.4ml subcutaneous once daily in abdomen"
* dosage.site = $sct#42972002 "Subcutaneous tissue structure of anterior abdominal wall (body structure)"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 4000 'uL' "uL"