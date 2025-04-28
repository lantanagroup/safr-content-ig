Instance: measurereport-example-ach-daily-rsvlabbtg
InstanceOf: MeasureReport
Title: "MeasureReport - Example Individual ACH Daily RSV Lab BTG"
Description: "MeasureReport - Example Individual ACH Daily RSV Lab BTG"
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
* extension[=].valueReference = Reference(patient-example-ach-daily-rsvlabbtg)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-encounter"
* extension[=].valueReference = Reference(encounter-example-ach-daily-rsvlabbtg)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-coverage"
* extension[=].valueReference = Reference(coverage-example-ach-daily-rsvlabbtg)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-condition"
* extension[=].valueReference = Reference(condition-example-diagnosis-ach-daily-rsvlabbtg)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medadmin-example-ach-daily-rsvlabbtg-1)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-ach-daily-rsvlabbtg-1)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medadmin-example-ach-daily-rsvlabbtg-2)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-ach-daily-rsvlabbtg-2)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-observation-lab-category"
* extension[=].valueReference = Reference(lab-observation-example-ach-daily-rsvlabbtg)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-service-request"
* extension[=].valueReference = Reference(servicerequest-example-ach-daily-rsvlabbtg-rsv)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-specimen"
* extension[=].valueReference = Reference(specimen-example-ach-daily-rsvlabbtg)
* status = #complete
* type = #individual
* measure = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNRespiratoryPathogensSurveillanceInitialPopulation|1.0.0-cibuild"
* subject = Reference(patient-example-ach-daily-rsvlabbtg)
* date = "2024-01-06T21:04:29.481+00:00"
* reporter = Reference(organization-example-submitting-organization)
* period.start = "2024-01-05T00:00:00.000+00:00"
* period.end = "2024-01-06T00:00:00.000+00:00"
* improvementNotation = $measure-improvement-notation#increase
//* group.measureScore.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
//* group.measureScore.extension.valueCode = #unknown
//* group.population.extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.population.description"
//* group.population.extension.valueString = "All inpatient encounters (including ED/Observation visits that end within one hour of the start of the inpatient encounter) during the measurement period for patients of all ages in which at least one diabetic medication was ordered or administered during the encounter."
* group.population.code = $measure-population#initial-population "Initial Population"
* group.population.count = 1
* evaluatedResource[0] = Reference(patient-example-ach-daily-rsvlabbtg)
* evaluatedResource[0] = Reference(encounter-example-ach-daily-rsvlabbtg)
* evaluatedResource[0] = Reference(coverage-example-ach-daily-rsvlabbtg)
* evaluatedResource[0] = Reference(condition-example-ach-daily-rsvlabbtg)
* evaluatedResource[0] = Reference(medadmin-example-ach-daily-rsvlabbtg-1)
* evaluatedResource[0] = Reference(medicationrequest-example-ach-daily-rsvlabbtg-1)
* evaluatedResource[0] = Reference(medadmin-example-ach-daily-rsvlabbtg-2)
* evaluatedResource[0] = Reference(medicationrequest-example-ach-daily-rsvlabbtg-2)
* evaluatedResource[0] = Reference(lab-observation-example-ach-daily-rsvlabbtg)
* evaluatedResource[0] = Reference(servicerequest-example-ach-daily-rsvlabbtg-rsv)
* evaluatedResource[0] = Reference(specimen-example-ach-daily-rsvlabbtg)