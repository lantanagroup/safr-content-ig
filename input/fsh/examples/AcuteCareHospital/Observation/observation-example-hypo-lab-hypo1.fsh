Instance: observation-example-hypo-lab-hypo1
InstanceOf: AcuteCareHospitalReportingLabObservation
Title: "Observation - Hypo Lab Example Hypo 1"
Description: "Observation - Example Hypo Lab Hypo 1"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "evEYVz0wgiO2HiQ7opHkVkv.PKzlBzXgq.FBYq-9dJiJy0tajUnLEpHNPrMlzrR5i3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101903007"
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
* effectiveDateTime = "2022-08-18T15:04:25Z"
* issued = "2022-08-18T15:04:45Z"
* valueQuantity = 145 'mg/dL' "mg/dL"