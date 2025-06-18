ValueSet: AcuteCareHospitalMonthlyEncounterStatus
Id: ach-monthly-encounter-status
Title: "ACH Monthly Encounter Status ValueSet"
Description: "A set of codes indicating the status of the encounter."
* $encounter-status#in-progress	"In Progress"
* $encounter-status#finished "Finished"
* $encounter-status#triaged "Triaged"
* $encounter-status#onleave "On Leave" 
* $encounter-status#entered-in-error "Entered in Error"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false



ValueSet: AcuteCareHospitalMonthlyEncounterClass
Id: ach-monthly-encounter-class
Title: "ACH Monthly Encounter Class ValueSet"
Description: "A set of codes indicating the encounter class that represent inpatient, emergency, observation and short stay concepts."
* $v3-ActCode#EMER	"emergency"
* $v3-ActCode#ACUTE	"inpatient acute"
* $v3-ActCode#IMP	"inpatient encounter"
* $v3-ActCode#NONAC	"inpatient non-acute"
* $v3-ActCode#OBSENC	"observation encounter"
* $v3-ActCode#SS	"short stay"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false
