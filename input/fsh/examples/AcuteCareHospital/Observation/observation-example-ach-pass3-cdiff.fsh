Instance: observation-example-ach-pass3-cdiff
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #inline
* status = #final
* basedOn = Reference(servicerequest-example-ach-ach-pass3-cdiff)
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $sct#5933001 "Clostridioides difficile (organism)"
* code.text = "C. Diff."
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-short-stay)
* encounter.display = "Hospital Admission, Short Stay"
* effectiveDateTime = "2024-02-01T19:02:00-05:00"
* issued = "2024-02-02T15:30:00-05:00"
* valueCodeableConcept = $sct#10828004 "Positive (qualifier value)"
* specimen = Reference(specimen-example-ach-ach-pass3-stool)