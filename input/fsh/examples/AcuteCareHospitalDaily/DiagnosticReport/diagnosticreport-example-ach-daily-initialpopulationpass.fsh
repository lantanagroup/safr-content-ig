Instance: diagnosticreport-example-ach-daily-initialpopulationpass
InstanceOf: AcuteCareHospitalDailyEventLabDiagnosticReport
Title: "DiagnosticReport - Example ACH Daily - Initial Population Pass"
Description: "DiagnosticReport - Example ACH Daily - Initial Population Pass"
Usage: #example
* status = #final
* category[LaboratorySlice] = http://terminology.hl7.org/CodeSystem/v2-0074#LAB "Laboratory"
* category[LaboratorySlice].text = "Laboratory"
* code = $sct#258500001 "Nasopharyngeal swab (specimen)"
* code.text = "Nasopharyngeal swab"
* subject = Reference(patient-example-ach-daily-initialpopulationpass)
* subject.display = "InitialPopulationPass, ACHDaily"
* encounter = Reference(encounter-example-ach-daily-initialpopulationpass-1)
* encounter.display = "Hospital Admission"
* conclusionCode = $sct#840539006 "Disease caused by severe acute respiratory syndrome coronavirus 2 (disorder)"
* effectiveDateTime = "2024-02-01T23:14:00-05:00"
* issued = "2024-02-02T08:52:00-05:00"