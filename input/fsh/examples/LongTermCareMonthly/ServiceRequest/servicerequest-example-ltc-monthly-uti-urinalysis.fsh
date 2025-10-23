Instance: servicerequest-example-ltc-monthly-uti-urinalysis
InstanceOf: QICoreServiceRequest|6.0.0
Title: "ServiceRequest - Example LTC Monthly - UTI Urinalysis"
Description: "ServiceRequest - Example LTC Monthly - UTI Urinalysis"
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.type.text = "Placer Identifier"
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1019631821"
* status = #completed
* intent = #original-order
* category = $sct#108252007 "Laboratory procedure"
* category.text = "Laboratory procedure"
// TODO, is this really a procedure code or an observation code. Orders should be for procedures. Need to verify and update appropriately.
* code = $loinc#58077-9 "Urinalysis complete W Reflex Culture panel - Urine"
* code.text = "Urinalysis complete W Reflex Culture panel (U)"
* quantityQuantity.value = 1
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* encounter = Reference(encounter-example-ltc-monthly-uti)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-02-02T17:22:00-05:00"
//* occurrenceTiming.repeat.boundsPeriod.start = "2023-01-04T05:00:00Z"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-02-02T17:22:00-05:00"
* specimen = Reference(specimen-example-ltc-monthly-uti-urine)