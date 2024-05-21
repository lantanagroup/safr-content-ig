Instance: coverage-example-rps-initialpopulationpass
InstanceOf: Coverage
Title: "Coverage - RPS Condition Example Initial Population Pass"
Description: "Coverage - Example RPS Condition Initial Population Pass"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "88800933501"
* status = #active
* type = $v3-ActCode#SUBSIDIZ "subsidized health program"
* type.text = "MEDICARE"
* subscriberId = "123456789"
* beneficiary.reference = "Patient/patient-example-rps-initialpopulationpass"
* relationship = $subscriber-relationship#self
* relationship.text = "Self"
* period.start = "2008-07-01"
* payor.display = "Medicare Coverage"
* class[0].type = $coverage-class#group "Group"
* class[=].type.text = "Medicare"
* class[=].value = "Medicare"
* class[=].name = "Medicare"