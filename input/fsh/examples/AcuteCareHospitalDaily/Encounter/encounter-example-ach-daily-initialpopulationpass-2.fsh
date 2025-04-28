Instance: encounter-example-ach-daily-initialpopulationpass-2
InstanceOf: AcuteCareHospitalDailyEventEncounter
Title: "Encounter - ACH Daily Encounter Example Initial Population Pass 2"
Description: "Encounter - Example ACH Daily Encounter Initial Population Pass 2"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "123456789987"
* status = #finished
* status.extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-element-value-extension"
* status.extension.valueString = "TRIAGED"
* class = $v3-ActCode#IMP "inpatient encounter"
* type = $sct#24882007 "Medical consultation on hospital inpatient"
* type.text = "Medical consultation on hospital inpatient"
* subject.reference = "Patient/patient-example-ach-daily-initialpopulationpass"
* subject.display = "ACHDaily, InitialPopulationPass"
* period.start = "2024-01-14T08:00:00Z"
* period.end = "2024-01-22T12:00:00Z"
* reasonCode = $sct#230145002 "Difficulty breathing"
* reasonCode.text = "Difficulty breathing"
* hospitalization.admitSource = $admit-source#other "Other"
* hospitalization.admitSource.text = "Direct admit"
* hospitalization.dischargeDisposition = $discharge-disposition#snf "Skilled nursing facility"
* hospitalization.dischargeDisposition.text = "To skilled nursing unit"
//* location.location.display = "UH Adult Inpatient Department"
* location.location.display = "RPS Daily Inpatient Hospital Ward"
* location.location = Reference(location-example-rps-inpatient)
* location.period.start = "2024-01-14T09:00:00Z"
* location.period.end = "2024-01-22T12:00:00Z"