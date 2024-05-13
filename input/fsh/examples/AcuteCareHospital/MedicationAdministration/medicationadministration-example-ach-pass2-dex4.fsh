Instance: medicationadministration-example-ach-pass2-dex4
InstanceOf: AcuteCareHospitalReportingMedicationAdministration
Title: "MedicationAdministration - Example ACH Pass2 Dex4"
Description: "MedicationAdministration - Example ACH Pass2 - Dex4 4 gm chewable tablet X1"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101888893"
* status = #completed
* category = $medicationrequest-category#outpatient "Outpatient"
* category.text = "Outpatient"
* medicationReference = Reference(medication-example-dex4-tablet)
* medicationReference.display = "Dex4 4 gm chewable tablet X1"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* context = Reference(encounter-example-ach-ach-pass2-emergency)
* context.display = "Emergency Encounter"
* effectiveDateTime = "2024-01-31T04:54:00-05:00"
* request = Reference(medicationrequest-example-ach-pass2-dex4-tablet)
//* recorder.display = "Patient Identified"
* dosage.text = "4 gm chewable tablet X1"
* dosage.route = $sct#26643006 "Oral Use"
* dosage.route.text = "Oral"
* dosage.dose = 4 'g' "g"
