Instance: condition-example-diagnosis-ach-monthly-pass2
InstanceOf: AcuteCareHospitalMonthlyReportingCondition
Title: "Condition - Example Diagnosis ACH Monthly Pass2"
Description: "Condition - Example Diagnosis ACH Monthly Pass2 - Encounter Diagnosis: Thrombophlebitis of deep femoral vein"
Usage: #example
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code = $sct#1748006 "Thrombophlebitis of deep femoral vein (disorder)"
* code.text = "Thrombophlebitis"
* subject = Reference(patient-example-ach-monthly-pass2)
* subject.display = "Pass2 ACH"
