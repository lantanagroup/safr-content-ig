Instance: medadmin-example-ltc-monthly-pneumonia-levofloxacin
InstanceOf: LongTermCareMonthlyEventMedicationAdministration
Title: "MedicationAdministration - Example LTC Monthly - Levofloxacin 500 MG"
Description: "MedicationAdministration - Example LTC Monthly - Levofloxacin 500 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888111"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference = Reference(medication-example-levofloxacin-500)
* medicationReference.display = "Levofloxacin 500 MG"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"
* context = Reference(encounter-example-ltc-monthly-pneumonia-1)
* context.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T14:34:00-05:00"
* request = Reference(medicationrequest-example-ltc-monthly-pneumonia-levofloxacin)
* dosage.text = "500 MG Oral Tablet once daily"
* dosage.route = $sct#26643006 "Oral route"
* dosage.dose = 500 'MG' "MG"