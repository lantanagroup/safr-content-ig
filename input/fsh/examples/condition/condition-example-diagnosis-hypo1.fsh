Instance: condition-example-diagnosis-hypo1
InstanceOf: HypoglycemicReportingCondition
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eloBHVi6UskNwFJ55XgUq294CfCWyE3tytd.P4NomlhQprDjGoqWBeK2-ed8C2oMs3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding[0] = $sct#80394007 "Hyperglycemia (disorder)"
* code.coding[+] = $icd-9-cm#790.29 "Hyperglycemia"
* code.text = "Hyperglycemia"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.display = "Hospital Encounter"