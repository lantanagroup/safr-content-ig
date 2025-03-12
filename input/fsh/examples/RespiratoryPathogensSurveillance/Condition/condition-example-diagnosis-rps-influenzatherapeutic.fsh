Instance: condition-example-diagnosis-rps-influenzatherapeutic
InstanceOf: Condition
Title: "Condition - RPS Condition Example Influenza Therapeutic"
Description: "Condition - Example RPS Condition Influenza Therapeutic"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eloBHVi6UskNwFJ55XgUq294CfCWyE3tytd.P4NomlhQprDjGoqWBeK2-ed8C2oMs3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding = $icd-10-cm#J09.X "Influenza due to identified novel influenza A virus"
* code.text = "Influenza Type A"
* subject.reference = "Patient/patient-example-rps-influenzatherapeutic"
* subject.display = "RPS, InfluenzaTherapeutic"
* encounter.display = "Inpatient"