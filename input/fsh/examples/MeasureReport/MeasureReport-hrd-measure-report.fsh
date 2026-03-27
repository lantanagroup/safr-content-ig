Instance: HRDMeasureReport
InstanceOf: DEQMIndividualMeasureReportProfile
Title: "MeasureReport - HRD MeasureReport Example"
Description: "This Bundle resource is an example of a Hospital Respiratory Data (HRD) MeasureReport."
Usage: #example
// Basic metadata
* extension[scoring].url = "http://hl7.org/fhir/us/davinci-deqm/StructureDefinition/extension-measureScoring"
* extension[scoring].valueCodeableConcept = $measure-scoring#continuous-variable "Continuous Variable"
* status = $measure-report-status#complete
* type = $measure-report-type#individual
* measure = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/Measure/HRDMeasure|1.0.0"
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
* extension[+].url = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/StructureDefinition/reporting-frequency"
* extension[=].valueCodeableConcept = http://unitsofmeasure.org#d "day"
* extension[+].url = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/StructureDefinition/emergency-activation"
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


///////////// Group numInPtBeds /////////////
* group[+].id = "numInPtBeds-capacity-group"
* group[=].code = HRDCS#numInPtBeds "Number Inpatient Beds"
* group[=].population[+].id = "numInPtBeds-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 100

* group[=].stratifier[+].id = "numConfC19NewAdmUnk-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmUnk 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluNewAdmUnk-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmUnk 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVNewAdmUnk-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmUnk 
* group[=].stratifier[=].stratum[+].value.text = "0"




* group[=].stratifier[+].id = "N95MaskSupplyDays-stratifier"
* group[=].stratifier[=].code = HRDCS#N95MaskSupplyDays 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "surgMaskSupplyDays-stratifier"
* group[=].stratifier[=].code = HRDCS#surgMaskSupplyDays 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "shieldSupplyDays-stratifier"
* group[=].stratifier[=].code = HRDCS#shieldSupplyDays 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "gownSupplyDays-stratifier"
* group[=].stratifier[=].code = HRDCS#gownSupplyDays 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "gloveSupplyDays-stratifier"
* group[=].stratifier[=].code = HRDCS#gloveSupplyDays 
* group[=].stratifier[=].stratum[+].value.text = "0"


* group[=].stratifier[+].id = "N95Mask3DaySupply-stratifier"
* group[=].stratifier[=].code = HRDCS#N95Mask3DaySupply 
* group[=].stratifier[=].stratum[+].value.text = "n"

* group[=].stratifier[+].id = "surgMask3DaySupply-stratifier"
* group[=].stratifier[=].code = HRDCS#surgMask3DaySupply 
* group[=].stratifier[=].stratum[+].value.text = "n"

* group[=].stratifier[+].id = "shield3DaySupply-stratifier"
* group[=].stratifier[=].code = HRDCS#shield3DaySupply 
* group[=].stratifier[=].stratum[+].value.text = "n"

* group[=].stratifier[+].id = "gown3DaySupply-stratifier"
* group[=].stratifier[=].code = HRDCS#gown3DaySupply 
* group[=].stratifier[=].stratum[+].value.text = "n"

* group[=].stratifier[+].id = "glove3DaySupply-stratifier"
* group[=].stratifier[=].code = HRDCS#glove3DaySupply 
* group[=].stratifier[=].stratum[+].value.text = "n"



///////////// Group numInPtBedsAdult /////////////
* group[+].id = "numInPtBedsAdult-capacity-group"
* group[=].code = HRDCS#numInPtBedsAdult 
* group[=].population[+].id = "numInPtBedsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 80

* group[=].stratifier[+].id = "numConfC19HospPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19HospPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluHospPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluHospPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVHospPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVHospPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"


* group[=].stratifier[+].id = "numConfC19NewAdmAdult18to49-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmAdult18to49 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfC19NewAdmAdult50to64-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmAdult50to64 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfC19NewAdmAdult65to74-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmAdult65to74 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfC19NewAdmAdult75plus-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmAdult75plus 
* group[=].stratifier[=].stratum[+].value.text = "0"



* group[=].stratifier[+].id = "numConfFluNewAdmAdult18to49-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmAdult18to49 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluNewAdmAdult50to64-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmAdult50to64 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluNewAdmAdult65to74-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmAdult65to74 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluNewAdmAdult75plus-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmAdult75plus 
* group[=].stratifier[=].stratum[+].value.text = "0"



