Instance: encounter-example-ltc-monthly-pneumonia-1
InstanceOf: QICoreEncounter|6.0.0
Title: "Encounter - Example LTC Monthly Pneumonia 1 - Hospital Admission"
Description: "Encounter - Example LTC Monthly Pneumonia 1 - Hospital Admission"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104251"
* status = #finished
* class = $v3-ActCode#ACUTE "inpatient acute"
* type = $sct#32485007 "Hospital admission (procedure)"
* type.text = "Hospital Admission"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pass1 ACH"
* period.start = "2025-02-01T16:02:00-05:00"
* period.end = "2025-02-08T19:00:00-05:00"
* reasonCode = $icd-10-cm#R53.1 "Weakness"
* reasonCode.text = "Weakness"
* diagnosis.condition = Reference(condition-example-diagnosis-ltc-monthly-pneumonia)
* diagnosis.condition.display = "Pneumonia"
* hospitalization.admitSource = $admit-source#mp "Medical Practitioner/physician referral"
* hospitalization.admitSource.text = "Medical practitioner"
* hospitalization.dischargeDisposition = $discharge-disposition#oth "Other"
* hospitalization.dischargeDisposition.text = "Other"
* location[0].location.display = "Inpatient Ward"
* location[=].location = Reference(location-example-ach-monthly-inpatient)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-01T16:02:00-05:00"
* location[=].period.end = "2024-02-08T16:02:00-05:00"

Instance: encounter-example-ltc-monthly-pneumonia-2
InstanceOf: QICoreEncounter|6.0.0
Title: "Encounter - Example LTC Monthly Pneumonia 2 - Nursing Facility"
Description: "Encounter - Example LTC Monthly Pneumonia 2 - Nursing Facility"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104251"
* status = #in-progress
* class = $v3-ActCode#NONAC "inpatient non-acute"
* type = $sct#18170008 "Subsequent nursing facility visit (procedure)"
* type.text = "Nursing Facility Visit"
* subject = Reference(patient-example-ltc-monthly-pneumonia)
* subject.display = "Pneumonia LTC"
* period.start = "2025-02-08T16:02:00-05:00"
* period.end = "2025-02-11T19:00:00-05:00"
* reasonCode = $icd-10-cm#J18.9 "Pneumonia, unspecified organism"
* reasonCode.text = "Pneumonia"
* diagnosis.condition = Reference(condition-example-diagnosis-ltc-monthly-pneumonia)
* diagnosis.condition.display = "Pneumonia"
* hospitalization.admitSource = $admit-source#hosp-trans "Transferred from other hospital"
* hospitalization.admitSource.text = "Transferred from other hospital"
* hospitalization.dischargeDisposition = $discharge-disposition#oth "Other"
* hospitalization.dischargeDisposition.text = "Other"
* location[0].location.display = "Inpatient Ward"
* location[=].location = Reference(location-example-ltc-monthly-nursing-facility)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-08T16:02:00-05:00"
* location[=].period.end = "2024-02-11T16:02:00-05:00"