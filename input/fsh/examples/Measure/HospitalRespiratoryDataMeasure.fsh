
Instance: HRDMeasureBundle
InstanceOf: USSafrMeasureBundle
Title: "Bundle - HRD Measure Bundle Example"
Description: "This Bundle resource is an example of a Hospital Respiratory Data (HRD) Measure Bundle."
Usage: #example
* type = #collection
* entry[measure][+].fullUrl = "http://example.org/fhir/Measure/HospitalRespiratoryDataMeasure"
* entry[measure][=].resource = HospitalRespiratoryDataMeasure



Instance: HospitalRespiratoryDataMeasure
InstanceOf: CQFMContinuousVariableMeasure|4.0.0
Title: "Measure - HRD Measure Example"
Description: "Example of a Hospital Respiratory Disease (HRD) Measure for NHSN reporting."
Usage: #example
* extension[+].url = "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/cqfm-populationBasis"
* extension[=].valueCode = #boolean
* url = "http://hl7.org/fhir/us/us/safr/Measure/HospitalRespiratoryDataMeasure"
* version = "1.0.0"
* name = "HospitalRespiratoryDataMeasure"
* title = "Measure - HRD Measure Example"
* status = #draft
* experimental = true
* date = "2024-12-14T17:37:47-04:00"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 International / Public Health"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "Example of a Hospital Respiratory Disease (HRD) Measure for NHSN reporting."
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* library = Canonical(HRDMeasureLibrary)
* scoring = $measure-scoring#continuous-variable
//* type = http://terminology.hl7.org/CodeSystem/measure-type#structure "Structure"
* type = $MeasureTypeCS#structure "Structure"
* improvementNotation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase "Increased score indicates improvement"



