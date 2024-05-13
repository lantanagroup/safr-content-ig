Instance: coverage-example-ach-pass3
InstanceOf: AcuteCareHospitalReportingCoverage
Title: "Coverage - Example ACH Pass3"
Description: "Coverage - Example ACH Pass3 - Commercial PPO"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "0945345"
* status = #active
* type = $v3-ActCode#PPO "preferred provider organization policy"
* subscriberId = "7843574536"
* beneficiary = Reference(patient-example-ach-ach-pass3)
* relationship = $subscriber-relationship#self "Self"
* payor.display = "Nation First Health Care"
