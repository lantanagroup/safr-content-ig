Instance: medadmin-example-ltc-monthly-pneumonia-amoxicillin
InstanceOf: LongTermCareMonthlyEventMedicationAdministration
Title: "MedicationAdministration - Example LTC Monthly Pneumonia - Amoxicillin 1000 MG"
Description: "MedicationAdministration - Example LTC Monthly Pneumonia - Amoxicillin 1000 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888893"
* status = #completed
* category = $medicationrequest-category#outpatient "Outpatient"
* category.text = "Outpatient"
* medicationReference = Reference(medication-example-amoxicillin-1000)
* medicationReference.display = "Amoxicillin 1000 MG"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"
* context = Reference(encounter-example-ltc-monthly-pneumonia-2)
* context.display = "Emergency Encounter"
* effectiveDateTime = "2024-01-31T04:54:00-05:00"
* request = Reference(medicationrequest-example-ltc-monthly-pneumonia-amoxicillin)
//* recorder.display = "Patient Identified"
* dosage.text = "1000 MG Oral once before dental procedure"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 1 'g' "g"
