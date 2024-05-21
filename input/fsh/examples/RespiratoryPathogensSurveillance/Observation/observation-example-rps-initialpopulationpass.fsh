Instance: observation-example-rps-initialpopulationpass
InstanceOf: RespiratoryPathogensSurveillanceEventLabObservation
Title: "Observation - RPS Observation Example Initial Population Pass"
Description: "Observation - Example RPS Observation Initial Population Pass"
Usage: #example
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#94500-6 "SARS-CoV-2 (COVID-19) RNA [Presence] in Respiratory system specimen by NAA with probe detection"
* code.text = "SARS-CoV-2 RNA Resp Ql NAA+probe"
* subject.reference = "Patient/patient-example-rps-initialpopulationpass"
* subject.display = "RPS, InitialPopulationPass"
* encounter.reference = "Encounter/encounter-example-rps-initialpopulationpass-1"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-01T15:04:25Z"
* issued = "2023-01-01T15:04:25Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #10828004
* valueCodeableConcept.coding.display = "Positive"
* valueCodeableConcept.text = "Positive"