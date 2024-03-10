Instance: procedure-example-ach-ach-pass1-central-line
InstanceOf: AcuteCareHospitalReportingProcedure
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "1000510352"
* status = #completed
* code = $sct#312052002 "Placement procedure (procedure)"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-ach-pass1)
* encounter.display = "Hospital Admission"
* performedDateTime = "2024-02-02T18:12:00-05:00"