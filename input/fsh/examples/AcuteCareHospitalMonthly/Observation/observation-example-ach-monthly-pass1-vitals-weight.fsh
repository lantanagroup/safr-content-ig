Instance: observation-example-ach-monthly-pass1-vitals-weight
InstanceOf: AcuteCareHospitalMonthlyReportingVitalsObservation
Title: "Observation - Example ACH Monthly Pass1 Vitals Weight"
Description: "Observation - Example ACH Monthly Pass1 - Vitals Signs: Birth weight Measured"
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* category[VSCat].text = "Vital Signs"
* code = $loinc#29463-7 "Body weight"
* code.text = "Weight"
* subject = Reference(patient-example-ach-monthly-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-01T16:02:00-05:00"
* issued = "2024-02-01T16:02:00-05:00"
* valueQuantity = 0.58 'kg' "kg"