///////////// Group numInPtBedsAdult /////////////
* group[+].id = "numInPtBedsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsAdult "Number Inpatient Adult Beds"
* group[=].description = "Number Inpatient Adult Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numInPtBedsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numInPtBedsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBeds"
* group[=].population[measureObservation].id = "numInPtBedsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number Inpatient Adult Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numInPtBedsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numInPtBedsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numInPtBedsPed /////////////
* group[+].id = "numInPtBedsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsPed "Number Inpatient Ped Beds"
* group[=].description = "Number Inpatient Ped Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numInPtBedsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numInPtBedsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBeds"
* group[=].population[measureObservation].id = "numInPtBedsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number Inpatient Ped Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numInPtBedsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numInPtBedsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numInPtBedsOcc /////////////
* group[+].id = "numInPtBedsOcc-hrd-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOcc "Number Inpatient Occupancy Beds"
* group[=].description = "Number Inpatient Occupancy Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numInPtBedsOcc-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numInPtBedsOcc-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBeds"
* group[=].population[measureObservation].id = "numInPtBedsOcc-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number Inpatient Occupancy Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numInPtBedsOcc"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numInPtBedsOcc-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numInPtBedsOccAdult /////////////
* group[+].id = "numInPtBedsOccAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOccAdult "Number Inpatient Occupancy Adult Beds"
* group[=].description = "Number Inpatient Occupancy Adult Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numInPtBedsOccAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccInitialPopulation"
* group[=].population[measurePopulation].id = "numInPtBedsOccAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOcc"
* group[=].population[measureObservation].id = "numInPtBedsOccAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number Inpatient Occupancy Adult Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numInPtBedsOccAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numInPtBedsOccAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numInPtBedsOccPed /////////////
* group[+].id = "numInPtBedsOccPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numInPtBedsOccPed "Number Inpatient Occupancy Ped Beds"
* group[=].description = "Number Inpatient Occupancy Ped Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numInPtBedsOccPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccInitialPopulation"
* group[=].population[measurePopulation].id = "numInPtBedsOccPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOcc"
* group[=].population[measureObservation].id = "numInPtBedsOccPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number Inpatient Occupancy Ped Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numInPtBedsOccPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numInPtBedsOccPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfC19HospPatsAdult /////////////
* group[+].id = "numConfC19HospPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfC19HospPatsAdult "Number confirmed Covid-19 adult hospital patients"
* group[=].description = "numConfC19HospPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfC19HospPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfC19HospPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccAdult"
* group[=].population[measureObservation].id = "numConfC19HospPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Covid-19 adult hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfC19HospPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfC19HospPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfC19HospPatsPed /////////////
* group[+].id = "numConfC19HospPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfC19HospPatsPed "Number confirmed Covid-19 pediatric hospital patients"
* group[=].description = "numConfC19HospPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfC19HospPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Ped Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfC19HospPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Ped Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccPed"
* group[=].population[measureObservation].id = "numConfC19HospPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Covid-19 pediatric hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfC19HospPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfC19HospPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfFluHospPatsAdult /////////////
* group[+].id = "numConfFluHospPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfFluHospPatsAdult "Number confirmed Flu adult hospital patients"
* group[=].description = "numConfFluHospPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfFluHospPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfFluHospPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccAdult"
* group[=].population[measureObservation].id = "numConfFluHospPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Flu adult hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfFluHospPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfFluHospPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfFluHospPatsPed /////////////
* group[+].id = "numConfFluHospPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfFluHospPatsPed "Number confirmed Flu pediatric hospital patients"
* group[=].description = "numConfFluHospPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfFluHospPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Ped Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfFluHospPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Ped Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccPed"
* group[=].population[measureObservation].id = "numConfFluHospPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Flu pediatric hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfFluHospPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfFluHospPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfRSVHospPatsAdult /////////////
* group[+].id = "numConfRSVHospPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVHospPatsAdult "Number confirmed RSV adult hospital patients"
* group[=].description = "numConfRSVHospPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfRSVHospPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfRSVHospPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccAdult"
* group[=].population[measureObservation].id = "numConfRSVHospPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed RSV adult hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfRSVHospPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfRSVHospPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfRSVHospPatsPed /////////////
* group[+].id = "numConfRSVHospPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVHospPatsPed "Number confirmed RSV pediatric hospital patients"
* group[=].description = "numConfRSVHospPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfRSVHospPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number Inpatient Occupancy Ped Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numInPtBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfRSVHospPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number Inpatient Occupancy Ped Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numInPtBedsOccPed"
* group[=].population[measureObservation].id = "numConfRSVHospPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed RSV pediatric hospital patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfRSVHospPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfRSVHospPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numICUBedsAdult /////////////
* group[+].id = "numICUBedsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsAdult "Number ICU Adult Beds"
* group[=].description = "Number ICU Adult Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numICUBedsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numICUBedsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBeds"
* group[=].population[measureObservation].id = "numICUBedsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number ICU Adult Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numICUBedsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numICUBedsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numICUBedsPed /////////////
* group[+].id = "numICUBedsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsPed "Number ICU Ped Beds"
* group[=].description = "Number ICU Ped Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numICUBedsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numICUBedsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBeds"
* group[=].population[measureObservation].id = "numICUBedsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number ICU Ped Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numICUBedsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numICUBedsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numICUBedsOcc /////////////
* group[+].id = "numICUBedsOcc-hrd-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOcc "Number ICU Occupancy Beds"
* group[=].description = "Number ICU Occupancy Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numICUBedsOcc-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsInitialPopulation"
* group[=].population[measurePopulation].id = "numICUBedsOcc-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBeds"
* group[=].population[measureObservation].id = "numICUBedsOcc-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number ICU Occupancy Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numICUBedsOcc"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numICUBedsOcc-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numICUBedsOccAdult /////////////
* group[+].id = "numICUBedsOccAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOccAdult "Number ICU Occupancy Adult Beds"
* group[=].description = "Number ICU Occupancy Adult Beds Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numICUBedsOccAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numICUBedsOccAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsAdult"
* group[=].population[measureObservation].id = "numICUBedsOccAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number ICU Occupancy Adult Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numICUBedsOccAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numICUBedsOccAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numICUBedsOccPed /////////////
* group[+].id = "numICUBedsOccPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numICUBedsOccPed "Number ICU Occupancy Pediatric Beds"
* group[=].description = "numICUBedsOccPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numICUBedsOccPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Ped Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsPedInitialPopulation"
* group[=].population[measurePopulation].id = "numICUBedsOccPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Ped Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsPed"
* group[=].population[measureObservation].id = "numICUBedsOccPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number ICU Occupancy Pediatric Beds"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numICUBedsOccPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numICUBedsOccPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfC19ICUPatsAdult /////////////
* group[+].id = "numConfC19ICUPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfC19ICUPatsAdult "Number confirmed Covid-19 adult ICU patients"
* group[=].description = "numConfC19ICUPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfC19ICUPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfC19ICUPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccAdult"
* group[=].population[measureObservation].id = "numConfC19ICUPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Covid-19 adult ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfC19ICUPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfC19ICUPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfC19ICUPatsPed /////////////
* group[+].id = "numConfC19ICUPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfC19ICUPatsPed "Number confirmed Covid-19 pediatric ICU patients"
* group[=].description = "numConfC19ICUPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfC19ICUPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All numICUBedsOccPed"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfC19ICUPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Pediatric Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccPed"
* group[=].population[measureObservation].id = "numConfC19ICUPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Covid-19 pediatric ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfC19ICUPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfC19ICUPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfFluICUPatsAdult /////////////
* group[+].id = "numConfFluICUPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfFluICUPatsAdult "Number confirmed Flu adult ICU patients"
* group[=].description = "numConfFluICUPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfFluICUPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfFluICUPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccAdult"
* group[=].population[measureObservation].id = "numConfFluICUPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Flu adult ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfFluICUPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfFluICUPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfFluICUPatsPed /////////////
* group[+].id = "numConfFluICUPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfFluICUPatsPed "Number confirmed Flu pediatric ICU patients"
* group[=].description = "numConfFluICUPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfFluICUPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All numICUBedsOccPed"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfFluICUPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Pediatric Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccPed"
* group[=].population[measureObservation].id = "numConfFluICUPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed Flu pediatric ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfFluICUPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfFluICUPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfRSVICUPatsAdult /////////////
* group[+].id = "numConfRSVICUPatsAdult-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVICUPatsAdult "Number confirmed RSV adult ICU patients"
* group[=].description = "numConfRSVICUPatsAdult Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfRSVICUPatsAdult-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All Number ICU Occupancy Adult Beds"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccAdultInitialPopulation"
* group[=].population[measurePopulation].id = "numConfRSVICUPatsAdult-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Adult Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccAdult"
* group[=].population[measureObservation].id = "numConfRSVICUPatsAdult-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed RSV adult ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfRSVICUPatsAdult"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfRSVICUPatsAdult-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"


