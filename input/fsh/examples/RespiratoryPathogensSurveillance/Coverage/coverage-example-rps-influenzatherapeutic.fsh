Instance: coverage-example-rps-influenzatherapeutic
InstanceOf: Coverage
Title: "Coverage - RPS Daily Condition Example Influenza Therapeutic"
Description: "Coverage - Example RPS Daily Condition Influenza Therapeutic"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "88800933501"
* status = #active
* type = $v3-ActCode#PPO "preferred provider organization policy"
* type.text = "PPO"
* subscriberId = "123456789"
* beneficiary.reference = "Patient/patient-example-rps-influenzatherapeutic"
* relationship = $subscriber-relationship#self
* relationship.text = "Self"
* period.start = "2023-01-01"
* payor.display = "United Healthcare"
* class[0].type = $coverage-class#group "Group"
* class[=].type.text = "PPO"
* class[=].value = "United Healthcare"
* class[=].name = "United Healthcare"