Instance: servicerequest-example-hypo-sameresultdiffday1
InstanceOf: AcuteCareHospitalReportingServiceRequest
Title: "ServiceRequest - Hypo ServiceRequest Example Sameresultdiffday 1"
Description: "ServiceRequest - Example Hypo ServiceRequest Sameresultdiffday 1"
Usage: #example
* identifier.use = #usual
* identifier.type = $v2-0203#PLAC "Placer Identifier"
* identifier.type.text = "Placer Identifier"
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.798"
* identifier.value = "101963182"
* status = #completed
* intent = #original-order
* category = $sct#108252007 "Laboratory procedure"
* category.text = "Laboratory procedure"
* code = $sct#113076002 "Glucose tolerance test"
* code.text = "Glucose tolerance test"
* quantityQuantity.value = 1
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* encounter.reference = "Encounter/encounter-example-hypo-sameresultdiffday"
* encounter.display = "Hospital Encounter"
* occurrenceTiming.event = "2023-01-04T05:00:00Z"
* occurrenceTiming.repeat.boundsPeriod.start = "2023-01-04T05:00:00Z"
* occurrenceTiming.repeat.count = 1
* occurrenceTiming.code.text = "Once"
* authoredOn = "2023-01-04T05:00:00Z"