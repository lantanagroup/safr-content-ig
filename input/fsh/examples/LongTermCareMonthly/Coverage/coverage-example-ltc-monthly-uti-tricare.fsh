Instance: coverage-example-ltc-monthly-uti-tricare
InstanceOf: LongTermCareMonthlyReportingCoverage
Title: "Coverage - Example LTC Monthly Pneumonia - Medicare"
Description: "Coverage - Example LTC Monthly Pneumonia - Medicare"
Usage: #example
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "335522612"
* status = #active
* type = $v3-ActCode#311 "Tricare"
* subscriberId = "123123123123"
* beneficiary = Reference(patient-example-ach-monthly-pass1)
* relationship = $subscriber-relationship#child "Child"
* relationship.text = "Child"
* period.start = "2020-08-01"
* payor.display = "Tricare (Champus)"
* payor = Reference(organization-coverage-example-ltc-monthly-medicare)
