Instance: medicationadministration-example-ach-pass3-metronidazole-1
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Example ACH Pass3 Metronidazole 1"
Description: "MedicationAdministration - Example ACH Pass3 - Metronidazole 500 MG - First Encounter Administration"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888321"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-metronidazole)
* medicationReference.display = "Metronidazole 500 MG"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ach-ach-pass3-short-stay)
* context.display = "Short Stay"
* effectiveDateTime = "2024-02-01T21:02:00-05:00"
* request = Reference(medicationrequest-example-ach-pass3-metronidazole)
//* recorder.display = "Patient Identified"
* dosage.text = "5mg tablet by mouth twice daily"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 5 'mg' "mg"



Instance: medicationadministration-example-ach-pass3-metronidazole-2
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Example ACH Pass3 Metronidazole 2"
Description: "MedicationAdministration - Example ACH Pass3 - Metronidazole 500 MG - Second Encounter Administration"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888322"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-metronidazole)
* medicationReference.display = "Metronidazole 500 MG"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ach-ach-pass3-short-stay)
* context.display = "Short Stay"
* effectiveDateTime = "2024-02-02T21:09:00-05:00"
* request = Reference(medicationrequest-example-ach-pass3-metronidazole)
//* recorder.display = "Patient Identified"
* dosage.text = "5mg tablet by mouth twice daily"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 5 'mg' "mg"



Instance: medicationadministration-example-ach-pass3-metronidazole-3
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Example ACH Pass3 Metronidazole 3"
Description: "MedicationAdministration - Example ACH Pass3 - Metronidazole 500 MG - Third Encounter Administration"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888323"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient Medication"
* medicationReference = Reference(medication-example-metronidazole)
* medicationReference.display = "Metronidazole 500 MG"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ach-ach-pass3-short-stay)
* context.display = "Short Stay"
* effectiveDateTime = "2024-02-03T09:09:00-05:00"
* request = Reference(medicationrequest-example-ach-pass3-metronidazole)
//* recorder.display = "Patient Identified"
* dosage.text = "5mg tablet by mouth twice daily"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 5 'mg' "mg"