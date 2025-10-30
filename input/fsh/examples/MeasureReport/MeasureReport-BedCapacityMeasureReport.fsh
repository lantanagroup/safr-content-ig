
// NHSN Bed Capacity MeasureReport Instance
// Based on the NHSNBedCapacityMeasureReport profile
Instance: BedCapacityMeasureReport
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - Bed Capacity MeasureReport Example"
Description: "Example MeasureReport for NHSN bed capacity monitoring showing ICU, ED, and Pediatric bed capacity"
Usage: #example
// Basic metadata
* status = $measure-report-status#complete
* type = $measure-report-type#individual
* measure = Canonical(HrdMeasure|1.0.0-ballot)
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


* improvementNotation = $MeasureImprovementNotation#increase "Increased score indicates improvement"


///////////// Group Beds /////////////
* group[+].id = "AllBeds-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AllBeds "All Beds"
* group[=].measureScore.value = 97.25
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "Beds-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 182
* group[=].population[+].id = "Beds-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 182
* group[=].population[+].id = "Beds-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 5
* group[=].stratifier[0].id = "Beds-status-stratifier"
* group[=].stratifier[0].code.text = "All Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AllBedsOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 177
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AllBedsUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 5

///////////// Group AdultTotal /////////////
* group[+].id = "AdultTotal-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultTotal "Adult Total Beds"
* group[=].measureScore.value = 97.25
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultTotal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 182
* group[=].population[+].id = "AdultTotal-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 182
* group[=].population[+].id = "AdultTotal-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 5
* group[=].stratifier[0].id = "AdultTotal-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult Total Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultTotalOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 177
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultTotalUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 5

///////////// Group AdultICU /////////////
* group[+].id = "AdultICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultICU "Adult ICU Beds"
* group[=].measureScore.value = 94.12
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 34
* group[=].population[+].id = "AdultICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 34
* group[=].population[+].id = "AdultICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 2
* group[=].stratifier[0].id = "AdultICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult ICU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 32
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 2

///////////// Group AdultICULOC /////////////
* group[+].id = "AdultICULOC-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultICULOC "Adult ICU-LOC Beds"
* group[=].measureScore.value = 91.43
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultICULOC-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 35
* group[=].population[+].id = "AdultICULOC-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 35
* group[=].population[+].id = "AdultICULOC-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 3
* group[=].stratifier[0].id = "AdultICULOC-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult ICU-LOC Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultICULOCOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 32
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultICULOCUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 3

///////////// Group AdultNonICU /////////////
* group[+].id = "AdultNonICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultNonICU "Adult Non-ICU Beds"
* group[=].measureScore.value = 84.77
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultNonICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 302
* group[=].population[+].id = "AdultNonICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 302
* group[=].population[+].id = "AdultNonICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 46
* group[=].stratifier[0].id = "AdultNonICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult Non-ICU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultNonICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 256
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultNonICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 46

///////////// Group AdultPCU /////////////
* group[+].id = "AdultPCU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultPCU "Adult PCU Beds"
* group[=].measureScore.value = 0.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultPCU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "AdultPCU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "AdultPCU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 145
* group[=].stratifier[0].id = "AdultPCU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult PCU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultPCUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultPCUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 145

///////////// Group AdultMTMS /////////////
* group[+].id = "AdultMTMS-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultMTMS "Adult MT/MS Beds"
* group[=].measureScore.value = 100.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultMTMS-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 3
* group[=].population[+].id = "AdultMTMS-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 3
* group[=].population[+].id = "AdultMTMS-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "AdultMTMS-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult MT/MS Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultMTMSOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 3
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultMTMSUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group AdultObs /////////////
* group[+].id = "AdultObs-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultObs "Adult OBS Beds"
* group[=].measureScore.value = 68.97
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultObs-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "AdultObs-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "AdultObs-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 45
* group[=].stratifier[0].id = "AdultObs-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult OBS Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultObsOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 100
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultObsUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 45

