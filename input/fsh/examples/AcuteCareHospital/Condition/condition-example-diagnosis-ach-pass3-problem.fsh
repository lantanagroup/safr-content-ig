Instance: condition-example-diagnosis-ach-pass3-problem
InstanceOf: AcuteCareHospitalReportingCondition
Usage: #inline
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#resolved "Resolved"
* category = $condition-category#problem-list-item "Problem List Item"
* category.text = "Problem List Item"
* code.coding[0] = $sct#15805002 "Acute sinusitis (disorder)"
* code.coding[+] = $icd-10-cm#J01.90 "Acute sinusitis, unspecified"
* code.text = "Acute sinusitis"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
* onsetDateTime = "2024-01-21T07:32:00-05:00"
* abatementDateTime = "2024-02-02T16:43:00-05:00"
