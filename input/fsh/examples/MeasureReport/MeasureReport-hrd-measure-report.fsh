Instance: HRDMeasureReport
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - HRD MeasureReport Example"
Description: "This Bundle resource is an example of a Hospital Respiratory Data (HRD) MeasureReport."
Usage: #example
// Basic metadata
* status = $measure-report-status#complete
* type = $measure-report-type#individual
* measure = Canonical(HospitalRespiratoryDataMeasure|1.0.0-ballot)
* date = "2025-03-05T08:15:00-05:00"
// Reporting period
* period.start = "2025-03-05T00:00:00-05:00"
* period.end = "2025-03-05T23:59:59-05:00"
// Reporter and subject
* reporter.reference = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38981" //Reference(MemorialHospitalOrganization)
* reporter.display = "Memorial Hospital"
//* subject = Reference(MemorialHospitalFacility)
* subject.reference = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38983"
* subject.display = "Memorial Hospital Facility"

* extension[scoring].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[scoring].valueCodeableConcept = $measure-scoring#continuous-variable "Continuous Variable"

* extension[location].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataLocation"
* extension[location].valueReference.reference = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38983" //Reference(MemorialHospitalFacility)


// NHSN extensions
/*
* extension[+].url = "http://www.cdc.gov/nshn/us-safr/StructureDefinition/reporting-frequency"
* extension[=].valueCodeableConcept = http://unitsofmeasure.org#d "day"
* extension[+].url = "http://www.cdc.gov/nshn/us-safr/StructureDefinition/emergency-activation"
* extension[=].valueBoolean = false
* extension[+].url = "http://hl7.org/fhir/us/nhsn-bed-measures/StructureDefinition/reporting-timestamp"
* extension[=].valueDateTime = "2025-03-05T08:00:00-05:00"
*/
/*
TODO, will need output with summary

* extension[+].url = "http://hl7.org/fhir/us/nhsn-bed-measures/StructureDefinition/facility-bed-summary"
* extension[=].extension[totalBeds].url = "totalBeds"
* extension[=].extension[totalBeds].valueInteger = 102
* extension[=].extension[occupiedBeds].url = "occupiedBeds"
* extension[=].extension[occupiedBeds].valueInteger = 76
* extension[=].extension[availableBeds].url = "availableBeds"
* extension[=].extension[availableBeds].valueInteger = 26
* extension[=].extension[overallOccupancyRate].url = "overallOccupancyRate"
* extension[=].extension[overallOccupancyRate].valueDecimal = 74.5

*/
* improvementNotation = $MeasureImprovementNotation#increase "Increased score indicates improvement"

///////////// Group numInPtBedsAdult /////////////
* group[+].id = "numInPtBedsAdult-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsAdult "Number Inpatient Adult Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numInPtBedsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1500
* group[=].population[+].id = "numInPtBedsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 1500
* group[=].population[+].id = "numInPtBedsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 500


///////////// Group numInPtBedsPed /////////////
* group[+].id = "numInPtBedsPed-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsPed "Number Inpatient Ped Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numInPtBedsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1500
* group[=].population[+].id = "numInPtBedsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 1500
* group[=].population[+].id = "numInPtBedsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 500


///////////// Group numInPtBedsOcc /////////////
* group[+].id = "numInPtBedsOcc-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOcc "Number Inpatient Occupancy Beds"
* group[=].measureScore.value = 55.56
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numInPtBedsOcc-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1800
* group[=].population[+].id = "numInPtBedsOcc-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 1800
* group[=].population[+].id = "numInPtBedsOcc-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 800


///////////// Group numInPtBedsOccAdult /////////////
* group[+].id = "numInPtBedsOccAdult-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOccAdult "Number Inpatient Occupancy Adult Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numInPtBedsOccAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1200
* group[=].population[+].id = "numInPtBedsOccAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 1200
* group[=].population[+].id = "numInPtBedsOccAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 400


///////////// Group numInPtBedsOccPed /////////////
* group[+].id = "numInPtBedsOccPed-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOccPed "Number Inpatient Occupancy Ped Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numInPtBedsOccPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1200
* group[=].population[+].id = "numInPtBedsOccPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 1200
* group[=].population[+].id = "numInPtBedsOccPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 400


///////////// Group numConfC19HospPatsAdult /////////////
* group[+].id = "numConfC19HospPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfC19HospPatsAdult "Number confirmed Covid-19 adult hospital patients"
* group[=].measureScore.value = 88.89
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfC19HospPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 450
* group[=].population[+].id = "numConfC19HospPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 450
* group[=].population[+].id = "numConfC19HospPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 50


///////////// Group numConfC19HospPatsPed /////////////
* group[+].id = "numConfC19HospPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfC19HospPatsPed "Number confirmed Covid-19 pediatric hospital patients"
* group[=].measureScore.value = 95.24
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfC19HospPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 420
* group[=].population[+].id = "numConfC19HospPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 420
* group[=].population[+].id = "numConfC19HospPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 20


///////////// Group numConfFluHospPatsAdult /////////////
* group[+].id = "numConfFluHospPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfFluHospPatsAdult "Number confirmed Flu adult hospital patients"
* group[=].measureScore.value = 93.02
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfFluHospPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 430
* group[=].population[+].id = "numConfFluHospPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 430
* group[=].population[+].id = "numConfFluHospPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 30


