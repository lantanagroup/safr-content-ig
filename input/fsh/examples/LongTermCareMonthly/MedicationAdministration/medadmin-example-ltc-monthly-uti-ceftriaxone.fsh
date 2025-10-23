Instance: medadmin-example-ltc-monthly-uti-ceftriaxone
InstanceOf: LongTermCareMonthlyEventMedicationAdministration
Title: "MedicationAdministration - Example LTC Monthly UTI - Ceftriaxone 1000 MG"
Description: "MedicationAdministration - Example LTC Monthly UTI - Ceftriaxone 1000 MG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888895"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-ceftriaxone-1000)
* medicationReference.display = "ceftriaxone 1000 MG Prefilled Syringe"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ltc-monthly-uti)
* context.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T12:22:00-05:00"
* request = Reference(medicationrequest-example-ltc-monthly-uti-ceftriaxone)
//* recorder.display = "Patient Identified"
* dosage.text = "ceftriaxone 1000 MG IV"
* dosage.site = $sct#368208006 "Left arm"
* dosage.route = $sct#47625008 "Intravenous route"
* dosage.route.text = "IV"
* dosage.dose = 1 'G' "G"
