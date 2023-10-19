Instance: observation-example-hypo-lab-hypo4
InstanceOf: AcuteCareHospitalReportingLabObservation
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "exaOflSQX3EYaZluUGUrRGkZb.UOlNYDwKxY.mmKO6P80Gpc.S8fihBkQ0FjfmmpP3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101903006"
* basedOn.display = "Perform POC Glucose"
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose, POC"
* subject.reference = "Patient/patient-example-hypo"
* subject.display = "Hypo, Edadd"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2022-08-18T22:08:29Z"
* issued = "2022-08-18T22:08:40Z"
* valueQuantity = 160 'mg/dL' "mg/dL"