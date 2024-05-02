Instance: diagnosticreport-example-ach-ach-pass2-lab-cbc
InstanceOf: AcuteCareHospitalLabDiagnosticReport
Usage: #example
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* category[LaboratorySlice].text = "Laboratory"
* code = $loinc#58410-2 "CBC panel - Blood by Automated count"
* code.text = "CBC Panel"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-01-31T23:01:00-05:00"
* issued = "2024-01-31T23:02:00-05:00"
* result[+] = Reference(observation-example-ach-pass2-hemo-a1c)
* result[+] = Reference(observation-example-ach-pass2-poc-1)




