Instance: condition-example-diagnosis-ltc-monthly-dementia
InstanceOf: QICoreConditionProblemsHealthConcerns|6.0.0
Title: "Condition - Example Diagnosis LTC Monthly - Dementia"
Description: "Condition - Example Diagnosis LTC Monthly - Dementia"
Usage: #example
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#problem-list-item "Problem List Item"
* category.text = "Problem List Item"
* code.coding = $icd-10-cm#F03.90 "Unspecified dementia without behavioral disturbance"
* code.coding = $sct#52448006 "Dementia"
* code.text = "Unspecified dementia without behavioral disturbance"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"

Instance: condition-example-diagnosis-ltc-monthly-uti
InstanceOf: QICoreConditionEncounterDiagnosis|6.0.0
Title: "Condition - Example Diagnosis LTC Monthly - UTI"
Description: "Condition - Example Diagnosis LTC Monthly - UTI"
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