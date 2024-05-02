Instance: condition-example-diagnosis-sameresultdiffday1
InstanceOf: AcuteCareHospitalReportingCondition
Title: "Condition - Hypo Diagnosis Example Sameersultdiffday 1"
Description: "Condition - Example Hypo Diagnosis Sameresultdiffday 1"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eDBsPVmO1ldptMGm1Wd3Ad6T5xbPltA3nSEJTmvuzohITBZPF3cSD1V49M3K2xNGQ3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding[0] = $sct#28876000 "Disease condition determination, uncontrolled (finding)"
* code.coding[+] = $icd-9-cm#790.29 "Uncontrolled blood glucose"
* code.text = "Uncontrolled blood glucose"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.display = "Hospital Encounter"