///////////// Group numConfFluHospPatsPed /////////////
* group[+].id = "numConfFluHospPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfFluHospPatsPed "Number confirmed Flu pediatric hospital patients"
* group[=].measureScore.value = 91.95
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfFluHospPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 435
* group[=].population[+].id = "numConfFluHospPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 435
* group[=].population[+].id = "numConfFluHospPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 35


///////////// Group numConfRSVHospPatsAdult /////////////
* group[+].id = "numConfRSVHospPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVHospPatsAdult "Number confirmed RSV adult hospital patients"
* group[=].measureScore.value = 94.12
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfRSVHospPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 425
* group[=].population[+].id = "numConfRSVHospPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 425
* group[=].population[+].id = "numConfRSVHospPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 25


///////////// Group numConfRSVHospPatsPed /////////////
* group[+].id = "numConfRSVHospPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVHospPatsPed "Number confirmed RSV pediatric hospital patients"
* group[=].measureScore.value = 86.58
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfRSVHospPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 462
* group[=].population[+].id = "numConfRSVHospPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 462
* group[=].population[+].id = "numConfRSVHospPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 62


///////////// Group numICUBedsAdult /////////////
* group[+].id = "numICUBedsAdult-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsAdult "Number ICU Adult Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numICUBedsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 150
* group[=].population[+].id = "numICUBedsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 150
* group[=].population[+].id = "numICUBedsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 50


///////////// Group numICUBedsPed /////////////
* group[+].id = "numICUBedsPed-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsPed "Number ICU Ped Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numICUBedsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 150
* group[=].population[+].id = "numICUBedsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 150
* group[=].population[+].id = "numICUBedsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 50


///////////// Group numICUBedsOcc /////////////
* group[+].id = "numICUBedsOcc-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOcc "Number ICU Occupancy Beds"
* group[=].measureScore.value = 62.50
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numICUBedsOcc-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 160
* group[=].population[+].id = "numICUBedsOcc-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 160
* group[=].population[+].id = "numICUBedsOcc-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 60


///////////// Group numICUBedsOccAdult /////////////
* group[+].id = "numICUBedsOccAdult-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOccAdult "Number ICU Occupancy Adult Beds"
* group[=].measureScore.value = 62.50
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numICUBedsOccAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 80
* group[=].population[+].id = "numICUBedsOccAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 80
* group[=].population[+].id = "numICUBedsOccAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 30


///////////// Group numICUBedsOccPed /////////////
* group[+].id = "numICUBedsOccPed-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOccPed "Number ICU Occupancy Pediatric Beds"
* group[=].measureScore.value = 62.50
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numICUBedsOccPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 80
* group[=].population[+].id = "numICUBedsOccPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 80
* group[=].population[+].id = "numICUBedsOccPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 30


///////////// Group numConfC19ICUPatsAdult /////////////
* group[+].id = "numConfC19ICUPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfC19ICUPatsAdult "Number confirmed Covid-19 adult ICU patients"
* group[=].measureScore.value = 71.43
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfC19ICUPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 42
* group[=].population[+].id = "numConfC19ICUPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 42
* group[=].population[+].id = "numConfC19ICUPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 12


///////////// Group numConfC19ICUPatsPed /////////////
* group[+].id = "numConfC19ICUPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfC19ICUPatsPed "Number confirmed Covid-19 pediatric ICU patients"
* group[=].measureScore.value = 93.75
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfC19ICUPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 32
* group[=].population[+].id = "numConfC19ICUPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 32
* group[=].population[+].id = "numConfC19ICUPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 2


///////////// Group numConfFluICUPatsAdult /////////////
* group[+].id = "numConfFluICUPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfFluICUPatsAdult "Number confirmed Flu adult ICU patients"
* group[=].measureScore.value = 90.91
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfFluICUPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 33
* group[=].population[+].id = "numConfFluICUPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 33
* group[=].population[+].id = "numConfFluICUPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 3


///////////// Group numConfFluICUPatsPed /////////////
* group[+].id = "numConfFluICUPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfFluICUPatsPed "Number confirmed Flu pediatric ICU patients"
* group[=].measureScore.value = 85.71
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfFluICUPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 35
* group[=].population[+].id = "numConfFluICUPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 35
* group[=].population[+].id = "numConfFluICUPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 5


///////////// Group numConfRSVICUPatsAdult /////////////
* group[+].id = "numConfRSVICUPatsAdult-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVICUPatsAdult "Number confirmed RSV adult ICU patients"
* group[=].measureScore.value = 83.33
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfRSVICUPatsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "numConfRSVICUPatsAdult-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "numConfRSVICUPatsAdult-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 6


///////////// Group numConfRSVICUPatsPed /////////////
* group[+].id = "numConfRSVICUPatsPed-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVICUPatsPed "Number confirmed RSV pediatric ICU patients"
* group[=].measureScore.value = 76.92
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "numConfRSVICUPatsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 39
* group[=].population[+].id = "numConfRSVICUPatsPed-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 39
* group[=].population[+].id = "numConfRSVICUPatsPed-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 9