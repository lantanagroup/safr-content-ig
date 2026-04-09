Instance: BedCapacityExampleCodeMap
InstanceOf: ConceptMap
Usage: #definition
* url = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/ConceptMap/BedCapacityExampleCodeMap"
* version = "1.0.0"
* name = "BedCapacityExampleCodeMap"
* title = "NHSN SAFR Bed Capacity Codes ConceptMap"
* status = #draft
* experimental = false
* date = "2026-04-07"
* publisher = "CDC National Healthcare Safety Network (NHSN)"
* contact.name = "CDC National Healthcare Safety Network (NHSN)"
* contact.telecom[0].system = #url
* contact.telecom[=].value = "http://www.cdc.gov/nhsn"
* contact.telecom[+].system = #email
* contact.telecom[=].value = "nhsn@cdc.gov"
* description = "Maps [HL7 US SAFR ballot (May 2025)](https://hl7.org/fhir/us/safr/2025May/) [example bed capacity codes](https://hl7.org/fhir/us/safr/2025May/CodeSystem-us-safr-bed-capacity-example-codes.html) to the final LOINC codes adopted for use in the published [US SAFR Implementation Guide SU1](https://hl7.org/fhir/us/safr/STU1/) and the CDC NHSN SAFR Content Implementation Guide."
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* purpose = "Supports implementers transitioning from HL7 US SAFR ballot example bed capacity codes to the final LOINC terminology."
* group.source = "http://hl7.org/fhir/us/safr/CodeSystem/us-safr-bed-capacity-example-codes|1.0.0-ballot"
* group.target = "http://loinc.org"
* group.element[0].code = #AdultEDAdmittedCensus
* group.element[=].display = "Adult ED Admitted Census"
* group.element[=].target.code = #112511-1
* group.element[=].target.display = "Adult emergency department beds-admitted"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultEDCensus
* group.element[=].display = "Adult ED Total Census"
* group.element[=].target.code = #112512-9
* group.element[=].target.display = "Adult emergency department beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultTotalOccupied
* group.element[=].display = "Adult Total Census"
* group.element[=].target.code = #112577-2
* group.element[=].target.display = "Adult inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultTotalUnoccupied
* group.element[=].display = "Adult Total Unoccupied"
* group.element[=].target.code = #112576-4
* group.element[=].target.display = "Adult inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultICULOCOccupied
* group.element[=].display = "Adult ICU-LOC Census"
* group.element[=].target.code = #112573-1
* group.element[=].target.display = "Adult intensive care unit (level of care) beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultICUOccupied
* group.element[=].display = "Adult ICU Census"
* group.element[=].target.code = #112575-6
* group.element[=].target.display = "Adult intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultICUUnoccupied
* group.element[=].display = "Adult ICU Unoccupied"
* group.element[=].target.code = #112574-9
* group.element[=].target.display = "Adult intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultMTMSOccupied
* group.element[=].display = "Adult MT/MS Census"
* group.element[=].target.code = #112568-1
* group.element[=].target.display = "Adult medicine telemetry and general acute care beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultMTMSUnoccupied
* group.element[=].display = "Adult MT/MS Unoccupied"
* group.element[=].target.code = #112567-3
* group.element[=].target.display = "Adult medicine telemetry and general acute care beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultNonICUOccupied
* group.element[=].display = "Adult Non- ICU Census"
* group.element[=].target.code = #112572-3
* group.element[=].target.display = "Adult non-intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultNonICUUnoccupied
* group.element[=].display = "Adult Non- ICU Unoccupied"
* group.element[=].target.code = #112571-5
* group.element[=].target.display = "Adult non-intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultObsOccupied
* group.element[=].display = "Adult OBS Census"
* group.element[=].target.code = #112566-5
* group.element[=].target.display = "Adult observation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultObsUnoccupied
* group.element[=].display = "Adult OBS Unoccupied"
* group.element[=].target.code = #112565-7
* group.element[=].target.display = "Adult observation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultPCUOccupied
* group.element[=].display = "Adult PCU Census"
* group.element[=].target.code = #112570-7
* group.element[=].target.display = "Adult progressive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultPCUUnoccupied
* group.element[=].display = "Adult PCU Unoccupied"
* group.element[=].target.code = #112569-9
* group.element[=].target.display = "Adult progressive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AllBedsOccupied
* group.element[=].display = "All Beds Census"
* group.element[=].target.code = #112579-8
* group.element[=].target.display = "All inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AllBedsUnoccupied
* group.element[=].display = "All Beds Unoccupied"
* group.element[=].target.code = #112578-0
* group.element[=].target.display = "All inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #BurnOccupied
* group.element[=].display = "Burn Bed Census"
* group.element[=].target.code = #112516-0
* group.element[=].target.display = "Burn beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #BurnUnoccupied
* group.element[=].display = "Burn Bed Unoccupied"
* group.element[=].target.code = #112515-2
* group.element[=].target.display = "Burn beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #TotalEDAdmittedCensus
* group.element[=].display = "Total ED Admitted Census"
* group.element[=].target.code = #112507-9
* group.element[=].target.display = "Emergency department beds-admitted"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #TotalEDCensus
* group.element[=].display = "Total ED Census"
* group.element[=].target.code = #112508-7
* group.element[=].target.display = "Emergency department beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NegativePressureOccupied
* group.element[=].display = "Neg Pressure Bed Census"
* group.element[=].target.code = #112514-5
* group.element[=].target.display = "Negative pressure beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NegativePressureUnoccupied
* group.element[=].display = "Neg Pressure Unoccupied"
* group.element[=].target.code = #112513-7
* group.element[=].target.display = "Negative pressure beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsEDAdmittedCensus
* group.element[=].display = "Peds ED Admitted Census"
* group.element[=].target.code = #112509-5
* group.element[=].target.display = "Pediatric emergency department beds-admitted"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsEDTotalCensus
* group.element[=].display = "Peds ED Total Census"
* group.element[=].target.code = #112510-3
* group.element[=].target.display = "Pediatric emergency department beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsTotalOccupied
* group.element[=].display = "Peds Total Census"
* group.element[=].target.code = #112564-0
* group.element[=].target.display = "Pediatric inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsTotalUnoccupied
* group.element[=].display = "Peds Total Unoccupied"
* group.element[=].target.code = #112563-2
* group.element[=].target.display = "Pediatric inpatient beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsICULOCOccupied
* group.element[=].display = "Peds ICU- LOC Census"
* group.element[=].target.code = #112560-8
* group.element[=].target.display = "Pediatric intensive care unit (level of care) beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsICUOccupied
* group.element[=].display = "Peds ICU Census"
* group.element[=].target.code = #112562-4
* group.element[=].target.display = "Pediatric intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsICUUnoccupied
* group.element[=].display = "Peds ICU Unoccupied"
* group.element[=].target.code = #112561-6
* group.element[=].target.display = "Pediatric intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsMTMSOccupied
* group.element[=].display = "Peds MT/MS Census"
* group.element[=].target.code = #112555-8
* group.element[=].target.display = "Pediatric medicine telemetry and general acute care beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsMTMSUnoccupied
* group.element[=].display = "Peds MT/MS Unoccupied"
* group.element[=].target.code = #112554-1
* group.element[=].target.display = "Pediatric medicine telemetry and general acute care beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsNonICUOccupied
* group.element[=].display = "Peds Non- ICU Census"
* group.element[=].target.code = #112559-0
* group.element[=].target.display = "Pediatric non-intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsNonICUUnoccupied
* group.element[=].display = "Peds Non- ICU Unoccupied"
* group.element[=].target.code = #112558-2
* group.element[=].target.display = "Pediatric non-intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsObsOccupied
* group.element[=].display = "Peds OBS Census"
* group.element[=].target.code = #112553-3
* group.element[=].target.display = "Pediatric observation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsObsUnoccupied
* group.element[=].display = "Peds OBS Unoccupied"
* group.element[=].target.code = #112552-5
* group.element[=].target.display = "Pediatric observation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsPCUOccupied
* group.element[=].display = "Peds PCU Census"
* group.element[=].target.code = #112557-4
* group.element[=].target.display = "Pediatric progressive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsPCUUnoccupied
* group.element[=].display = "Peds PCU Unoccupied"
* group.element[=].target.code = #112556-6
* group.element[=].target.display = "Pediatric progressive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultPsychOccupied
* group.element[=].display = "Specialty Adult Psych Census"
* group.element[=].target.code = #112531-9
* group.element[=].target.display = "Specialty adult psychiatric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #AdultPsychUnoccupied
* group.element[=].display = "Specialty Adult Psych Unoccupied"
* group.element[=].target.code = #112530-1
* group.element[=].target.display = "Specialty adult psychiatric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SpecialtyTotalOccupied
* group.element[=].display = "Specialty Total Census"
* group.element[=].target.code = #112551-7
* group.element[=].target.display = "Specialty beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SpecialtyTotalUnoccupied
* group.element[=].display = "Specialty Total Unoccupied"
* group.element[=].target.code = #112550-9
* group.element[=].target.display = "Specialty beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU1Occupied
* group.element[=].display = "Specialty NICU 1 Census"
* group.element[=].target.code = #112533-5
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 1"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU1Unoccupied
* group.element[=].display = "Specialty NICU 1 Unoccupied"
* group.element[=].target.code = #112532-7
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 1"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU2Occupied
* group.element[=].display = "Specialty NICU 2 Census"
* group.element[=].target.code = #112537-6
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 2"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU2Unoccupied
* group.element[=].display = "Specialty NICU 2 Unoccupied"
* group.element[=].target.code = #112536-8
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 2"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU3PlusOccupied
* group.element[=].display = "Specialty NICU 3 Plus Census"
* group.element[=].target.code = #112540-0
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 3 plus beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU3Unoccupied
* group.element[=].display = "Specialty NICU 3 Plus Unoccupied"
* group.element[=].target.code = #112541-8
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 3 plus beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU3Occupied
* group.element[=].display = "Specialty NICU 3 Census"
* group.element[=].target.code = #112538-4
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 3"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU3PlusUnoccupied
* group.element[=].display = "Specialty NICU 3 Unoccupied"
* group.element[=].target.code = #112539-2
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 3"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU4Occupied
* group.element[=].display = "Specialty NICU 4 Census"
* group.element[=].target.code = #112543-4
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 4 beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICU4Unoccupied
* group.element[=].display = "Specialty NICU 4 Unoccupied"
* group.element[=].target.code = #112542-6
* group.element[=].target.display = "Specialty neonatal intensive care unit-level 4 beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICUTotalOccupied
* group.element[=].display = "Specialty NICU Total Census"
* group.element[=].target.code = #112545-9
* group.element[=].target.display = "Specialty neonatal intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NICUTotalUnoccupied
* group.element[=].display = "Specialty NICU Total Unoccupied"
* group.element[=].target.code = #112544-2
* group.element[=].target.display = "Specialty neonatal intensive care unit beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SpecialtyNonCribOccupied
* group.element[=].display = "Specialty (Non-Crib) Census"
* group.element[=].target.code = #112549-1
* group.element[=].target.display = "Specialty non-crib beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SpecialtyNonCribUnoccupied
* group.element[=].display = "Specialty (Non-Crib) Unoccupied"
* group.element[=].target.code = #112548-3
* group.element[=].target.display = "Specialty non-crib beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NurseryOccupied
* group.element[=].display = "Specialty Nursery Census"
* group.element[=].target.code = #112535-0
* group.element[=].target.display = "Specialty nursery beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #NurseryUnoccupied
* group.element[=].display = "Specialty Nursery Unoccupied"
* group.element[=].target.code = #112534-3
* group.element[=].target.display = "Specialty nursery beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #OBOccupied
* group.element[=].display = "Specialty OB Census"
* group.element[=].target.code = #112547-5
* group.element[=].target.display = "Specialty obstetric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #OBUnoccupied
* group.element[=].display = "Specialty OB Unoccupied"
* group.element[=].target.code = #112546-7
* group.element[=].target.display = "Specialty obstetric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsPsychOccupied
* group.element[=].display = "Specialty Peds Psych Census"
* group.element[=].target.code = #112529-3
* group.element[=].target.display = "Specialty pediatric psychiatric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #PedsPsychUnoccupied
* group.element[=].display = "Specialty Peds Psych Unoccupied"
* group.element[=].target.code = #112528-5
* group.element[=].target.display = "Specialty pediatric psychiatric beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #RehabOccupied
* group.element[=].display = "Specialty Rehab Census"
* group.element[=].target.code = #112527-7
* group.element[=].target.display = "Specialty rehabilitation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #RehabUnoccupied
* group.element[=].display = "Specialty Rehab Unoccupied"
* group.element[=].target.code = #112526-9
* group.element[=].target.display = "Specialty rehabilitation beds"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveTotalOccupied
* group.element[=].display = "Surge Total Active Census"
* group.element[=].target.code = #112525-1
* group.element[=].target.display = "Surge-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveTotalUnoccupied
* group.element[=].display = "Surge Total Active Unoccupied"
* group.element[=].target.code = #112524-4
* group.element[=].target.display = "Surge-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeInactiveTotalUnoccupied
* group.element[=].display = "Surge Total Inactive Unoccupied"
* group.element[=].target.code = #112523-6
* group.element[=].target.display = "Surge-inactive"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveICUOccupied
* group.element[=].display = "Surge ICU Active Census"
* group.element[=].target.code = #112522-8
* group.element[=].target.display = "Surge intensive care unit beds-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveICUUnoccupied
* group.element[=].display = "Surge ICU Active Unoccupied"
* group.element[=].target.code = #112521-0
* group.element[=].target.display = "Surge intensive care unit beds-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeInactiveICUUnoccupied
* group.element[=].display = "Surge ICU Inactive Unoccupied"
* group.element[=].target.code = #112520-2
* group.element[=].target.display = "Surge intensive care unit beds-inactive"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveNonICUOccupied
* group.element[=].display = "Surge Non- ICU Active Census"
* group.element[=].target.code = #112519-4
* group.element[=].target.display = "Surge non-intensive care unit beds-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeActiveNonICUUnoccupied
* group.element[=].display = "Surge Non- ICU Active Unoccupied"
* group.element[=].target.code = #112518-6
* group.element[=].target.display = "Surge non-intensive care unit beds-active"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."
* group.element[+].code = #SurgeInactiveNonICUUnoccupied
* group.element[=].display = "Surge Non- ICU Inactive Unoccupied"
* group.element[=].target.code = #112517-8
* group.element[=].target.display = "Surge non-intensive care unit beds-inactive"
* group.element[=].target.equivalence = #equivalent
* group.element[=].target.comment = "Maps the HL7 US SAFR ballot example bed capacity code to the final LOINC code to use."