///////////// Group numConfRSVICUPatsPed /////////////
* group[+].id = "numConfRSVICUPatsPed-hrd-capacity-group"
* group[=].code = HRDExampleCS#numConfRSVICUPatsPed "Number confirmed RSV pediatric ICU patients"
* group[=].description = "numConfRSVICUPatsPed Hospital Respiratory Data measurement"
* group[=].population[initialPopulation].id = "numConfRSVICUPatsPed-initial-population"
* group[=].population[initialPopulation].code = $measure-population#initial-population "Initial Population"
* group[=].population[initialPopulation].description = "All numICUBedsOccPed"  // TODO Replace with a Group Display
* group[=].population[initialPopulation].criteria.language = #text/cql-identifier
* group[=].population[initialPopulation].criteria.expression = "numICUBedsOccPedInitialPopulation"
* group[=].population[measurePopulation].id = "numConfRSVICUPatsPed-measure-population"
* group[=].population[measurePopulation].code = $measure-population#measure-population "Measure Population"
* group[=].population[measurePopulation].description = "Number ICU Occupancy Pediatric Beds"
* group[=].population[measurePopulation].criteria.language = #text/cql-identifier
* group[=].population[measurePopulation].criteria.expression = "numICUBedsOccPed"
* group[=].population[measureObservation].id = "numConfRSVICUPatsPed-measure-observation"
* group[=].population[measureObservation].code = $measure-population#measure-observation "Measure Observation"
* group[=].population[measureObservation].description = "Number confirmed RSV pediatric ICU patients"
* group[=].population[measureObservation].criteria.language = #text/cql-identifier
* group[=].population[measureObservation].criteria.expression = "numConfRSVICUPatsPed"
* group[=].population[measureObservation].extension[+].url = $cqfm-criteriaReference
* group[=].population[measureObservation].extension[=].valueString = "numConfRSVICUPatsPed-measure-population"
* group[=].population[measureObservation].extension[+].url = $cqfm-aggregateMethod
* group[=].population[measureObservation].extension[=].valueCode = $aggregate-method#count "Count"