Instance: observation-example-ed-patient1
InstanceOf: QICoreLaboratoryResultObservation
Title: "Observation - Example Emergency Department Visit"
Description: "Observation - Example for emergency department visit. Lab: Bacteria identified in Blood by Culture"
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* code = $loinc#600-7 "Bacteria identified in Blood by Culture"
* code.text = "Bacteria identified in Blood by Culture"
* subject = Reference(ed-pat-1)
* subject.display = "Ed Patient1"
* encounter = Reference(encounter-example-ach-ach-pass2-emergency)
* encounter.display = "Emergency department patient visit"
* effectiveDateTime = "2025-01-31T02:35:00-05:00"
* valueCodeableConcept = $sct#113962001 "Staphylococcus capitis ss capitis (organism)"
* valueCodeableConcept.text = "Staphylococcus capitis"