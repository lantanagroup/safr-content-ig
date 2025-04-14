Instance: coverage-example-ach-monthly-pass1
InstanceOf: AcuteCareHospitalMonthlyReportingCoverage
Title: "Coverage - Example ACH Monthly Pass1"
Description: "Coverage - Example ACH Monthly Pass1 - Medicaid: Child Beneficiary"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "084536836"
* status = #active
* type = $v3-ActCode#SUBSIDIZ "subsidized health program"
* policyHolder.display = "Mom Parent"
* subscriberId = "98435938934"
* beneficiary = Reference(patient-example-ach-monthly-pass1)
* relationship = $subscriber-relationship#child "Child"
* relationship.text = "Child"
* period.start = "2020-08-01"
* payor.display = "Medicaid"
