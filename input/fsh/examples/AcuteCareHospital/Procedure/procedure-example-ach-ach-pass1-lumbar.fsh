Instance: procedure-example-ach-ach-pass1-lumbar
InstanceOf: AcuteCareHospitalReportingProcedure
Title: "Procedure - Example ACH Pass1 Lumbar"
Description: "Procedure - Example ACH Pass1 - Drainage of Spinal Canal, Percutaneous Approach, Diagnostic"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "1000510352"
* status = #completed
* code = $icd-10-cm#009U3ZX "Drainage of Spinal Canal, Percutaneous Approach, Diagnostic"
* subject = Reference(patient-example-ach-ach-pass1)
* subject.display = "Pass1 ACH"
* encounter = Reference(encounter-example-ach-ach-pass1)
* encounter.display = "Hospital Admission"
* performedDateTime = "2024-02-02T18:56:00-05:00"
* bodySite = $sct#272005 "Structure of superior articular process of lumbar vertebra (body structure)"
* bodySite.text = "Structure of superior articular process of lumbar vertebra"