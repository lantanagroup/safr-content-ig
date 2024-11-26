ValueSet: RespiratoryPathogensSurveillanceEventEncounterStatus
Id: rps-encounter-status
Title: "Respiratory Pathogens Surveillance Event Encounter Status ValueSet"
Description: "A set of codes indicating the status of the encounter."
* $encounter-status#in-progress	"In Progress"
* $encounter-status#finished "Finished"
* $encounter-status#triaged "Triaged"
* $encounter-status#onleave "On Leave" 
* $encounter-status#entered-in-error "Entered in Error"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false



ValueSet: RespiratoryPathogensSurveillanceEventEncounterClass
Id: rps-encounter-class
Title: "Respiratory Pathogens Surveillance Encounter Class ValueSet"
Description: "A set of codes indicating the encounter class that represent inpatient, observation and short stay concepts."
* $v3-ActCode#ACUTE	"inpatient acute"
* $v3-ActCode#IMP	"inpatient encounter"
* $v3-ActCode#NONAC	"inpatient non-acute"
* $v3-ActCode#OBSENC	"observation encounter"
* $v3-ActCode#SS	"short stay"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false
