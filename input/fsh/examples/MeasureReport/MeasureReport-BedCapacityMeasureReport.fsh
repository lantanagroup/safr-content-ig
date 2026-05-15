
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
* measure = Canonical(BedCapacityMeasure|1.0.0)
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


* group[+].id = "EntireFacility-bed-capacity-group"
* group[=].code = $loinc#112506-1
* group[=].population[+].id = "Facility-context-entire-or-subunit"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AllBedsOccupied /////////////
///////////// Group All inpatient beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AllBedsOccupied-bed-capacity-group"
* group[=].code = $loinc#112579-8
* group[=].population[+].id = "AllBedsOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AllBedsUnoccupied /////////////
///////////// Group All inpatient beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AllBedsUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112578-0
* group[=].population[+].id = "AllBedsUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultTotalOccupied /////////////
///////////// Group Adult inpatient beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "AdultTotalOccupied-bed-capacity-group"
* group[=].code = $loinc#112577-2
* group[=].population[+].id = "AdultTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultTotalUnoccupied /////////////
///////////// Group Adult inpatient beds:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "AdultTotalUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112576-4
* group[=].population[+].id = "AdultTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultICUOccupied /////////////
///////////// Group Adult intensive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultICUOccupied-bed-capacity-group"
* group[=].code = $loinc#112575-6
* group[=].population[+].id = "AdultICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultICUUnoccupied /////////////
///////////// Group Adult intensive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112574-9
* group[=].population[+].id = "AdultICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultICULOCOccupied /////////////
///////////// Group Adult intensive care unit (level of care) beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultICULOCOccupied-bed-capacity-group"
* group[=].code = $loinc#112573-1
* group[=].population[+].id = "AdultICULOCOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultNonICUOccupied /////////////
///////////// Group Adult non-intensive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultNonICUOccupied-bed-capacity-group"
* group[=].code = $loinc#112572-3
* group[=].population[+].id = "AdultNonICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultNonICUUnoccupied /////////////
///////////// Group Adult non-intensive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultNonICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112571-5
* group[=].population[+].id = "AdultNonICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultPCUOccupied /////////////
///////////// Group Adult progressive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultPCUOccupied-bed-capacity-group"
* group[=].code = $loinc#112570-7
* group[=].population[+].id = "AdultPCUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultPCUUnoccupied /////////////
///////////// Group Adult progressive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultPCUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112569-9
* group[=].population[+].id = "AdultPCUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultMTMSOccupied /////////////
///////////// Group Adult medicine telemetry and general acute care beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultMTMSOccupied-bed-capacity-group"
* group[=].code = $loinc#112568-1
* group[=].population[+].id = "AdultMTMSOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultMTMSUnoccupied /////////////
///////////// Group Adult medicine telemetry and general acute care beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultMTMSUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112567-3
* group[=].population[+].id = "AdultMTMSUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* group[=].population[=].count.extension.valueCode = #not-applicable

