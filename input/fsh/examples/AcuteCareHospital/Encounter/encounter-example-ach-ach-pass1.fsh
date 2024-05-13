Instance: encounter-example-ach-ach-pass1
InstanceOf: AcuteCareHospitalReportingEncounter
Title: "Encounter - Example ACH Pass1 - Inpatient"
Description: "Encounter - Example ACH Pass1 - Hospital Admission"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104251"
* status = #in-progress
* class = $v3-ActCode#ACUTE "inpatient acute"
* type = $sct#32485007 "Hospital admission (procedure)"
* type.text = "Hospital Admission"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
/*
* participant[0].type = $v3-ParticipationType#ADM "admitter"
* participant[=].type.text = "admitter"
* participant[=].individual.type = "Practitioner"
* participant[=].individual.display = "Faculty Physician Um_Cln, MD"
* participant[+].type = $v3-ParticipationType#DIS "discharger"
* participant[=].type.text = "discharger"
* participant[=].individual.type = "Practitioner"
* participant[=].individual.display = "Faculty Physician Um_Cln, MD"
* participant[+].type = $v3-ParticipationType#ATND "attender"
* participant[=].type.text = "attender"
* participant[=].period.start = "2022-08-17T16:59:38Z"
* participant[=].period.end = "2022-08-22T19:09:00Z"
* participant[=].individual.type = "Practitioner"
* participant[=].individual.display = "Faculty Physician Um_Cln, MD"
*/
* period.start = "2024-02-01T16:02:00-05:00"
* period.end = "2024-02-04T19:00:00-05:00"
* reasonCode = $icd-10-cm#R50.9 "Fever, unspecified"
* reasonCode.text = "Fever"
* diagnosis.condition = Reference(condition-example-diagnosis-ach-pass1)
* diagnosis.condition.display = "Thrombophlebitis"
/* account.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.3.726"
* account.identifier.value = "100066850"
* account.display = "HYPO,EDADD"
*/
* hospitalization.admitSource = $admit-source#born "Born in hospital"
* hospitalization.admitSource.text = "Born in hospital"
* hospitalization.dischargeDisposition = $discharge-disposition#oth "Other"
* hospitalization.dischargeDisposition.text = "Other"


* location[0].location.display = "ACH Neonatal critical care"
* location[=].location = Reference(location-example-ach-nicu-level-iii)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-01T16:02:00-05:00"
* location[=].period.end = "2024-02-02T16:02:00-05:00"