* group[=].stratifier[+].id = "numConfRSVNewAdmAdult18to49-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmAdult18to49 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVNewAdmAdult50to64-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmAdult50to64 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVNewAdmAdult65to74-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmAdult65to74 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVNewAdmAdult75plus-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmAdult75plus 
* group[=].stratifier[=].stratum[+].value.text = "0"





///////////// Group numInPtBedsPed /////////////
* group[+].id = "numInPtBedsPed-capacity-group"
* group[=].code = HRDCS#numInPtBedsPed 
* group[=].population[+].id = "numInPtBedsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20


* group[=].stratifier[+].id = "numConfC19HospPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19HospPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluHospPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluHospPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVHospPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVHospPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"



* group[=].stratifier[+].id = "numConfC19NewAdmPed0to4-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmPed0to4 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfC19NewAdmPed5to17-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19NewAdmPed5to17 
* group[=].stratifier[=].stratum[+].value.text = "0"


* group[=].stratifier[+].id = "numConfFluNewAdmPed0to4-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmPed0to4 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluNewAdmPed5to17-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluNewAdmPed5to17 
* group[=].stratifier[=].stratum[+].value.text = "0"


* group[=].stratifier[+].id = "numConfRSVNewAdmPed0to4-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmPed0to4 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVNewAdmPed5to17-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVNewAdmPed5to17 
* group[=].stratifier[=].stratum[+].value.text = "0"


///////////// Group numICUBeds /////////////
* group[+].id = "numICUBeds-capacity-group"
* group[=].code = HRDCS#numICUBeds 
* group[=].population[+].id = "numICUBeds-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0


///////////// Group numICUBedsAdult /////////////
* group[+].id = "numICUBedsAdult-capacity-group"
* group[=].code = HRDCS#numICUBedsAdult 
* group[=].population[+].id = "numICUBedsAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0


* group[=].stratifier[+].id = "numConfC19ICUPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19ICUPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluICUPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluICUPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVICUPatsAdult-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVICUPatsAdult 
* group[=].stratifier[=].stratum[+].value.text = "0"


///////////// Group numICUBedsPed /////////////
* group[+].id = "numICUBedsPed-capacity-group"
* group[=].code = HRDCS#numICUBedsPed 
* group[=].population[+].id = "numICUBedsPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

* group[=].stratifier[+].id = "numConfC19ICUPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfC19ICUPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfFluICUPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfFluICUPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"

* group[=].stratifier[+].id = "numConfRSVICUPatsPed-stratifier"
* group[=].stratifier[=].code = HRDCS#numConfRSVICUPatsPed 
* group[=].stratifier[=].stratum[+].value.text = "0"


///////////// Group numInPtBedsOcc /////////////
* group[+].id = "numInPtBedsOcc-capacity-group"
* group[=].code = HRDCS#numInPtBedsOcc 
* group[=].population[+].id = "numInPtBedsOcc-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 100

///////////// Group numInPtBedsOccAdult /////////////
* group[+].id = "numInPtBedsOccAdult-capacity-group"
* group[=].code = HRDCS#numInPtBedsOccAdult 
* group[=].population[+].id = "numInPtBedsOccAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 80

///////////// Group numInPtBedsOccPed /////////////
* group[+].id = "numInPtBedsOccPed-capacity-group"
* group[=].code = HRDCS#numInPtBedsOccPed 
* group[=].population[+].id = "numInPtBedsOccPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 20



///////////// Group numICUBedsOcc /////////////
* group[+].id = "numICUBedsOcc-capacity-group"
* group[=].code = HRDCS#numICUBedsOcc 
* group[=].population[+].id = "numICUBedsOcc-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group numICUBedsOccAdult /////////////
* group[+].id = "numICUBedsOccAdult-capacity-group"
* group[=].code = HRDCS#numICUBedsOccAdult 
* group[=].population[+].id = "numICUBedsOccAdult-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0

///////////// Group numICUBedsOccPed /////////////
* group[+].id = "numICUBedsOccPed-capacity-group"
* group[=].code = HRDCS#numICUBedsOccPed 
* group[=].population[+].id = "numICUBedsOccPed-initial-population"
* group[=].population[=].code = http://terminology.hl7.org/CodeSystem/measure-population#initial-population "Initial Population"
* group[=].population[=].count = 0