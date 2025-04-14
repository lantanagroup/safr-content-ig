Instance: coverage-example-ach-daily-initialpopulationpass
InstanceOf: Coverage
Title: "Coverage - ACH Daily Condition Example Initial Population Pass"
Description: "Coverage - Example ACH Daily Condition Initial Population Pass"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "88800933501"
* status = #active
* type = $v3-ActCode#SUBSIDIZ "subsidized health program"
* type.text = "MEDICARE"
* subscriberId = "123456789"
* beneficiary.reference = "Patient/patient-example-ach-daily-initialpopulationpass"
* relationship = $subscriber-relationship#self
* relationship.text = "Self"
* period.start = "2008-07-01"
* payor.display = "Medicare Coverage"
* class[0].type = $coverage-class#group "Group"
* class[=].type.text = "Medicare"
* class[=].value = "Medicare"
* class[=].name = "Medicare"