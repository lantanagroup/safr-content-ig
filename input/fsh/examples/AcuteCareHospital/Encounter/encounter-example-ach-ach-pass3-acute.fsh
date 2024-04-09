Instance: encounter-example-ach-ach-pass3-acute
InstanceOf: AcuteCareHospitalReportingEncounter
Usage: #inline
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005104253a"
* status = #finished
* class = $v3-ActCode#ACUTE "inpatient acute"
* type = $sct#453701000124103 "In-person encounter"
* type.text = "Critical care visit"
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
* period.start = "2024-02-02T16:43:00-05:00"
* period.end = "2024-02-03T19:58:00-05:00"
//* reasonCode = $icd-10-cm#R19.7 "Diarrhea, unspecified"
//* reasonCode.text = "Diarrhea"
/* diagnosis.condition.display = "Hyperglycemia"
* account.identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.3.726"
* account.identifier.value = "100066850"
* account.display = "HYPO,EDADD"
*/
* hospitalization.admitSource = $admit-source#other "Other"
* hospitalization.admitSource.text = "From Short Stay"
* hospitalization.dischargeDisposition = $discharge-disposition#home "Home"
* hospitalization.dischargeDisposition.text = "Home"


* location[0].location.display = "ACH Medical Critical Care"
* location[=].location = Reference(location-example-hypo-encounter-location-ach-crit)
* location[=].physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#wa "Ward"
* location[=].period.start = "2024-02-02T16:43:00-05:00"
* location[=].period.end = "2024-03-02T19:58:00-05:00"