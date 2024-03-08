Instance: observation-example-rps-negativepcr-followup
InstanceOf: RespiratoryPathogensSurveillanceEventObservation
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#94307-6 "SARS-CoV-2 (COVID-19) N gene [Presence] in Specimen by Nucleic acid amplification using CDC primer-probe set N1"
* code.text = "SARS-CoV-2 (COVID-19) N gene NAA+probe CDC primer-probe set N1 Ql (Specimen)"
* subject.reference = "Patient/patient-example-rps-negativepcr"
* subject.display = "RPS, NegativePCR"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-02T15:30:00Z"
* issued = "2023-01-02T15:30:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #260385009
* valueCodeableConcept.coding.display = "Negative"
* valueCodeableConcept.text = "Negative"