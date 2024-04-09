Instance: observation-example-ach-pass2-poc-1
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass2-glucose)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-01-31T23:01:00-05:00"
* issued = "2024-01-31T23:02:00-05:00"
* valueQuantity = 53 'g/dL' "d/gL"


Instance: observation-example-ach-pass2-poc-2
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass2-glucose)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T10:14:00-05:00"
* issued = "2024-02-02T10:15:00-05:00"
* valueQuantity = 105 'g/dL' "d/gL"


