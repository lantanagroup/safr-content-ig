
/*
// TODO, try SANER Measure Profile for the Measure Profile these are using - https://build.fhir.org/ig/HL7/fhir-saner/StructureDefinition-PublicHealthMeasure.html

Instance: hosp-location-example-bed-capacity
InstanceOf: QICoreLocation
Title: "Location - Example ACH - Crit"
Description: "Location - Example ACH - Medical Critical Care"
Usage: #inline
* identifier.system = "http://www.example.org/location"
* identifier.value = "123"
* status = #active
* name = "XYZ Hospital"
* type = $bed-capacity-code-system#HOSP "Hospital"


Instance: bed-capacity-measurereport-example-hosp
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - Hospital Bed Capacity Individual Measure Report"
Description: "Example MeasureReport - Hospital Bed Capacity Individual Measure Report"
Usage: #example

// * contained.resourceType = "Location"
// * contained.id = "hosp-location-example-bed-capacity"
// * contained.identifier.system = "http://www.example.org/location"
// * contained.identifier.value = "123"
// * contained.name = "XYZ Hospital"
// * contained.type = $bed-capacity-code-system#HOSP "Hospital"
* extension[location].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataLocation"
* extension[location].valueReference = Reference(hosp-location-example-bed-capacity)
// TODO, determine if this is actually necessary. DEQM Invariant deqm-3 seems to be incorrectly written
* extension[1].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[=].valueCodeableConcept = $measure-scoring#cohort "Cohort"
* contained[0] = hosp-location-example-bed-capacity
* status = #complete
* type = #individual
* measure = "http://hl7.org/fhir/us/nhsn-dqm/Measure/BedCapacityMeasure|0.1.0-cibuild"
//* measure = Canonical(BedCapacityMeasure)
// Uncomment the line below when DEQM is updated to allow non-patient subjects in individual reports
// * subject = Reference(hosp-location-example-bed-capacity)
* subject.identifier.system = "http://www.example.org/location"
* subject.identifier.value = "123"
* date = "2023-08-28T07:01:07.563Z"
* reporter = Reference(organization-example-submitting-organization)
* period.start = "2023-08-28T07:01:07.563Z"
* period.end = "2023-08-28T19:01:07.561Z"
//* group.code = $bed-capacity-code-system#BedCapacityReporting
* group[0].code = $bed-capacity-code-system#AllBedsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 177
* group[+].code = $bed-capacity-code-system#AllBedsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 5
* group[+].code = $bed-capacity-code-system#AdultTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 177
* group[+].code = $bed-capacity-code-system#AdultTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 5
* group[+].code = $bed-capacity-code-system#AdultICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 32
* group[+].code = $bed-capacity-code-system#AdultICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#AdultICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 32
* group[+].code = $bed-capacity-code-system#AdultNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 3
* group[+].code = $bed-capacity-code-system#AdultNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[+].code = $bed-capacity-code-system#AdultMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 3
* group[+].code = $bed-capacity-code-system#AdultMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 110
* group[+].code = $bed-capacity-code-system#PedsPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[+].code = $bed-capacity-code-system#PedsMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 11
* group[+].code = $bed-capacity-code-system#SpecialtyTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#SpecialtyTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#OBOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#OBUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#NICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3PlusOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#NICU3PlusUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#NICU3Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#BurnOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#BurnUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NegativePressureOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#NegativePressureUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#AdultEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#AdultEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#PedsEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#TotalEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 412
* group[+].code = $bed-capacity-code-system#TotalEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1921

Instance: bed-capacity-measurereport-example-ipf
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - Inpatient Psychiatric Facility Bed Capacity Individual Measure Report"
Description: "Example MeasureReport - Inpatient Psychiatric Facility Bed Capacity Individual Measure Report"
Usage: #example

* extension[location].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataLocation"
* extension[location].valueReference = Reference(hosp-location-example-bed-capacity)
* extension[1].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[=].valueCodeableConcept = $measure-scoring#cohort "Cohort"
* contained[0] = hosp-location-example-bed-capacity
* status = #complete
* type = #individual
* measure = "http://hl7.org/fhir/us/nhsn-dqm/Measure/BedCapacityMeasure|0.1.0-cibuild"
// Uncomment the line below when DEQM is updated to allow non-patient subjects in individual reports
// * subject = Reference(hosp-location-example-bed-capacity)
* subject.identifier.system = "http://www.example.org/location"
* subject.identifier.value = "123"
* date = "2023-08-28T07:01:07.563Z"
* reporter = Reference(organization-example-submitting-organization)
* period.start = "2023-08-28T07:01:07.563Z"
* period.end = "2023-08-28T19:01:07.562Z"
* group[0].code = $bed-capacity-code-system#AllBedsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#AllBedsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#AdultTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#AdultICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 32
* group[+].code = $bed-capacity-code-system#AdultNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 110
* group[+].code = $bed-capacity-code-system#PedsPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 145
* group[+].code = $bed-capacity-code-system#PedsMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 11
* group[+].code = $bed-capacity-code-system#SpecialtyTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#SpecialtyTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#OBOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#OBUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#NICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3PlusOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#NICU3PlusUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#NICU3Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#AdultPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#PedsPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#BurnOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#BurnUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NegativePressureOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#NegativePressureUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#AdultEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 29
* group[+].code = $bed-capacity-code-system#AdultEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#PedsEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#TotalEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 29
* group[+].code = $bed-capacity-code-system#TotalEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

Instance: bed-capacity-measurereport-example-chld
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - Children's Hospital Bed Capacity Individual Measure Report"
Description: "Example MeasureReport - Children's Hospital Bed Capacity Individual Measure Report"
Usage: #example

* extension[location].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-dataLocation"
* extension[location].valueReference = Reference(hosp-location-example-bed-capacity)
* extension[1].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[=].valueCodeableConcept = $measure-scoring#cohort "Cohort"
* contained[0] = hosp-location-example-bed-capacity
* status = #complete
* type = #individual
* measure = "http://hl7.org/fhir/us/nhsn-dqm/Measure/BedCapacityMeasure|0.1.0-cibuild"
// Uncomment the line below when DEQM is updated to allow non-patient subjects in individual reports
// * subject = Reference(hosp-location-example-bed-capacity)
* subject.identifier.system = "http://www.example.org/location"
* subject.identifier.value = "123"
* date = "2023-08-28T07:01:07.563Z"
* reporter = Reference(organization-example-submitting-organization)
* period.start = "2023-08-28T07:01:07.563Z"
* period.end = "2023-08-28T19:01:07.562Z"
* group[0].code = $bed-capacity-code-system#AllBedsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 104
* group[+].code = $bed-capacity-code-system#AllBedsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 86
* group[+].code = $bed-capacity-code-system#AdultTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#AdultICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 32
* group[+].code = $bed-capacity-code-system#AdultNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#AdultObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 56
* group[+].code = $bed-capacity-code-system#PedsTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 53
* group[+].code = $bed-capacity-code-system#PedsICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 12
* group[+].code = $bed-capacity-code-system#PedsICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 12
* group[+].code = $bed-capacity-code-system#PedsICU_LOCOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 12
* group[+].code = $bed-capacity-code-system#PedsNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 44
* group[+].code = $bed-capacity-code-system#PedsNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 41
* group[+].code = $bed-capacity-code-system#PedsPCUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsPCUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsMTMSOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsMTMSUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 41
* group[+].code = $bed-capacity-code-system#PedsObsOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#PedsObsUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 11
* group[+].code = $bed-capacity-code-system#SpecialtyTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#SpecialtyTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#SpecialtyNonCribUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#OBOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#OBUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable
* group[+].code = $bed-capacity-code-system#NICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU4Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3PlusOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#NICU3PlusUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 2
* group[+].code = $bed-capacity-code-system#NICU3Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU3Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU2Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Occupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NICU1Unoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NurseryUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#AdultPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 91
* group[+].code = $bed-capacity-code-system#AdultPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 16
* group[+].code = $bed-capacity-code-system#PedsPsychOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsPsychUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#RehabUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveTotalUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeActiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#SurgeInactiveNonICUUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#BurnOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 18
* group[+].code = $bed-capacity-code-system#BurnUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#NegativePressureOccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 9
* group[+].code = $bed-capacity-code-system#NegativePressureUnoccupied
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 1
* group[+].code = $bed-capacity-code-system#AdultEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 29
* group[+].code = $bed-capacity-code-system#AdultEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#PedsEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 5
* group[+].code = $bed-capacity-code-system#PedsEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#TotalEDCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
* group[+].code = $bed-capacity-code-system#TotalEDAdmittedCensus
* group[=].population[0].code = $measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

/*
Examples where the measure items are placed in a single group with multiple populations

*/