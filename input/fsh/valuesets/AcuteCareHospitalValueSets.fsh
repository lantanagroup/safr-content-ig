ValueSet: AcuteCareHospitalEncounterStatus
Id: ach-encounter-status
Title: "Acute Care Hospital Encounter Status ValueSet"
Description: "Acute Care Hospital Encounter Status ValueSet"
* $encounter-status#in-progress	"In Progress"
* $encounter-status#finished "Finished"
* $encounter-status#triaged "Triaged"
* $encounter-status#onleave "On Leave" 
* $encounter-status#entered-in-error "Entered in Error"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false



ValueSet: AcuteCareHospitalEncounterClass
Id: ach-encounter-class
Title: "Acute Care Hospital Encounter Class ValueSet"
Description: "Acute Care Hospital Encounter Class ValueSet"
* $v3-ActCode#EMER	"emergency"
* $v3-ActCode#ACUTE	"inpatient acute"
* $v3-ActCode#IMP	"inpatient encounter"
* $v3-ActCode#NONAC	"inpatient non-acute"
* $v3-ActCode#OBSENC	"observation encounter"
* $v3-ActCode#SS	"short stay"
* ^copyright = "This Valueset is not copyrighted."
* ^experimental = false
