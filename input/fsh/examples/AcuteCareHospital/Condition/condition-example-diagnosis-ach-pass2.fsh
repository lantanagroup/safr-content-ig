Instance: condition-example-diagnosis-ach-pass2
InstanceOf: AcuteCareHospitalReportingCondition
Usage: #inline
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code = $sct#1748006 "Thrombophlebitis of deep femoral vein (disorder)"
* code.text = "Thrombophlebitis"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
