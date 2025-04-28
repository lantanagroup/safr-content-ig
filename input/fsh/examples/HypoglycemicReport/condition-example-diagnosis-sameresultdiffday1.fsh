Instance: condition-example-diagnosis-sameresultdiffday1
InstanceOf: AcuteCareHospitalMonthlyReportingCondition
Title: "Condition - Hypo Diagnosis Example Sameersultdiffday 1"
Description: "Condition - Example Hypo Diagnosis Sameresultdiffday 1"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eDBsPVmO1ldptMGm1Wd3Ad6T5xbPltA3nSEJTmvuzohITBZPF3cSD1V49M3K2xNGQ3"
* clinicalStatus = $condition-clinical#active "Active"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding[0] = $sct#302866003 "Hypoglycemia (disorder)"
* code.coding[+] = $icd-10-cm#E16.2 "Hypoglycemia, unspecified"
* code.text = "hypoglycemia"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.display = "Hospital Encounter"
* encounter = Reference(encounter-example-hypo-sameresultdiffday)