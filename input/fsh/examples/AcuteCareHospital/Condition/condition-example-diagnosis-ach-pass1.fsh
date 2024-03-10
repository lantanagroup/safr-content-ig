Instance: condition-example-diagnosis-ach-pass1
InstanceOf: AcuteCareHospitalReportingCondition
Usage: #inline
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding[0] = $sct#5758002 "Bacteremia (finding)"
* code.coding[+] = $icd-10-cm#R78.81 "Bacteremia"
* code.text = "Bacteremia"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
