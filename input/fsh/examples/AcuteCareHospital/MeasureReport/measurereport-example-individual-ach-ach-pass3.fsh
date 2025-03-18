Instance: measurereport-example-individual-ach-ach-pass3
InstanceOf: MeasureReport
Title: "MeasureReport - Example Individual ACH Monthly Pass3 - C. diff"
Description: "MeasureReport - Example Individual ACH Monthly Pass3 - Healthcare facility-onset, antibiotic-treated Clostridioides difficile infection / Hospital-onset bacteremia and fungemia (CDI/HOB)"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/indv-measurereport-deqm"

* identifier.system = "http://example.org/fhir/measurereport/id"
* identifier.value = "123456789-pass3"
//* text.status = #extensions
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative: MeasureReport</b><a name=\"measurereport-example-individual-measurereport-hypo\"> </a></p><div style=\"display: inline-block; background-color: #d9e0e7; padding: 6px; margin: 4px; border: 1px solid #8da1b4; border-radius: 5px; line-height: 60%\"><p style=\"margin-bottom: 0px\">Resource MeasureReport &quot;measurereport-example-individual-measurereport-hypo&quot; </p><p style=\"margin-bottom: 0px\">Profile: <a href=\"http://hl7.org/fhir/us/davinci-deqm/STU3.1/StructureDefinition-indv-measurereport-deqm.html\">DEQM Individual MeasureReport Profile</a></p></div><p><b>DEQM Measure Scoring Extension</b>: Cohort <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.0.0/CodeSystem-measure-scoring.html\">MeasureScoring</a>#cohort)</span></p><p><b>Measure Report Population Description (R5 surrogate extension)</b>: The Hypoglycemia Initial Population includes all inpatient encounters (including ED/Observation visits that end within one hour of the start of the inpatient encounter) during the measurement period for patients of all ages in which at least one diabetic medication was ordered or administered during the encounter.</p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo1.html\">Observation/observation-example-hypo-lab-hypo1</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Encounter-encounter-example-hypo-hypo.html\">Encounter/encounter-example-hypo-hypo</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo2.html\">Observation/observation-example-hypo-lab-hypo2</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo3.html\">Observation/observation-example-hypo-lab-hypo3</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo4.html\">Observation/observation-example-hypo-lab-hypo4</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Medication-medication-example-hypo-hypo1.html\">Medication/medication-example-hypo-hypo1</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Patient-patient-example-hypo.html\">Patient/patient-example-hypo</a> &quot; HYPO&quot;</p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Medication-medication-example-hypo-hypo2.html\">Medication/medication-example-hypo-hypo2</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"MedicationRequest-medicationrequest-example-hypo-hypo1.html\">MedicationRequest/medicationrequest-example-hypo-hypo1</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo5.html\">Observation/observation-example-hypo-lab-hypo5</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"MedicationRequest-medicationrequest-example-hypo-hypo2.html\">MedicationRequest/medicationrequest-example-hypo-hypo2</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo6.html\">Observation/observation-example-hypo-lab-hypo6</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo7.html\">Observation/observation-example-hypo-lab-hypo7</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Condition-condition-example-diagnosis-hypo1.html\">Condition/condition-example-diagnosis-hypo1</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Medication-medication-example-hypo-hypo3.html\">Medication/medication-example-hypo-hypo3</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"MedicationRequest-medicationrequest-example-hypo-hypo3.html\">MedicationRequest/medicationrequest-example-hypo-hypo3</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Observation-observation-example-hypo-lab-hypo8.html\">Observation/observation-example-hypo-lab-hypo8</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"MedicationRequest-medicationrequest-example-hypo-hypo4.html\">MedicationRequest/medicationrequest-example-hypo-hypo4</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Medication-medication-example-hypo-hypo4.html\">Medication/medication-example-hypo-hypo4</a></p><p><b>Measure Report Supplemental Data Element Reference (R5 surrogate extension)</b>: <a href=\"Condition-condition-example-diagnosis-hypo2.html\">Condition/condition-example-diagnosis-hypo2</a></p><p><b>status</b>: complete</p><p><b>type</b>: individual</p><p><b>measure</b>: <a href=\"http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation\">http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0</a></p><p><b>subject</b>: <a href=\"Patient-patient-example-hypo.html\">Patient/patient-example-hypo</a> &quot; HYPO&quot;</p><p><b>date</b>: 2022-11-15 21:03:38+0000</p><p><b>reporter</b>: <a href=\"Organization-organization-example-submitting-organization.html\">Organization/organization-example-submitting-organization</a> &quot;Example NHSN Submitter&quot;</p><p><b>period</b>: 2022-08-01 00:00:00+0000 --&gt; 2022-08-31 23:59:59+0000</p><p><b>improvementNotation</b>: Increased score indicates improvement <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.0.0/CodeSystem-measure-improvement-notation.html\">MeasureImprovementNotation</a>#increase)</span></p><blockquote><p><b>group</b></p><h3>Populations</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Extension</b></td><td><b>Code</b></td><td><b>Count</b></td></tr><tr><td style=\"display: none\">*</td><td/><td>Initial Population <span style=\"background: LightGoldenRodYellow; margin: 4px; border: 1px solid khaki\"> (<a href=\"http://terminology.hl7.org/5.0.0/CodeSystem-measure-population.html\">MeasurePopulationType</a>#initial-population)</span></td><td>1</td></tr></table><p><b>measureScore</b>: </p></blockquote><p><b>evaluatedResource</b>: </p><ul><li><a href=\"Observation-observation-example-hypo-lab-hypo1.html\">Observation/observation-example-hypo-lab-hypo1</a></li><li><a href=\"Encounter-encounter-example-hypo-hypo.html\">Encounter/encounter-example-hypo-hypo</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo2.html\">Observation/observation-example-hypo-lab-hypo2</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo3.html\">Observation/observation-example-hypo-lab-hypo3</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo4.html\">Observation/observation-example-hypo-lab-hypo4</a></li><li><a href=\"Medication-medication-example-hypo-hypo1.html\">Medication/medication-example-hypo-hypo1</a></li><li><a href=\"Patient-patient-example-hypo.html\">Patient/patient-example-hypo</a> &quot; HYPO&quot;</li><li><a href=\"Medication-medication-example-hypo-hypo2.html\">Medication/medication-example-hypo-hypo2</a></li><li><a href=\"MedicationRequest-medicationrequest-example-hypo-hypo1.html\">MedicationRequest/medicationrequest-example-hypo-hypo1</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo5.html\">Observation/observation-example-hypo-lab-hypo5</a></li><li><a href=\"MedicationRequest-medicationrequest-example-hypo-hypo2.html\">MedicationRequest/medicationrequest-example-hypo-hypo2</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo6.html\">Observation/observation-example-hypo-lab-hypo6</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo7.html\">Observation/observation-example-hypo-lab-hypo7</a></li><li><a href=\"Condition-condition-example-diagnosis-hypo1.html\">Condition/condition-example-diagnosis-hypo1</a></li><li><a href=\"Medication-medication-example-hypo-hypo3.html\">Medication/medication-example-hypo-hypo3</a></li><li><a href=\"MedicationRequest-medicationrequest-example-hypo-hypo3.html\">MedicationRequest/medicationrequest-example-hypo-hypo3</a></li><li><a href=\"Observation-observation-example-hypo-lab-hypo8.html\">Observation/observation-example-hypo-lab-hypo8</a></li><li><a href=\"MedicationRequest-medicationrequest-example-hypo-hypo4.html\">MedicationRequest/medicationrequest-example-hypo-hypo4</a></li><li><a href=\"Medication-medication-example-hypo-hypo4.html\">Medication/medication-example-hypo-hypo4</a></li><li><a href=\"Condition-condition-example-diagnosis-hypo2.html\">Condition/condition-example-diagnosis-hypo2</a></li></ul></div>"
* extension[0].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[=].valueCodeableConcept = $measure-scoring#cohort
//* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.population.description"
//* extension[=].valueString = "The Acute Care Hospital Initial Population includes all encounters for patients of any age in an ED, observation, or inpatient location or all encounters for patients of any age with an ED, observation, inpatient, or short stay status during the measurement period."
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-condition"
* extension[=].valueReference = Reference(condition-example-diagnosis-ach-pass3-problem)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-condition"
* extension[=].valueReference = Reference(condition-example-diagnosis-ach-pass3)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-coverage"
* extension[=].valueReference = Reference(coverage-example-ach-pass3)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-device"
* extension[=].valueReference = Reference(device-example-ach-ach-pass3-ivcs-pump)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-encounter"
* extension[=].valueReference = Reference(encounter-example-ach-ach-pass3-acute)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-encounter"
* extension[=].valueReference = Reference(encounter-example-ach-ach-pass3-short-stay)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-ach-pass3-enoxaparin)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-ach-pass3-metronidazole-1)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-ach-pass3-metronidazole-2)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-administration"
* extension[=].valueReference = Reference(medicationadministration-example-ach-pass3-metronidazole-3)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-ach-pass3-cipro)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-ach-pass3-enoxaparin)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-medication-request"
* extension[=].valueReference = Reference(medicationrequest-example-ach-pass3-metronidazole)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-observation-lab-category"
* extension[=].valueReference = Reference(observation-example-ach-pass3-cdiff)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-observation-vital-signs"
* extension[=].valueReference = Reference(observation-example-ach-pass3-vitals-height)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-observation-vital-signs"
* extension[=].valueReference = Reference(observation-example-ach-pass3-vitals-weight)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-minimal-patient"
* extension[=].valueReference = Reference(patient-example-ach-ach-pass3)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-procedure"
* extension[=].valueReference = Reference(procedure-example-ach-ach-pass3-transfusion)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-servicerequest"
* extension[=].valueReference = Reference(servicerequest-example-ach-ach-pass3-cdiff)
* extension[+].url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-MeasureReport.supplementalDataElement.reference"
* extension[=].valueReference.extension.url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-criteriaReference"
* extension[=].valueReference.extension.valueString = "sde-specimen"
* extension[=].valueReference = Reference(specimen-example-ach-ach-pass3-stool)


