Instance: condition-example-diagnosis-ach-daily-rsvlabbtg
InstanceOf: Condition
Title: "Condition - ACH Daily Condition Example RSV Lab BTG"
Description: "Condition - Example ACH Daily Condition RSV Lab BTG"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eloBHVi6UskNwFJ55XgUq294CfCWyE3tytd.P4NomlhQprDjGoqWBeK2-ed8C2oMs3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding = $icd-10-cm#B97.4 "Respiratory syncytial virus as the cause of diseases classified elsewhere"
* code.text = "RSV"
* subject.reference = "Patient/patient-example-ach-daily-rsvlabbtg"
* subject.display = "ACHDaily, RSVLabBTG"
* encounter.display = "Inpatient"