Instance: servicerequest-example-ach-ach-pass2-aptt
InstanceOf: AcuteCareHospitalReportingServiceRequest
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.type.text = "Placer Identifier"
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1019631824"
* status = #completed
* intent = #original-order
* category = $sct#108252007 "Laboratory procedure"
* category.text = "Laboratory procedure"
* code = $loinc#3173-2  "aPTT in Blood by Coagulation assay"
* code.text = "aPTT"
* priority = #stat
* quantityQuantity.value = 1
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-01-31T22:21:00-05:00"
//* occurrenceTiming.repeat.boundsPeriod.start = "2023-01-04T05:00:00Z"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-01-31T22:21:00-05:00"
* specimen = Reference(specimen-example-ach-ach-pass2-blood-1)