Instance: medadmin-example-ltc-monthly-uti-trimethoprim
InstanceOf: LongTermCareMonthlyEventMedicationAdministration
Title: "MedicationAdministration - Example LTC Monthly UTI - Trimethoprim 160 MG / Sulfamethoxazole 800 MG"
Description: "MedicationAdministration - Example LTC Monthly UTI - Trimethoprim 160 MG / Sulfamethoxazole 800 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888942"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-trimethoprim)
* medicationReference.display = "Sulfamethoxazole 800 MG / Trimethoprim 160 MG Oral Tablet"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* context = Reference(encounter-example-ltc-monthly-uti)
* context.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T12:00:00-05:00"
* request = Reference(medicationrequest-example-ltc-monthly-uti-trimethoprim)
//* recorder.display = "Patient Identified"
* dosage.text = "Sulfamethoxazole 800 mg / Trimethoprim 160 mg by mouth twice daily for 3 days"
* dosage.site = $sct#74262004 "Oral cavity structure (body structure)"
* dosage.route = $sct#26643006 "Oral route"
* dosage.route.text = "Oral"
* dosage.dose.value = 160
* dosage.dose.unit = "MG"
* dosage.dose.value = 800
* dosage.dose.unit = "MG"