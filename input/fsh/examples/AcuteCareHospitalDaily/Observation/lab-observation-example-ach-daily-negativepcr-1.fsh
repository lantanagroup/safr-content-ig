Instance: lab-observation-example-ach-daily-negativepcr-1
InstanceOf: AcuteCareHospitalDailyEventLabObservation
Title: "Lab Observation - ACH Daily Observation Example Negative PCR 1"
Description: "Lab Observation - Example ACH Daily Observation Negative PCR 1"
Usage: #example
* status = #final
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $loinc#94307-6 "SARS-CoV-2 (COVID-19) N gene [Presence] in Specimen by Nucleic acid amplification using CDC primer-probe set N1"
* code.text = "SARS-CoV-2 (COVID-19) N gene NAA+probe CDC primer-probe set N1 Ql (Specimen)"
* subject.reference = "Patient/patient-example-ach-daily-negativepcr"
* subject.display = "ACHDaily, NegativePCR"
* encounter.reference = "Encounter/encounter-example-ach-daily-negativepcr-1"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-01T08:30:00Z"
* issued = "2023-01-01T08:30:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #10828004
* valueCodeableConcept.coding.display = "Positive"
* valueCodeableConcept.text = "Positive"
* specimen = Reference(specimen-example-ach-daily-negativepcr-1)