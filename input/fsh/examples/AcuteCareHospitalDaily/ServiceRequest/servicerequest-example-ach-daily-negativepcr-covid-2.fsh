Instance: servicerequest-example-ach-daily-negativepcr-covid-2
InstanceOf: AcuteCareHospitalDailyEventServiceRequest
Title: "ServiceRequest - Example ACH Daily Negative PCR COVID 2"
Description: "ServiceRequest - Example ACH Daily Negative PCR COVID 2"
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
* code = $loinc#94307-6 "SARS-CoV-2 (COVID-19) N gene [Presence] in Specimen by Nucleic acid amplification using CDC primer-probe set N1"
* code.text = "SARS-CoV-2 (COVID-19) N gene [Presence] in Specimen by Nucleic acid amplification using CDC primer-probe set N1"
* quantityQuantity.value = 1
* subject = Reference(patient-example-ach-daily-negativepcr)
* subject.display = "ACHDaily NegativePCR"
* encounter = Reference(encounter-example-ach-daily-negativepcr-1)
* encounter.display = "Hospital Admission"
* occurrenceTiming.event = "2024-02-02T17:22:00-05:00"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2024-01-02T17:22:00-05:00"
* specimen = Reference(specimen-example-ach-daily-negativepcr-2)