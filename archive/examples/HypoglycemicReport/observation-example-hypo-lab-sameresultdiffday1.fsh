Instance: observation-example-hypo-lab-sameresultdiffday1
InstanceOf: AcuteCareHospitalReportingLabObservation
Title: "Observation - Hypo Lab Example Sameresultdiffday 1"
Description: "Observation - Example Hypo Lab Sameresultdiffday 1"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-observation-lab"
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "ezpuYrqPh-i07uxw8chC4Fmf-vXiPwr.yVP2-xB6DfWdHWgDkX8XyBla.dAb24t7c3"
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose, POC"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.reference = "Encounter/encounter-example-hypo-sameresultdiffday"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2022-08-17T04:00:00Z"
* issued = "2022-08-18T00:18:49Z"
* valueQuantity = 39 'mg/dL' "mg/dL"