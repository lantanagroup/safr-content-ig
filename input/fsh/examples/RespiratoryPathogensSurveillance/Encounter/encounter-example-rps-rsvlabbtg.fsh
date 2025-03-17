Instance: encounter-example-rps-rsvlabbtg
InstanceOf: RespiratoryPathogensSurveillanceEventEncounter
Title: "Encounter - RPS Daily Encounter Example RSV Lab BTG"
Description: "Encounter - Example RPS Daily Encounter RSV Lab BTG"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "123456789987"
* status = #finished
* status.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-element-value-extension"
* status.extension.valueString = "TRIAGED"
* class = $v3-ActCode#SS "Short Stay"
* type = $sct#4525004 "Emergency department patient visit"
* type.text = "Emergency department patient visit"
* subject.reference = "Patient/patient-example-rps-rsvlabbtg"
* subject.display = "RPS, rsvlabbtg"
* period.start = "2024-01-01T08:00:00Z"
* period.end = "2024-01-02T06:00:00Z"
* reasonCode = $sct#162397003 "Throat pain"
* reasonCode.text = "Sore throat"
* hospitalization.admitSource = $admit-source#gp "General Practitioner referral"
* hospitalization.admitSource.text = "Pediatrician's office"
* hospitalization.dischargeDisposition = $discharge-disposition#home "Home"
* hospitalization.dischargeDisposition.text = "Home"
* location.location.display = "Emergency Department"
* location.period.start = "2024-01-14T08:00:00Z"
* location.period.end = "2024-01-22T12:00:00Z"