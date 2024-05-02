Instance: encounter-example-ach-ach-pass2-inpatient
InstanceOf: AcuteCareHospitalReportingEncounter
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104252b"
* status = #finished
* class = $v3-ActCode#IMP "inpatient encounter"
* type = $sct#32485007 "Hospital admission (procedure)"
* type.text = "Hospital Admission"
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
* period.start = "2024-01-31T22:02:00-05:00"
* period.end = "2024-02-02T16:22:00-05:00"
//* reasonCode = $icd-10-cm#R50.9 "Fever, unspecified"
//* reasonCode.text = "Fever"
/* diagnosis.condition.display = "Hyperglycemia"
* account.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.3.726"
* account.identifier.value = "100066850"
* account.display = "HYPO,EDADD"
*/
* hospitalization.admitSource = $admit-source#emd "From accident/emergency department"
* hospitalization.admitSource.text = "Emergency Department"
* hospitalization.dischargeDisposition = $discharge-disposition#exp "expired"
* hospitalization.dischargeDisposition.text = "Expired"


* location[0].location.display = "ACH Inpatient Hospital Ward"
* location[=].location = Reference(location-example-hypo-encounter-location-ach-inpatient)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-01T01:02:00-05:00"
* location[=].period.end = "2024-02-02T16:22:00-05:00"