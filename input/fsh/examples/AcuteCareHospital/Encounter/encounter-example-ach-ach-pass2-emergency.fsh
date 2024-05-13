Instance: encounter-example-ach-ach-pass2-emergency
InstanceOf: AcuteCareHospitalReportingEncounter
Title: "Encounter - Example ACH Pass2 - Emergency"
Description: "Encounter - Example ACH Pass2 - Emergency department visit"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104252a"
* status = #triaged
* class = $v3-ActCode#EMER "emergency"
* type = $sct#4525004 "Emergency department patient visit"
* type.text = "Emergency department patient visit"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
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
* period.start = "2024-01-31T02:35:00-05:00"
* period.end = "2024-01-31T22:02:00-05:00"
* reasonCode = $icd-10-cm#M79.661 "Pain in right lower leg"
* reasonCode.text = "Leg pain, lower right"
* diagnosis.condition = Reference(condition-example-diagnosis-ach-pass2)
* diagnosis.condition.display = "Thrombophlebitis"
/* account.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.3.726"
* account.identifier.value = "100066850"
* account.display = "HYPO,EDADD"
*/
* hospitalization.admitSource = $admit-source#other "Other"
* hospitalization.admitSource.text = "Walk-in"
/* hospitalization.dischargeDisposition = $discharge-disposition#snf "Skilled nursing facility"
* hospitalization.dischargeDisposition.text = "Skilled nursing facility"
*/

* location[0].location.display = "ACH Emergency Department"
* location[=].location = Reference(location-example-ach-emergency)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-01-31T02:35:00-05:00"
* location[=].period.end = "2024-02-01T01:02:00-05:00"