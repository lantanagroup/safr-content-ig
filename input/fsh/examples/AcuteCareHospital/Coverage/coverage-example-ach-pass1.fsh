Instance: coverage-example-ach-pass1
InstanceOf: AcuteCareHospitalReportingCoverage
Title: "Coverage - Example ACH Pass1"
Description: "Coverage - Example ACH Pass1 - Medicaid: Child Beneficiary"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "084536836"
* status = #active
* type = $v3-ActCode#SUBSUPP "subsidized supplemental health program"
* policyHolder.display = "Mom Parent"
* subscriberId = "98435938934"
* beneficiary = Reference(patient-example-ach-ach-pass1)
* relationship = $subscriber-relationship#child "Child"
* relationship.text = "Child"
* period.start = "2020-08-01"
* payor.display = "Medicaid"
