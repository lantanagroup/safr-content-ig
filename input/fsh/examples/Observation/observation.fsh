Instance: observation-example-ed-patient1
InstanceOf: QICoreLaboratoryResultObservation
Title: "Observation - Example Emergency Department Visit"
Description: "Observation - Example for emergency department visit. Lab: Bacteria identified in Blood by Culture"
Usage: #example
* status = #final
* category = $observation-category#laboratory "Laboratory"
* code = $loinc#105066-5 "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Specimen"
* code.text = "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Specimen"
* subject = Reference(ed-pat-1)
* subject.display = "Ed Patient1"
* encounter = Reference(encounter-example-ach-ach-pass2-emergency)
* encounter.display = "Emergency department patient visit"
* effectiveDateTime = "2025-01-31T02:35:00-05:00"
* valueCodeableConcept = $sct#10828004 "Positive"
* valueCodeableConcept.text = "Positive"