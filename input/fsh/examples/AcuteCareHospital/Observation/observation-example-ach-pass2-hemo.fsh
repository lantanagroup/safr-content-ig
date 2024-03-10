Instance: observation-example-ach-pass2-hemo
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass2-hemo)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#600-7 "Bacteria identified in Blood by Culture"
* code.text = "Bacteria identified in Blood by Culture"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T11:24:00-05:00"
* issued = "2024-02-02T11:29:00-05:00"
* valueQuantity = 8 'g/dL' "d/gL"
* specimen = Reference(specimen-example-ach-ach-pass2-blood-2)