Instance: coverage-example-ach-pass2
InstanceOf: AcuteCareHospitalReportingCoverage
Title: "Coverage - Example ACH Pass2"
Description: "Coverage - Example ACH Pass2 - Commercial HMO"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "93565936"
* status = #active
* type = $v3-ActCode#HMO "health maintenance organization policy"
* subscriberId = "89345743"
* beneficiary = Reference(patient-example-ach-ach-pass2)
* relationship = $subscriber-relationship#self "Self"
* payor.display = "PayerComm"
