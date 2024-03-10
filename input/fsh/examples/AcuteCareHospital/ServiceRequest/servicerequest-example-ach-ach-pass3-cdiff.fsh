Instance: servicerequest-example-ach-ach-pass3-cdiff
InstanceOf: AcuteCareHospitalReportingServiceRequest
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.type.text = "Placer Identifier"
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "1019631826"
* status = #completed
* intent = #original-order
* category = $sct#108252007 "Laboratory procedure"
* category.text = "Laboratory procedure"
* code = $loinc#13957-6 "Clostridioides difficile toxin A [Presence] in Stool by Immunoassay"
* code.text = "C. Diff. toxin"
* quantityQuantity.value = 1
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-short-stay)
* encounter.display = "Hospital Admission, Short Stay"
* occurrenceTiming.event = "2024-02-01T18:12:00-05:00"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-02-01T18:12:00-05:00"
* specimen = Reference(specimen-example-ach-ach-pass3-stool)