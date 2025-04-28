Instance: encounter-example-ach-daily-influenzatherapeutic
InstanceOf: AcuteCareHospitalDailyEventEncounter
Title: "Encounter - ACH Daily Encounter Example Influenza Therapeutic"
Description: "Encounter - Example ACH Daily Encounter Influenza Therapeutic"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "123456789987"
* status = #finished
* status.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-element-value-extension"
* status.extension.valueString = "TRIAGED"
* class = $v3-ActCode#ACUTE "Inpatient Acute"
* type = $sct#4525004 "Emergency department patient visit"
* type.text = "Emergency department patient visit"
* subject = Reference(patient-example-ach-daily-influenzatherapeutic)
* subject.display = "ACHDaily, InfluenzaTherapeutic"
* period.start = "2024-01-01T08:00:00Z"
* period.end = "2024-01-04T12:00:00Z"
* reasonCode = $sct#274640006 "Fever with chills"
* reasonCode.text = "Fever with chills"
* hospitalization.admitSource = $admit-source#gp "General Practitioner referral"
* hospitalization.admitSource.text = "Direct admission from doctor's office (in same system)"
* hospitalization.dischargeDisposition = $discharge-disposition#home "Home"
* hospitalization.dischargeDisposition.text = "Home"
//* location.location.display = "Emergency Department"
* location[0].location.display = "EMERGENCY - PAVILION"
* location[=].location = Reference(location-example-hypo-emergency)
* location.period.start = "2024-01-14T08:00:00Z"
* location.period.end = "2024-01-22T12:00:00Z"