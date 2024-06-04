Instance: servicerequest-example-rps-rsvlabbtg-rsv
InstanceOf: RespiratoryPathogensSurveillanceEventServiceRequest
Title: "ServiceRequest - Example RPS RSV Lab BTG"
Description: "ServiceRequest - Example RPS RSV Lab BTG"
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
* code = $loinc#31949-1 "Respiratory syncytial virus Ag [Presence] in Throat"
* code.text = "RSV Ag Ql (Throat)"
* quantityQuantity.value = 1
* subject = Reference(patient-example-rps-rsvlabbtg)
* subject.display = "RPS NegativePCR"
* encounter = Reference(encounter-example-rps-rsvlabbtg)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-02-02T17:22:00-05:00"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-01-02T17:22:00-05:00"
* specimen = Reference(specimen-example-rps-rsvlabbtg)