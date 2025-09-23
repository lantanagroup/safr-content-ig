Instance: observation-example-ach-monthly-pass2-poc-1
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Example ACH Monthly Pass2 Poc 1"
Description: "Observation - Example ACH Monthly Pass2 Lab: Glucose in Capillary blood by Glucometer - First Encounter Observation"
Usage: #example
* status = #final
* basedOn = Reference(servicerequest-example-ach-monthly-pass2-glucose)
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose"
* subject = Reference(patient-example-ach-monthly-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-01-31T23:01:00-05:00"
* issued = "2024-01-31T23:02:00-05:00"
* valueQuantity = 53 'g/dL' "d/gL"


Instance: observation-example-ach-monthly-pass2-poc-2
InstanceOf: AcuteCareHospitalMonthlyReportingLabObservation
Title: "Observation - Example ACH Monthly Pass2 Poc 2"
Description: "Observation - Example ACH Monthly Pass2 Lab: Glucose in Capillary blood by Glucometer - Second Encounter Observation"
Usage: #example
* status = #final
* basedOn = Reference(servicerequest-example-ach-monthly-pass2-glucose)
* category[us-core] = $observation-category#laboratory "Laboratory"
* category[us-core].text = "Laboratory"
* code = $loinc#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
* code.text = "Glucose"
* subject = Reference(patient-example-ach-monthly-pass2)
* subject.display = "Pass2 ACH"
* encounter = Reference(encounter-example-ach-monthly-pass2-inpatient)
* encounter.display = "Hospital Admission"
* effectiveDateTime = "2024-02-02T10:14:00-05:00"
* issued = "2024-02-02T10:15:00-05:00"
* valueQuantity = 105 'g/dL' "d/gL"


