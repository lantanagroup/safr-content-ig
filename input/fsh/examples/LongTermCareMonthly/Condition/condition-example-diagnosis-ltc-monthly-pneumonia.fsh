Instance: condition-example-diagnosis-ltc-monthly-pneumonia
InstanceOf: QICoreConditionEncounterDiagnosis|6.0.0
Title: "Condition - Example Diagnosis LTC Monthly - Pneumonia"
Description: "Condition - Example Diagnosis LTC Monthly - Pneumonia"
Usage: #example
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding = $icd-10-cm#J18.9 "Pneumonia, unspecified organism"
* code.text = "Pneumonia, unspecified organism"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"