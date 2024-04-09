Instance: procedure-example-ach-ach-pass2-ivcf
InstanceOf: AcuteCareHospitalReportingProcedure
Usage: #inline
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "10005103526"
* status = #completed
* code = $sct#397913009 "Percutaneous insertion of inferior vena cava filter (procedure)"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-ach-pass2-inpatient)
* encounter.display = "Hospital Admission"
* performedDateTime = "2024-02-01T05:02:00-05:00"
