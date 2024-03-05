Instance: observation-example-rps-rsvlabbtg
InstanceOf: RespiratoryPathogensSurveillanceEventObservationR4
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* category.text = "Laboratory"
* code = $loinc#31949-1 "Respiratory syncytial virus Ag [Presence] in Throat"
* code.text = "RSV Ag Ql (Throat)"
* subject.reference = "Patient/patient-example-rps-rsvlabbtg"
* subject.display = "RPS, RSVLabBTG"
* encounter.reference = "Encounter/encounter-example-hypo-hypo"
* encounter.display = "Hospital Encounter"
* effectiveDateTime = "2023-01-01T12:15:00Z"
* issued = "2023-01-01T12:15:00Z"
* valueCodeableConcept.coding.system = $sct
* valueCodeableConcept.coding.code = #720735008
* valueCodeableConcept.coding.display = "Presumptive positive"
* valueCodeableConcept.text = "Presumptive positive"