///////////// Group PedsTotal /////////////
* group[+].id = "PedsTotal-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsTotal "Peds Total Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsTotal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsTotal-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsTotal-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsTotal-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds Total Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsTotalOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsTotalUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsICU /////////////
* group[+].id = "PedsICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsICU "Peds ICU Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds ICU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsICULOC /////////////
* group[+].id = "PedsICULOC-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsICULOC "Peds ICU-LOC Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsICULOC-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsICULOC-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsICULOC-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsICULOC-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds ICU-LOC Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsICULOCOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsICULOCUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsNonICU /////////////
* group[+].id = "PedsNonICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsNonICU "Peds Non-ICU Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsNonICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsNonICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsNonICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsNonICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds Non-ICU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsNonICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsNonICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsPCU /////////////
* group[+].id = "PedsPCU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsPCU "Peds PCU Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsPCU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsPCU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsPCU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsPCU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds PCU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsPCUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsPCUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsMTMS /////////////
* group[+].id = "PedsMTMS-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsMTMS "Peds MT/MS Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsMTMS-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsMTMS-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsMTMS-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsMTMS-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds MT/MS Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsMTMSOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsMTMSUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group PedsObs /////////////
* group[+].id = "PedsObs-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsObs "Peds OBS Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsObs-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsObs-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 145
* group[=].population[+].id = "PedsObs-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsObs-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds OBS Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsObsOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsObsUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group SpecialtyTotal /////////////
* group[+].id = "SpecialtyTotal-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SpecialtyTotal "Specialty Total Beds"
* group[=].measureScore.value = 66.67
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SpecialtyTotal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "SpecialtyTotal-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "SpecialtyTotal-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 12
* group[=].stratifier[0].id = "SpecialtyTotal-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty Total Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SpecialtyTotalOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 24
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SpecialtyTotalUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 12

///////////// Group SpecialtyNonCrib /////////////
* group[+].id = "SpecialtyNonCrib-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SpecialtyNonCrib "Specialty (Non-Crib) Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SpecialtyNonCrib-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "SpecialtyNonCrib-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "SpecialtyNonCrib-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "SpecialtyNonCrib-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty (Non-Crib) Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SpecialtyNonCribOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SpecialtyNonCribUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group OB /////////////
* group[+].id = "OB-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#OB "Specialty OB Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "OB-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "OB-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "OB-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "OB-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty OB Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "OBOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "OBUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU /////////////
* group[+].id = "NICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU "Specialty NICU Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU4 /////////////
* group[+].id = "NICU4-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU4 "Specialty NICU 4 Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU4-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU4-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU4-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU4-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU 4 Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICU4Occupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICU4Unoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU3 /////////////
* group[+].id = "NICU3-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU3 "Specialty NICU 3 Occupied Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU3-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU3-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU3-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU3-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU 3 Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICU3Occupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICU3Unoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU3Plus /////////////
* group[+].id = "NICU3Plus-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU3Plus "Specialty NICU 3 Plus Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU3Plus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU3Plus-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU3Plus-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU3Plus-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU 3 Plus Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICU3PlusOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICU3PlusUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU2 /////////////
* group[+].id = "NICU2-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU2 "Specialty NICU 2 Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU2-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU2-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU2-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU2-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU 2 Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICU2Occupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICU2Unoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group Nursery /////////////
* group[+].id = "Nursery-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#Nursery "Specialty Nursery Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "Nursery-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "Nursery-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "Nursery-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "Nursery-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty Nursery Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NurseryOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NurseryUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group NICU1 /////////////
* group[+].id = "NICU1-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NICU1 "Specialty NICU 1 Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NICU1-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU1-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 36
* group[=].population[+].id = "NICU1-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NICU1-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty NICU 1 Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NICU1Occupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NICU1Unoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group AdultPsych /////////////
* group[+].id = "AdultPsych-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultPsych "Specialty Adult Psych Beds"
* group[=].measureScore.value = 10.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultPsych-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "AdultPsych-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "AdultPsych-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 18
* group[=].stratifier[0].id = "AdultPsych-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty Adult Psych Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultPsychOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 2
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultPsychUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 18

///////////// Group PedsPsych /////////////
* group[+].id = "PedsPsych-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsPsych "Specialty Peds Psych Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsPsych-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "PedsPsych-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "PedsPsych-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsPsych-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty Peds Psych Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsPsychOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsPsychUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group Rehab /////////////
* group[+].id = "Rehab-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#Rehab "Specialty Rehab Beds"
* group[=].measureScore.value = 50.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "Rehab-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "Rehab-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "Rehab-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 15
* group[=].stratifier[0].id = "Rehab-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Specialty Rehab Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "RehabOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 15
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "RehabUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 15

///////////// Group SurgeActiveTotal /////////////
* group[+].id = "SurgeActiveTotal-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeActiveTotal "Surge Total Active Beds"
* group[=].measureScore.value = 50.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeActiveTotal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "SurgeActiveTotal-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "SurgeActiveTotal-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 10
* group[=].stratifier[0].id = "SurgeActiveTotal-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge Total Active Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeActiveTotalOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 10
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeActiveTotalUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 10