* status = #complete
* type = #individual
* measure = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/Measure/NHSNdQMAcuteCareHospitalInitialPopulation|1.0.0-cibuild"
* subject = Reference(patient-example-ach-ach-pass1)
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
* evaluatedResource[0] = Reference(condition-example-diagnosis-ach-pass3-problem)
* evaluatedResource[0] = Reference(condition-example-diagnosis-ach-pass3)
* evaluatedResource[0] = Reference(coverage-example-ach-pass3)
* evaluatedResource[0] = Reference(device-example-ach-ach-pass3-ivcs-pump)
* evaluatedResource[0] = Reference(encounter-example-ach-ach-pass3-acute)
* evaluatedResource[0] = Reference(encounter-example-ach-ach-pass3-short-stay)
* evaluatedResource[0] = Reference(medicationadministration-example-ach-pass3-enoxaparin)
* evaluatedResource[0] = Reference(medicationadministration-example-ach-pass3-metronidazole-1)
* evaluatedResource[0] = Reference(medicationadministration-example-ach-pass3-metronidazole-2)
* evaluatedResource[0] = Reference(medicationadministration-example-ach-pass3-metronidazole-3)
* evaluatedResource[0] = Reference(medicationrequest-example-ach-pass3-cipro)
* evaluatedResource[0] = Reference(medicationrequest-example-ach-pass3-enoxaparin)
* evaluatedResource[0] = Reference(medicationrequest-example-ach-pass3-metronidazole)
* evaluatedResource[0] = Reference(observation-example-ach-pass3-cdiff)
* evaluatedResource[0] = Reference(observation-example-ach-pass3-vitals-height)
* evaluatedResource[0] = Reference(observation-example-ach-pass3-vitals-weight)
* evaluatedResource[0] = Reference(patient-example-ach-ach-pass3)
* evaluatedResource[0] = Reference(procedure-example-ach-ach-pass3-transfusion)
* evaluatedResource[0] = Reference(servicerequest-example-ach-ach-pass3-cdiff)
* evaluatedResource[0] = Reference(specimen-example-ach-ach-pass3-stool)


