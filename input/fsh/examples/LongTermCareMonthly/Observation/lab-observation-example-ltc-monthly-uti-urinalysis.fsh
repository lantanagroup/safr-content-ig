Instance: lab-observation-example-ltc-monthly-uti-urinalysis
InstanceOf: LongTermCareMonthlyEventLabObservation
Title: "Observation - Example LTC Monthly - Lab: Urinalysis complete W Reflex Culture panel - e.coli in Urine"
Description: "Observation - Example LTC Monthly - Lab: Urinalysis complete W Reflex Culture panel - e.coli in Urine"
Usage: #example
* status = #final
* basedOn = Reference(servicerequest-example-ltc-monthly-uti-urinalysis)
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $loinc#58077-9 "Urinalysis complete W Reflex Culture panel - Urine"
* code.text = "Urinalysis complete W Reflex Culture panel (U)"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* encounter = Reference(encounter-example-ltc-monthly-uti)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T18:12:00-05:00"
* issued = "2024-02-03T11:42:00-05:00"
* valueCodeableConcept = $sct#200025001 "Urine culture - E. coli"
* valueCodeableConcept.text = "Culture result showed >100,000 CFU/mL of Escherichia coli (E. coli)"
* specimen = Reference(specimen-example-ltc-monthly-uti-urine)