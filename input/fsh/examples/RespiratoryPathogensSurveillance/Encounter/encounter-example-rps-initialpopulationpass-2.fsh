Instance: encounter-example-rps-initialpopulationpass-2
InstanceOf: RespiratoryPathogensSurveillanceEventEncounter
Title: "Encounter - RPS Encounter Example Initial Population Pass 2"
Description: "Encounter - Example RPS Encounter Initial Population Pass 2"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "123456789987"
* status = #finished
* status.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-element-value-extension"
* status.extension.valueString = "TRIAGED"
* class = $v3-ActCode#NONAC "Inpatient Non-Acute"
* type = $sct#4525004 "Emergency department patient visit"
* type.text = "Emergency department patient visit"
* subject.reference = "Patient/patient-example-rps-initialpopulationpass"
* subject.display = "RPS, InitialPopulationPass"
* period.start = "2024-01-14T08:00:00Z"
* period.end = "2024-01-22T12:00:00Z"
* reasonCode = $sct#230145002 "Difficulty breathing"
* reasonCode.text = "Difficulty breathing"
* hospitalization.admitSource = $admit-source#other "Other"
* hospitalization.admitSource.text = "Direct admit"
* hospitalization.dischargeDisposition = $discharge-disposition#snf "Skilled nursing facility"
* hospitalization.dischargeDisposition.text = "To skilled nursing unit"
* location.location.display = "UH Adult Emergency Department"
* location.period.start = "2024-01-01T18:52:00Z"
* location.period.end = "2024-01-17T16:09:00Z"