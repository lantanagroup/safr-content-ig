Instance: lab-observation-example-ach-daily-rsvlabbtg
InstanceOf: AcuteCareHospitalDailyEventLabObservation
Title: "Lab Observation - ACH Daily Observation Example RSV Lab BTG"
Description: "Lab Observation - Example ACH Daily Observation RSV Lab BTG"
Usage: #example
* status = #final
* category[Laboratory] = $observation-category#laboratory "Laboratory"
* category[Laboratory].text = "Laboratory"
* code = $loinc#31949-1 "Respiratory syncytial virus Ag [Presence] in Throat"
* code.text = "RSV Ag Ql (Throat)"
* subject.reference = "Patient/patient-example-ach-daily-rsvlabbtg"
* subject.display = "ACHDaily, RSVLabBTG"
* encounter.reference = "Encounter/encounter-example-ach-daily-rsvlabbtg"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2024-01-01T12:15:00Z"
* issued = "2024-01-01T12:15:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #720735008
* valueCodeableConcept.coding.display = "Presumptive positive"
* valueCodeableConcept.text = "Presumptive positive"
* specimen = Reference(specimen-example-ach-daily-rsvlabbtg)