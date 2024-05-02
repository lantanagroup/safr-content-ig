Instance: coverage-example-ach-pass3
InstanceOf: AcuteCareHospitalReportingCoverage
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "0945345"
* status = #active
* type = $v3-ActCode#PPO "preferred provider organization policy"
* subscriberId = "7843574536"
* beneficiary = Reference(patient-example-ach-ach-pass3)
* relationship = $subscriber-relationship#self "Self"
* payor.display = "United Health Care"
