Instance: coverage-example-sameresultdiffday
InstanceOf: AcuteCareHospitalMonthlyReportingCoverage
Title: "Coverage - Coverage Example Sameresultdiffday"
Description: "Coverage - Example Coverage Sameresultdiffday"
Usage: #example
* meta.profile[1] = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/hypoglycemic-reporting-coverage"
* identifier.type = $v2-0203#MB "Member Number"
* identifier.system = "http://example.org/fhir/memberidentifier"
* identifier.value = "88800933501"
* status = #active
* type = $v3-ActCode#PPO "preferred provider organization policy"
* type.text = "PPO"
* subscriberId = "888009335"
* beneficiary.reference = "Patient/patient-example-sameresultdiffday"
* relationship = $subscriber-relationship#self
* relationship.text = "Self"
* period.start = "2020-01-01"
* payor.display = "Acme Health Plan"
* class[0].type = $coverage-class#group "Group"
* class[=].type.text = "An employee group"
* class[=].value = "xyz"
* class[=].name = "XYZ employee Group Plan"
* class[+].type = $coverage-class#plan "Plan"
* class[=].type.text = "A specific suite of benefits."
* class[=].value = "gold"
* class[=].name = "Acme Gold Plan"