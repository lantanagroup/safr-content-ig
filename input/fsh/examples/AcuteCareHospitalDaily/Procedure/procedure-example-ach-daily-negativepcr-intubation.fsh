Instance: procedure-example-ach-daily-negativepcr-intubation
InstanceOf: AcuteCareHospitalDailyEventProcedure
Title: "Procedure - Example ACH Daily Negative PCR Intubation"
Description: "Procedure - Example ACH Daily Negative PCR - Intubation"
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "1000510352"
* status = #completed
* code = $sct#447996002 "Intubation of respiratory tract (procedure)"
* subject = Reference(patient-example-ach-daily-negativepcr)
* subject.display = "ACHDaily NegativePCR"
* encounter = Reference(encounter-example-ach-daily-negativepcr-1)
* encounter.display = "Hospital Admission"
* performedDateTime = "2023-01-02T15:30:00Z"