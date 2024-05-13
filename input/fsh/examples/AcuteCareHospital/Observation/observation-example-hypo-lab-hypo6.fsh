Instance: observation-example-hypo-lab-hypo6
InstanceOf: AcuteCareHospitalReportingLabObservation
Title: "Observation - Hypo Lab Example Hypo 6"
Description: "Observation - Example Hypo Lab Hypo 6"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eq0EVE9XTOpd88ieWI6Er1o2vm5o6uzHK2jzWouEW72IhHfOVjl6k3owSS8WndmDL3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101903011"
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
* effectiveDateTime = "2022-08-19T16:00:00Z"
* issued = "2022-08-22T19:06:32Z"
* valueQuantity = 175 'mg/dL' "mg/dL"