///////////// Group AdultObsOccupied /////////////
///////////// Group Adult observation beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultObsOccupied-bed-capacity-group"
* group[=].code = $loinc#112566-5
* group[=].population[+].id = "AdultObsOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultObsUnoccupied /////////////
///////////// Group Adult observation beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultObsUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112565-7
* group[=].population[+].id = "AdultObsUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsTotalOccupied /////////////
///////////// Group Pediatric inpatient beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "PedsTotalOccupied-bed-capacity-group"
* group[=].code = $loinc#112564-0
* group[=].population[+].id = "PedsTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsTotalUnoccupied /////////////
///////////// Group Pediatric inpatient beds:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "PedsTotalUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112563-2
* group[=].population[+].id = "PedsTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsICUOccupied /////////////
///////////// Group Pediatric intensive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsICUOccupied-bed-capacity-group"
* group[=].code = $loinc#112562-4
* group[=].population[+].id = "PedsICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsICUUnoccupied /////////////
///////////// Group Pediatric intensive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112561-6
* group[=].population[+].id = "PedsICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsICULOCOccupied /////////////
///////////// Group Pediatric intensive care unit (level of care) beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsICULOCOccupied-bed-capacity-group"
* group[=].code = $loinc#112560-8
* group[=].population[+].id = "PedsICULOCOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsNonICUOccupied /////////////
///////////// Group Pediatric non-intensive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsNonICUOccupied-bed-capacity-group"
* group[=].code = $loinc#112559-0
* group[=].population[+].id = "PedsNonICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsNonICUUnoccupied /////////////
///////////// Group Pediatric non-intensive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsNonICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112558-2
* group[=].population[+].id = "PedsNonICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsPCUOccupied /////////////
///////////// Group Pediatric progressive care unit beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsPCUOccupied-bed-capacity-group"
* group[=].code = $loinc#112557-4
* group[=].population[+].id = "PedsPCUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsPCUUnoccupied /////////////
///////////// Group Pediatric progressive care unit beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsPCUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112556-6
* group[=].population[+].id = "PedsPCUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsMTMSOccupied /////////////
///////////// Group Pediatric medicine telemetry and general acute care beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsMTMSOccupied-bed-capacity-group"
* group[=].code = $loinc#112555-8
* group[=].population[+].id = "PedsMTMSOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsMTMSUnoccupied /////////////
///////////// Group Pediatric medicine telemetry and general acute care beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsMTMSUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112554-1
* group[=].population[+].id = "PedsMTMSUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsObsOccupied /////////////
///////////// Group Pediatric observation beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsObsOccupied-bed-capacity-group"
* group[=].code = $loinc#112553-3
* group[=].population[+].id = "PedsObsOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsObsUnoccupied /////////////
///////////// Group Pediatric observation beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsObsUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112552-5
* group[=].population[+].id = "PedsObsUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SpecialtyTotalOccupied /////////////
///////////// Group Specialty beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "SpecialtyTotalOccupied-bed-capacity-group"
* group[=].code = $loinc#112551-7
* group[=].population[+].id = "SpecialtyTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SpecialtyTotalUnoccupied /////////////
///////////// Group Specialty beds:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "SpecialtyTotalUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112550-9
* group[=].population[+].id = "SpecialtyTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SpecialtyNonCribOccupied /////////////
///////////// Group Specialty non-crib beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "SpecialtyNonCribOccupied-bed-capacity-group"
* group[=].code = $loinc#112549-1
* group[=].population[+].id = "SpecialtyNonCribOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SpecialtyNonCribUnoccupied /////////////
///////////// Group Specialty non-crib beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "SpecialtyNonCribUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112548-3
* group[=].population[+].id = "SpecialtyNonCribUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group OBOccupied /////////////
///////////// Group Specialty obstetric beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "OBOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112547-5
* group[=].population[+].id = "OBOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group OBUnoccupied /////////////
///////////// Group Specialty obstetric beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "OBUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112546-7
* group[=].population[+].id = "OBUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICUTotalOccupied /////////////
///////////// Group Specialty neonatal intensive care unit beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "NICUTotalOccupied-bed-capacity-group"
* group[=].code = $loinc#112545-9
* group[=].population[+].id = "NICUTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICUTotalUnoccupied /////////////
///////////// Group Specialty neonatal intensive care unit beds:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "NICUTotalUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112544-2
* group[=].population[+].id = "NICUTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU4Occupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 4 beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NICU4Occupied-bed-capacity-group"
* group[=].code = http://loinc.org#112543-4
* group[=].population[+].id = "NICU4Occupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU4Unoccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 4 beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NICU4Unoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112542-6
* group[=].population[+].id = "NICU4Unoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU3Unoccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 3 plus beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NICU3Unoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112541-8
* group[=].population[+].id = "NICU3Unoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU3PlusOccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 3 plus beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NICU3PlusOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112540-0
* group[=].population[+].id = "NICU3PlusOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU3PlusUnoccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 3:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NICU3PlusUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112539-2
* group[=].population[+].id = "NICU3PlusUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU3Occupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 3:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NICU3Occupied-bed-capacity-group"
* group[=].code = http://loinc.org#112538-4
* group[=].population[+].id = "NICU3Occupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU2Occupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 2:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NICU2Occupied-bed-capacity-group"
* group[=].code = http://loinc.org#112537-6
* group[=].population[+].id = "NICU2Occupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU2Unoccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 2:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NICU2Unoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112536-8
* group[=].population[+].id = "NICU2Unoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NurseryOccupied /////////////
///////////// Group Specialty nursery beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NurseryOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112535-0
* group[=].population[+].id = "NurseryOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NurseryUnoccupied /////////////
///////////// Group Specialty nursery beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NurseryUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112534-3
* group[=].population[+].id = "NurseryUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU1Occupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 1:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NICU1Occupied-bed-capacity-group"
* group[=].code = http://loinc.org#112533-5
* group[=].population[+].id = "NICU1Occupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NICU1Unoccupied /////////////
///////////// Group Specialty neonatal intensive care unit-level 1:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NICU1Unoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112532-7
* group[=].population[+].id = "NICU1Unoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultPsychOccupied /////////////
///////////// Group Specialty adult psychiatric beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultPsychOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112531-9
* group[=].population[+].id = "AdultPsychOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultPsychUnoccupied /////////////
///////////// Group Specialty adult psychiatric beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "AdultPsychUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112530-1
* group[=].population[+].id = "AdultPsychUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsPsychOccupied /////////////
///////////// Group Specialty pediatric psychiatric beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsPsychOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112529-3
* group[=].population[+].id = "PedsPsychOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsPsychUnoccupied /////////////
///////////// Group Specialty pediatric psychiatric beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "PedsPsychUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112528-5
* group[=].population[+].id = "PedsPsychUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group RehabOccupied /////////////
///////////// Group Specialty rehabilitation beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "RehabOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112527-7
* group[=].population[+].id = "RehabOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group RehabUnoccupied /////////////
///////////// Group Specialty rehabilitation beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "RehabUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112526-9
* group[=].population[+].id = "RehabUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveTotalOccupied /////////////
///////////// Group Surge-active:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "SurgeActiveTotalOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112525-1
* group[=].population[+].id = "SurgeActiveTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveTotalUnoccupied /////////////
///////////// Group Surge-active:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "SurgeActiveTotalUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112524-4
* group[=].population[+].id = "SurgeActiveTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
/*
///////////// Group SurgeInactiveTotalOccupied /////////////
* group[+].id = "SurgeInactiveTotalOccupied-bed-capacity-group"
* group[=].code = http://www.cdc.gov/nhsn/fhirportal/safr/ig/CodeSystem/nhsn-safr-bed-capacity-codes#SurgeInactiveTotalOccupied
* group[=].population[+].id = "SurgeInactiveTotalOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
*/
///////////// Group SurgeInactiveTotalUnoccupied /////////////
///////////// Group Surge-inactive:Num:Pt:Facility:Qn:Unoccupied.total /////////////
* group[+].id = "SurgeInactiveTotalUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112523-6
* group[=].population[+].id = "SurgeInactiveTotalUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveICUOccupied /////////////
///////////// Group Surge intensive care unit beds-active:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "SurgeActiveICUOccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112522-8
* group[=].population[+].id = "SurgeActiveICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveICUUnoccupied /////////////
///////////// Group Surge intensive care unit beds-active:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "SurgeActiveICUUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112521-0
* group[=].population[+].id = "SurgeActiveICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeInactiveICUUnoccupied /////////////
///////////// Group Surge intensive care unit beds-inactive:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "SurgeInactiveICUUnoccupied-bed-capacity-group"
* group[=].code = http://loinc.org#112520-2
* group[=].population[+].id = "SurgeInactiveICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveNonICUOccupied /////////////
///////////// Group Surge non-intensive care unit beds-active:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "SurgeActiveNonICUOccupied-bed-capacity-group"
* group[=].code = $loinc#112519-4
* group[=].population[+].id = "SurgeActiveNonICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group SurgeActiveNonICUUnoccupied /////////////
///////////// Group Surge non-intensive care unit beds-active:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "SurgeActiveNonICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112518-6
* group[=].population[+].id = "SurgeActiveNonICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
/*
///////////// Group SurgeInactiveNonICUOccupied /////////////
* group[+].id = "SurgeInactiveNonICUOccupied-bed-capacity-group"
* group[=].code = http://www.cdc.gov/nhsn/fhirportal/safr/ig/CodeSystem/nhsn-safr-bed-capacity-codes#SurgeInactiveNonICUOccupied
* group[=].population[+].id = "SurgeInactiveNonICUOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
*/
///////////// Group SurgeInactiveNonICUUnoccupied /////////////
///////////// Group Surge non-intensive care unit beds-inactive:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "SurgeInactiveNonICUUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112517-8
* group[=].population[+].id = "SurgeInactiveNonICUUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group BurnOccupied /////////////
///////////// Group Burn beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "BurnOccupied-bed-capacity-group"
* group[=].code = $loinc#112516-0
* group[=].population[+].id = "BurnOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group BurnUnoccupied /////////////
///////////// Group Burn beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "BurnUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112515-2
* group[=].population[+].id = "BurnUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NegativePressureOccupied /////////////
///////////// Group Negative pressure beds:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "NegativePressureOccupied-bed-capacity-group"
* group[=].code = $loinc#112514-5
* group[=].population[+].id = "NegativePressureOccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group NegativePressureUnoccupied /////////////
///////////// Group Negative pressure beds:Num:Pt:Facility:Qn:Unoccupied /////////////
* group[+].id = "NegativePressureUnoccupied-bed-capacity-group"
* group[=].code = $loinc#112513-7
* group[=].population[+].id = "NegativePressureUnoccupied-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultEDCensus /////////////
///////////// Group Adult emergency department beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "AdultEDCensus-bed-capacity-group"
* group[=].code = $loinc#112512-9
* group[=].population[+].id = "AdultEDCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group AdultEDAdmittedCensus /////////////
///////////// Group Adult emergency department beds-admitted:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "AdultEDAdmittedCensus-bed-capacity-group"
* group[=].code = $loinc#112511-1
* group[=].population[+].id = "AdultEDAdmittedCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsEDTotalCensus /////////////
///////////// Group Pediatric emergency department beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "PedsEDTotalCensus-bed-capacity-group"
* group[=].code = $loinc#112510-3
* group[=].population[+].id = "PedsEDTotalCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group PedsEDAdmittedCensus /////////////
///////////// Group Pediatric emergency department beds-admitted:Num:Pt:Facility:Qn:Occupied /////////////
* group[+].id = "PedsEDAdmittedCensus-bed-capacity-group"
* group[=].code = $loinc#112509-5
* group[=].population[+].id = "PedsEDAdmittedCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group TotalEDCensus /////////////
///////////// Group Emergency department beds:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "TotalEDCensus-bed-capacity-group"
* group[=].code = $loinc#112508-7
* group[=].population[+].id = "TotalEDCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group TotalEDAdmittedCensus /////////////
///////////// Group Emergency department beds-admitted:Num:Pt:Facility:Qn:Occupied.total /////////////
* group[+].id = "TotalEDAdmittedCensus-bed-capacity-group"
* group[=].code = $loinc#112507-9
* group[=].population[+].id = "TotalEDAdmittedCensus-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0
