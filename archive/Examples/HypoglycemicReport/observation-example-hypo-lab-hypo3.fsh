Instance: observation-example-hypo-lab-hypo3
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Hypo Lab Example Hypo 3"
Description: "Observation - Example Hypo Lab Hypo 3"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-observation-lab"
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eQ3q6LpUf1A3wTsNWNxmzcLYyDG6vKNcOG0R-aabNHy1DQPurA1JNLSXzZTolkmyY3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101903005"
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
* effectiveDateTime = "2022-08-18T00:19:30Z"
* issued = "2022-08-18T00:20:11Z"
* valueQuantity = 146 'mg/dL' "mg/dL"