Instance: observation-example-rps-negativepcr-initial
InstanceOf: RespiratoryPathogensSurveillanceEventObservationR4
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#95209-3 "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"
* code.text = "SARS-CoV+SARS-CoV-2 Ag Resp Ql IA.rapid"
* subject.reference = "Patient/patient-example-rps-negativepcr"
* subject.display = "RPS, NegativePCR"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-01T08:30:00Z"
* issued = "2023-01-01T08:30:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #10828004
* valueCodeableConcept.coding.display = "Positive"
* valueCodeableConcept.text = "Positive"