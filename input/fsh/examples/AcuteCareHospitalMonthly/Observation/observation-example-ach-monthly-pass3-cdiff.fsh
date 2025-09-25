Instance: observation-example-ach-monthly-pass3-cdiff
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Example ACH Monthly Pass3 C. diff"
Description: "Observation - Example ACH Monthly Pass3 - Lab: Clostridioides difficile (C. diff)"
Usage: #example
* status = #final
* basedOn = Reference(servicerequest-example-ach-monthly-pass3-cdiff)
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $sct#5933001 "Clostridioides difficile (organism)"
* code.text = "C. Diff."
* subject = Reference(patient-example-ach-monthly-pass3)
* subject.display = "Pass3 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass3-short-stay)
* encounter.display = "Hospital Admission, Short Stay"
* effectiveDateTime = "2024-02-01T19:02:00-05:00"
* issued = "2024-02-02T15:30:00-05:00"
* valueCodeableConcept = $sct#10828004 "Positive (qualifier value)"
* specimen = Reference(specimen-example-ach-monthly-pass3-stool)