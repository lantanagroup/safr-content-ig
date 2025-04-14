Instance: coverage-example-ach-monthly-pass2
InstanceOf: AcuteCareHospitalMonthlyReportingCoverage
Title: "Coverage - Example ACH Monthly Pass2"
Description: "Coverage - Example ACH Monthly Pass2 - Commercial HMO"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "93565936"
* status = #active
* type = $v3-ActCode#HMO "health maintenance organization policy"
* subscriberId = "89345743"
* beneficiary = Reference(patient-example-ach-monthly-pass2)
* relationship = $subscriber-relationship#self "Self"
* payor.display = "PayerComm"
