Instance: lab-observation-example-rps-negativepcr-1
InstanceOf: RespiratoryPathogensSurveillanceEventLabObservation
Title: "Lab Observation - RPS Daily Observation Example Negative PCR 1"
Description: "Lab Observation - Example RPS Daily Observation Negative PCR 1"
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#94307-6 "SARS-CoV-2 (COVID-19) N gene [Presence] in Specimen by Nucleic acid amplification using CDC primer-probe set N1"
* code.text = "SARS-CoV-2 (COVID-19) N gene NAA+probe CDC primer-probe set N1 Ql (Specimen)"
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
* specimen = Reference(specimen-example-rps-negativepcr-1)