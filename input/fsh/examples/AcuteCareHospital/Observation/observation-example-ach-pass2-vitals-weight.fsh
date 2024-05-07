Instance: observation-example-ach-pass2-vitals-weight
InstanceOf: AcuteCareHospitalReportingVitalsObservation
Title: "Observation - Example ACH Pass2 Vitals Weight"
Description: "Observation - Example ACH Pass2 Vitals Signs: Body weight"
Usage: #example
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* category[VSCat].text = "Vital Signs"
* code = $loinc#29463-7 "Body weight"
* code.text = "Weight"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-emergency)
* encounter.display = "Emergency Encounter"
* effectiveDateTime = "2024-01-31T01:42:00-05:00"
* issued = "2024-01-31T01:42:00-05:00"
* valueQuantity = 113.4 'kg' "kg"