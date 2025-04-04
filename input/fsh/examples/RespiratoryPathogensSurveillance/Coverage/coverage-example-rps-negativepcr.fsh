Instance: coverage-example-rps-negativepcr
InstanceOf: Coverage
Title: "Coverage - RPS Daily Condition Example Negative PCR"
Description: "Coverage - Example RPS Daily Condition Negative PCR"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "88800933501"
* status = #active
* type = $v3-ActCode#SUBSIDIZ "subsidized health program"
* type.text = "MEDICAID"
* subscriberId = "123456789"
* beneficiary.reference = "Patient/patient-example-rps-negativepcr"
* relationship = $subscriber-relationship#self
* relationship.text = "Self"
* period.start = "2023-01-01"
* payor.display = "Medicaid Coverage"
* class[0].type = $coverage-class#group "Group"
* class[=].type.text = "Medicaid"
* class[=].value = "Medicaid"
* class[=].name = "Medicaid"