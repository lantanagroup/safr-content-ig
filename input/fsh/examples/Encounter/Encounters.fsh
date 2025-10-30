Instance: encounter-example-ach-ach-pass2-emergency
InstanceOf: QICoreEncounter
Title: "Encounter - Example ACH Pass2 - Emergency"
Description: "Encounter - Example ACH Pass2 - Emergency department visit"
Usage: #example
* meta.profile = Canonical(QICoreEncounter|6.0.0)
* identifier.use = #usual
* identifier.system = "http://example.org/identifiers/698.8"
* identifier.value = "10005104252a"
* status = #triaged
* class = $v3-ActCode#EMER "emergency"
* type = $sct#4525004 "Emergency department patient visit"
* type.text = "Emergency department patient visit"
* subject = Reference(ed-pat-1)
* subject.display = "Pass2 ACH"
* period.start = "2025-01-31T02:35:00-05:00"
* location[0].location.display = "ACH Emergency Department"
* location[=].location = Reference(EDBed1)