Instance: diagnosticreport-example-ach-ach-pass2-cardiopulmonary
InstanceOf: AcuteCareHospitalDiagnosticReport
Usage: #inline
* status = #final
* category = $loinc#LP172861-9 "Cardiopulmonary"
* category.text = "Cardiopulmonary"
* code = $sct#76746007 "Cardiovascular stress testing"
* code.text = "Cardiovascular stress testing"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* conclusionCode = $sct#710031008 "Inducible ischemia manifest on stress test post myocardial infarction (finding)"
* effectiveDateTime = "2024-03-01T23:14:00-05:00"
* issued = "2024-03-02T08:52:00-05:00"

 
