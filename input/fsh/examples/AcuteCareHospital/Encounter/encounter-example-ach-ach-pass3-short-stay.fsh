Instance: encounter-example-ach-ach-pass3-short-stay
InstanceOf: AcuteCareHospitalReportingEncounter
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104253a"
* status = #in-progress
* class = $v3-ActCode#SS "short stay"
* type = $sct#8715000 "Hospital admission, elective (procedure)"
* type.text = "Hospital Admission, Elective Procedure"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
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
* period.start = "2024-02-01T14:12:00-05:00"
* period.end = "2024-02-02T16:43:00-05:00"
* reasonCode = $icd-10-cm#R19.7 "Diarrhea, unspecified"
* reasonCode.text = "Diarrhea"
* diagnosis.condition = Reference(condition-example-diagnosis-ach-pass3)
* diagnosis.condition.display = "Enterocolitis due to Clostridium difficile"
/* account.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.3.726"
* account.identifier.value = "100066850"
* account.display = "HYPO,EDADD"
*/
* hospitalization.admitSource = $admit-source#outp "From outpatient department"
* hospitalization.admitSource.text = "Outpatient"
/* hospitalization.dischargeDisposition = $discharge-disposition#snf "Skilled nursing facility"
* hospitalization.dischargeDisposition.text = "Skilled nursing facility"
*/

* location[0].location.display = "ACH Medical-Surgical Ward"
* location[=].location = Reference(location-example-hypo-encounter-location-ach-medsurg)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-01T14:12:00-05:00"
* location[=].period.end = "2024-02-02T16:43:00-05:00"