Instance: servicerequest-example-rps-negativepcr-covid-1
InstanceOf: RespiratoryPathogensSurveillanceEventServiceRequest
Title: "ServiceRequest - Example RPS Negative PCR COVID 1"
Description: "ServiceRequest - Example RPS Negative PCR COVID 1"
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
* code = $loinc#95209-3 "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"
* code.text = "SARS-CoV+SARS-CoV-2 (COVID-19) Ag [Presence] in Respiratory specimen by Rapid immunoassay"
* quantityQuantity.value = 1
* subject = Reference(patient-example-rps-negativepcr)
* subject.display = "RPS NegativePCR"
* encounter = Reference(encounter-example-rps-negativepcr)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-02-02T17:22:00-05:00"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-01-01T17:22:00-05:00"
* specimen = Reference(specimen-example-rps-negativepcr-1)