Instance: observation-example-ach-pass2-hemo-a1c
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass2-hemo-a1c)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-01-31T23:01:00-05:00"
* issued = "2024-01-31T23:52:00-05:00"
* valueQuantity = 7.5 '%' "%"
* specimen = Reference(specimen-example-ach-ach-pass2-blood-1)


