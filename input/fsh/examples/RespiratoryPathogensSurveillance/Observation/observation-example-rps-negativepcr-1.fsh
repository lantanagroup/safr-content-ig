Instance: observation-example-rps-negativepcr-1
InstanceOf: RespiratoryPathogensSurveillanceEventLabObservation
Title: "Observation - RPS Observation Example Negative PCR 1"
Description: "Observation - Example RPS Observation Negative PCR 1"
Usage: #example
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#95209-3 "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory system specimen by Rapid immunoassay"
* code.text = "SARS-CoV+SARS-CoV-2 Ag Resp Ql IA.rapid"
* subject.reference = "Patient/patient-example-rps-negativepcr"
* subject.display = "RPS, NegativePCR"
* encounter.reference = "Encounter/encounter-example-rps-negativepcr-1"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-01T08:30:00Z"
* issued = "2023-01-01T08:30:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #10828004
* valueCodeableConcept.coding.display = "Positive"
* valueCodeableConcept.text = "Positive"