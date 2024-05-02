Instance: observation-example-hypo-lab-hypo7
InstanceOf: AcuteCareHospitalReportingLabObservation
Title: "Observation - Hypo Lab Example Hypo 7"
Description: "Observation - Example Hypo Lab Hypo 7"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "ezaszo1KqoABo5mSXIK20fsDNysIHRIFpUApRn7uMKMpmwwc5Ojx8Gc9TEkZ7glhV3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101903010"
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
* effectiveDateTime = "2022-08-19T12:00:00Z"
* issued = "2022-08-22T19:06:12Z"
* valueQuantity = 95 'mg/dL' "mg/dL"