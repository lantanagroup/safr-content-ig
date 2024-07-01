Instance: diagnosticreport-example-rps-initialpopulationpass
InstanceOf: RespiratoryPathogensSurveillanceEventLabDiagnosticReport
Title: "DiagnosticReport - Example ACH Pass2 Lab CBC"
Description: "DiagnosticReport - Example ACH Pass2 - CBC panel - Blood by Automated count"
Usage: #example
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* category[LaboratorySlice].text = "Laboratory"
* code = $sct#258500001 "Nasopharyngeal swab (specimen)"
* code.text = "Nasopharyngeal swab"
* subject = Reference(patient-example-rps-initialpopulationpass)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-rps-initialpopulationpass)
* encounter.display = "Hospital Admission"
* conclusionCode = $sct#840539006 "Disease caused by severe acute respiratory syndrome coronavirus 2 (disorder)"
* effectiveDateTime = "2024-02-01T23:14:00-05:00"
* issued = "2024-02-02T08:52:00-05:00"