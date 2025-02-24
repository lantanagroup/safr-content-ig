Instance: condition-example-diagnosis-rps-initialpopulationpass
InstanceOf: Condition
Title: "Condition - RPS Condition Example Initial Population Pass"
Description: "Condition - Example RPS Condition Initial Population Pass"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eloBHVi6UskNwFJ55XgUq294CfCWyE3tytd.P4NomlhQprDjGoqWBeK2-ed8C2oMs3"
* verificationStatus.coding.version = "4.0.0"
* verificationStatus.coding = $condition-ver-status#confirmed "Confirmed"
* verificationStatus.text = "Confirmed"
* clinicalStatus = $condition-clinical#active "Active"
* category = $condition-category#encounter-diagnosis "Encounter Diagnosis"
* category.text = "Encounter Diagnosis"
* code.coding = $icd-10-cm#R06.02 "Shortness of breath"
* code.text = "Hyperglycemia"
* subject.reference = "Patient/patient-example-rps-initialpopulationpass"
* subject.display = "RPS, InitialPopulationPass"
* encounter.display = "Emergency"