///////////// Group SurgeInactiveTotal /////////////
* group[+].id = "SurgeInactiveTotal-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeInactiveTotal "Surge Total Inactive Occupied Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeInactiveTotal-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "SurgeInactiveTotal-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 20
* group[=].population[+].id = "SurgeInactiveTotal-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "SurgeInactiveTotal-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge Total Inactive Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeInactiveTotalOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeInactiveTotalUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group SurgeActiveICU /////////////
* group[+].id = "SurgeActiveICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeActiveICU "Surge ICU Active Beds"
* group[=].measureScore.value = 20.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeActiveICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeActiveICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeActiveICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 8
* group[=].stratifier[0].id = "SurgeActiveICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge ICU Active Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeActiveICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 2
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeActiveICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 8

///////////// Group SurgeInactiveICU /////////////
* group[+].id = "SurgeInactiveICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeInactiveICU "Surge ICU Inactive Occupied Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeInactiveICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeInactiveICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeInactiveICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "SurgeInactiveICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge ICU Inactive Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeInactiveICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeInactiveICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group SurgeActiveNonICU /////////////
* group[+].id = "SurgeActiveNonICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeActiveNonICU "Surge Non-ICU Active Beds"
* group[=].measureScore.value = 40.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeActiveNonICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeActiveNonICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeActiveNonICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 6
* group[=].stratifier[0].id = "SurgeActiveNonICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge Non-ICU Active Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeActiveNonICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 4
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeActiveNonICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 6

///////////// Group SurgeInactiveNonICU /////////////
* group[+].id = "SurgeInactiveNonICU-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#SurgeInactiveNonICU "Surge Non-ICU Inactive Occupied Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "SurgeInactiveNonICU-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeInactiveNonICU-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "SurgeInactiveNonICU-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "SurgeInactiveNonICU-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Surge Non-ICU Inactive Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "SurgeInactiveNonICUOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "SurgeInactiveNonICUUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group Burn /////////////
* group[+].id = "Burn-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#Burn "Burn Beds"
* group[=].measureScore.value = 10.00
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "Burn-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "Burn-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "Burn-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 9
* group[=].stratifier[0].id = "Burn-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Burn Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "BurnOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 1
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "BurnUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 9

///////////// Group NegativePressure /////////////
* group[+].id = "NegativePressure-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#NegativePressure "Neg Pressure Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "NegativePressure-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "NegativePressure-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 10
* group[=].population[+].id = "NegativePressure-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "NegativePressure-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Neg Pressure Unoccupied Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "NegativePressureOccupied"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "NegativePressureUnoccupied"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group AdultED /////////////
* group[+].id = "AdultED-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#AdultED "Adult ED Total Beds"
* group[=].measureScore.value = 33.33
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "AdultED-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "AdultED-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "AdultED-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 20
* group[=].stratifier[0].id = "AdultED-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Adult ED Admitted Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "AdultEDCensus"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 10
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "AdultEDAdmittedCensus"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 20

///////////// Group PedsED /////////////
* group[+].id = "PedsED-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#PedsED "Peds ED Beds"
* group[=].measureScore.value = 0
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "PedsED-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "PedsED-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "PedsED-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 0
* group[=].stratifier[0].id = "PedsED-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Peds ED Admitted Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "PedsEDCensus"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 0
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "PedsEDAdmittedCensus"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 0

///////////// Group TotalED /////////////
* group[+].id = "TotalED-bed-capacity-group"
* group[=].code = BedCapacityGroupExampleCS#TotalED "Total ED Beds"
* group[=].measureScore.value = 33.33
* group[=].measureScore.unit = "%"
* group[=].measureScore.code = #%
* group[=].measureScore.system = "http://unitsofmeasure.org"
* group[=].population[+].id = "TotalED-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "TotalED-measure-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].population[=].count = 30
* group[=].population[+].id = "TotalED-measure-observation" 
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-observation "Measure Observation"
* group[=].population[=].count = 20
* group[=].stratifier[0].id = "TotalED-beds-status-stratifier"
* group[=].stratifier[0].code.text = "Total ED Admitted Beds Status"
* group[=].stratifier[0].stratum[0].value.text = "Occupied"
* group[=].stratifier[0].stratum[0].population[0].id = "TotalEDCensus"
* group[=].stratifier[0].stratum[0].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[0].population[0].count = 10
* group[=].stratifier[0].stratum[1].value.text = "Available"
* group[=].stratifier[0].stratum[1].population[0].id = "TotalEDAdmittedCensus"
* group[=].stratifier[0].stratum[1].population[0].code = http://terminology.hl7.org/CodeSystem/measure-population#measure-population "Measure Population"
* group[=].stratifier[0].stratum[1].population[0].count = 20