Instance: observation-example-hypo-lab-sameresultdiffday7
InstanceOf: AcuteCareHospitalReportingLabObservation
Title: "Observation - Hypo Lab Example Sameresultdiffday 7"
Description: "Observation - Example Hypo Lab Sameresultdiffday 7"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "ecWm9uIRYO1YbNebr39d6KMIndGfaqkAof.X9Ht9gN24Wh8DGhMEjhh00IDiwWvDG3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101888901"
* basedOn.display = "Perform POC Glucose"
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose, POC"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.reference = "Encounter/encounter-example-hypo-sameresultdiffday"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2022-08-19T16:29:00Z"
* issued = "2022-08-22T18:55:17Z"
* valueQuantity = 39 'mg/dL' "mg/dL"