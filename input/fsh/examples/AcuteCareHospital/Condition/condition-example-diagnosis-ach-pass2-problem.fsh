Instance: condition-example-diagnosis-ach-pass2-problem
InstanceOf: AcuteCareHospitalReportingCondition
Usage: #inline
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#problem-list-item "Problem List Item"
* category.text = "Problem List Item"
* code.coding[0] = $sct#111552007 "Diabetes mellitus without complication (disorder)"
* code.coding[+] = $icd-10-cm#E11.9 "Type 2 diabetes mellitus : Without complications"
* code.text = "Diabetes mellitus without complication"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
