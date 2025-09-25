Instance: observation-example-hypo-lab-hypo8
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Hypo Lab Example Hypo 8"
Description: "Observation - Example Hypo Lab Hypo 8"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-observation-lab"
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "egcnW6Nn2B4jBxhWCFxF2WdeZC.LNcy-w6VjkSozRY5CR5XKCi6.p9WpTzS49qvlE3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101889052"
* basedOn.display = "Perform POC Glucose"
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose, POC"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2022-08-17T16:29:29Z"
* issued = "2022-08-17T16:29:47Z"
* valueQuantity = 385 'mg/dL' "mg/dL"