Instance: observation-example-hypo-lab-sameresultdiffday2
InstanceOf: HypoglycemicReportingLabObservation
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "egPBq43ZIj31SXoxILZVqWc56Tf9bRPrupc.Y-NbKU4tL2Z9J5SEQzj.Jxk0SIKCG3"
* basedOn.identifier.use = #usual
* basedOn.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* basedOn.identifier.value = "101888897"
* basedOn.display = "Perform POC Glucose"
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose, POC"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.reference = "Encounter/encounter-example-hypo-sameresultdiffday"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2022-08-17T16:16:41Z"
* issued = "2022-08-17T16:17:15Z"
* valueQuantity = 140 'mg/dL' "mg/dL"