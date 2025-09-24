Instance: observation-example-ach-monthly-pass1-csf
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Example ACH Monthly Pass1 Csf"
Description: "Observation - Example ACH Monthly Pass1 - Lab: Serratia marcescens DNA in Specimen by NAA with probe detection"
Usage: #example
* status = #final
* basedOn = Reference(servicerequest-example-ach-monthly-pass1-csf)
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $loinc#61402-4 "Serratia marcescens DNA [Presence] in Specimen by NAA with probe detection"
* code.text = "Serratia marcescens DNA"
* subject = Reference(patient-example-ach-monthly-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T18:13:00-05:00"
* issued = "2024-02-03T11:47:00-05:00"
* valueCodeableConcept = $sct#260373001 "Detected (qualifier value)"
* specimen = Reference(specimen-example-ach-monthly-pass1-csf)