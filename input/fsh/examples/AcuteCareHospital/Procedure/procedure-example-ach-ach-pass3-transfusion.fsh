Instance: procedure-example-ach-ach-pass3-transfusion
InstanceOf: AcuteCareHospitalReportingProcedure
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "100051035264"
* status = #completed
* code = $sct#116863004 "Transfusion of red blood cells (procedure)"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-acute)
* encounter.display = "Critical care visit"
* performedDateTime = "2024-02-02T20:43:00-05:00"
