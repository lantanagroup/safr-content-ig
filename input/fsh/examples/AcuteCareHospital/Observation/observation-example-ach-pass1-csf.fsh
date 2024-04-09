Instance: observation-example-ach-pass1-csf
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass1-csf)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#61402-4 "Serratia marcescens DNA [Presence] in Specimen by NAA with probe detection"
* code.text = "Serratia marcescens DNA"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-ach-pass1)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T18:13:00-05:00"
* issued = "2024-02-03T11:47:00-05:00"
* valueCodeableConcept = $sct#260373001 "Detected (qualifier value)"
* specimen = Reference(specimen-example-ach-ach-pass1-csf)