Instance: encounter-example-ltc-monthly-uti
InstanceOf: QICoreEncounter|6.0.0
Title: "Encounter - Example LTC Monthly UTI 1 - Long-Term Care"
Description: "Encounter - Example LTC Monthly UTI 1 - Long-Term Care"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104251"
* status = #finished
* class = $v3-ActCode#NONAC "inpatient non-acute"
* type = $sct#18170008 "Subsequent nursing facility visit (procedure)"
* type.text = "Long-Term Care Visit"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* period.start = "2025-02-01T16:02:00-05:00"
* period.end = "2029-02-08T19:00:00-05:00"
* reasonCode = $icd-10-cm#F03.90 "Unspecified dementia, unspecified severity, without behavioral disturbance, psychotic disturbance, mood disturbance, and anxiety"
* reasonCode.text = "Dementia"
* diagnosis.condition = Reference(condition-example-diagnosis-ltc-monthly-uti)
* diagnosis.condition.display = "Dementia"
* hospitalization.admitSource = $admit-source#mp "Medical Practitioner/physician referral"
* hospitalization.admitSource.text = "Medical practitioner"
* hospitalization.dischargeDisposition = $discharge-disposition#oth "Other"
* hospitalization.dischargeDisposition.text = "Other"
* location[0].location.display = "Long-Term Care Facility"
* location[=].location = Reference(location-example-ltc-monthly-nursing-facility)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2025-02-01T16:02:00-05:00"
* location[=].period.end = "2029-02-08T16:02:00-05:00"