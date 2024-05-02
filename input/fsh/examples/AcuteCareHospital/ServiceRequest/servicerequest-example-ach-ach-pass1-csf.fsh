Instance: servicerequest-example-ach-ach-pass1-csf
InstanceOf: AcuteCareHospitalReportingServiceRequest
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.type.text = "Placer Identifier"
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1019631822"
* status = #completed
* intent = #original-order
* category = $sct#108252007 "Laboratory procedure"
* category.text = "Laboratory procedure"
* code = $loinc#29584-0 "Differential panel - Cerebral spinal fluid"
* code.text = "Differential panel - Cerebral spinal fluid"
* quantityQuantity.value = 1
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-ach-pass1)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-02-02T17:22:30-05:00"
//* occurrenceTiming.repeat.boundsPeriod.start = "2023-01-04T05:00:00Z"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-02-02T17:22:30-05:00"
* specimen = Reference(specimen-example-ach-ach-pass1-csf)