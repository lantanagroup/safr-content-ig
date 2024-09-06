Instance: measurereport-example-rps-initialpopulationpass
InstanceOf: MeasureReport
Title: "MeasureReport - Example Individual RPS Initial Population Pass"
Description: "MeasureReport - Example Individual RPS Initial Population Pass"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/indv-measurereport-deqm"
* identifier.system = "http://example.org/fhir/measurereport/id"
* identifier.value = "123456789-pass1"
* extension[0].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[=].valueCodeableConcept = $measure-scoring#cohort
//* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.population.description"
//* extension[=].valueString = "The RPS Initial Population includes all encounters for patients of any age in an ED, observation, or inpatient location or all encounters for patients of any age with an ED, observation, inpatient, or short stay status during the measurement period."
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-minimal-patient"
* extension[=].valueReference = Reference(patient-example-rps-initialpopulationpass)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-encounter"
* extension[=].valueReference = Reference(encounter-example-rps-initialpopulationpass-1)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-encounter"
* extension[=].valueReference = Reference(encounter-example-rps-initialpopulationpass-2)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-coverage"
* extension[=].valueReference = Reference(coverage-example-rps-initialpopulationpass)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-condition"
* extension[=].valueReference = Reference(condition-example-diagnosis-rps-initialpopulationpass)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-rps-initialpopulationpass-1)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-rps-initialpopulationpass)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-rps-initialpopulationpass-2)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-observation-lab-category"
* extension[=].valueReference = Reference(lab-observation-example-rps-initialpopulationpass)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-service-request"
* extension[=].valueReference = Reference(servicerequest-example-rps-initialpopulationpass-covid)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-specimen"
* extension[=].valueReference = Reference(specimen-example-rps-initialpopulationpass)
* status = #complete
* type = #individual
* measure = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0-cibuild"
* subject = Reference(patient-example-rps-initialpopulationpass)
* date = "2024-02-05T21:04:29.481+00:00"
* reporter = Reference(organization-example-submitting-organization)
* period.start = "2024-01-05T00:00:00.000+00:00"
* period.end = "2024-02-04T00:00:00.000+00:00"
* improvementNotation = $measure-improvement-notation#increase
//* group.measureScore.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
//* group.measureScore.extension.valueCode = #unknown
//* group.population.extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.population.description"
//* group.population.extension.valueString = "All inpatient encounters (including ED/Observation visits that end within one hour of the start of the inpatient encounter) during the measurement period for patients of all ages in which at least one diabetic medication was ordered or administered during the encounter."
* group.population.code = $measure-population#initial-population "Initial Population"
* group.population.count = 1
* evaluatedResource[0] = Reference(patient-example-rps-initialpopulationpass)
* evaluatedResource[0] = Reference(encounter-example-rps-initialpopulationpass-1)
* evaluatedResource[0] = Reference(encounter-example-rps-initialpopulationpass-2)
* evaluatedResource[0] = Reference(coverage-example-rps-initialpopulationpass)
* evaluatedResource[0] = Reference(condition-example-rps-initialpopulationpass)
* evaluatedResource[0] = Reference(medicationadministration-example-rps-initialpopulationpass-1)
* evaluatedResource[0] = Reference(medicationrequest-example-rps-initialpopulationpass-1)
* evaluatedResource[0] = Reference(medicationadministration-example-rps-initialpopulationpass-2)
* evaluatedResource[0] = Reference(medicationrequest-example-rps-initialpopulationpass-2)
* evaluatedResource[0] = Reference(lab-observation-example-rps-initialpopulationpass)
* evaluatedResource[0] = Reference(servicerequest-example-rps-initialpopulationpass-covid)
* evaluatedResource[0] = Reference(specimen-example-rps-initialpopulationpass)