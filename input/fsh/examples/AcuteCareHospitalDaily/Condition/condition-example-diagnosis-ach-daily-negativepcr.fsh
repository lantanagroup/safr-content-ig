Instance: condition-example-diagnosis-ach-daily-negativepcr
InstanceOf: Condition
Title: "Condition - ACH Daily Condition Example Negative PCR"
Description: "Condition - Example ACH Daily Condition Negative PCR"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eloBHVi6UskNwFJ55XgUq294CfCWyE3tytd.P4NomlhQprDjGoqWBeK2-ed8C2oMs3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding = $icd-10-cm#U07.1 "COVID-19"
* code.text = "COVID-19"
* subject.reference = "Patient/patient-example-ach-daily-negativepcr"
* subject.display = "ACHDaily, NegativePCR"
* encounter.display = "Inpatient"