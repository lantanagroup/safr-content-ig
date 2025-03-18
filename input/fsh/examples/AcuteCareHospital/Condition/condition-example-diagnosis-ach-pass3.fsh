Instance: condition-example-diagnosis-ach-pass3
InstanceOf: AcuteCareHospitalReportingCondition
Title: "Condition - Example Diagnosis ACH Monthly Pass3"
Description: "Condition - Example Diagnosis ACH Monthly Pass3 - Encounter Diagnosis: Enterocolitis due to Clostridium difficile"
Usage: #example
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding[+] = $icd-10-cm#A04.7 "Enterocolitis due to Clostridium difficile"
* code.text = "Enterocolitis due to Clostridium difficile"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
