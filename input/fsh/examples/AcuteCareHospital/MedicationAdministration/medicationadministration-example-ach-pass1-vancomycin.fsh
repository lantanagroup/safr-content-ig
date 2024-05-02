Instance: medicationadministration-example-ach-pass1-vancomycin
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1018888111"
* status = #completed
* category = $medicationrequest-category#inpatient "Inpatient"
* category.text = "Inpatient"
* medicationReference = Reference(medication-example-vancomycin-15)
* medicationReference.display = "vancomycin Injectable Solution 50MG"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* context = Reference(encounter-example-ach-ach-pass1)
* context.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T14:34:00-05:00"
* request = Reference(medicationrequest-example-ach-pass1-vancomycin)
* dosage.text = "15mg/kg"
* dosage.route = $sct#47625008 "Intravenous route"
* dosage.route.text = "IV"
* dosage.dose = 15 'mg/kg' "mg/kg"