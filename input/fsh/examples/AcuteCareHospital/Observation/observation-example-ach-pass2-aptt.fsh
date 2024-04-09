Instance: observation-example-ach-pass2-aptt
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass2-aptt)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#3173-2  "aPTT in Blood by Coagulation assay"
* code.text = "aPTT"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T11:24:00-05:00"
* issued = "2024-02-02T11:29:00-05:00"
* valueQuantity = 8 's' "s"
* specimen = Reference(specimen-example-ach-ach-pass2-blood-1)