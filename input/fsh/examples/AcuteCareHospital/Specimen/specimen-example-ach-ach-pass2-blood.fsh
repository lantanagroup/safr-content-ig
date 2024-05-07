Instance: specimen-example-ach-ach-pass2-blood-1
InstanceOf: AcuteCareHospitalReportingSpecimen
Title: "Specimen - Example ACH Pass2 Blood 1"
Description: "Specimen - Example ACH Pass2 - Blood venous from blood vessel of left upper arm - First encounter collection"
Usage: #example
* identifier[0].system = "urn:oid:2.16.840.1.113883.19.5.1.798.32"
* identifier[=].value = "C104082902"
* identifier[=].assigner.display = "LIS"
* identifier[+].system = "urn:oid:2.16.840.1.113883.19.5.1.798.800"
* identifier[=].value = "C10408290:42"
* type = $v2-0487#BLDV "Blood venous"
* type.text = "Blood venous"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass1 ACH"
* receivedTime = "2024-01-31T22:50:00-05:00"
* collection.collectedDateTime = "2024-01-31T22:42:00-05:00"
* collection.bodySite = $sct#1255295007 "Structure of blood vessel of left upper arm (body structure)"


Instance: specimen-example-ach-ach-pass2-blood-2
InstanceOf: AcuteCareHospitalReportingSpecimen
Title: "Specimen - Example ACH Pass2 Blood 2"
Description: "Specimen - Example ACH Pass2 - Blood venous from blood vessel of left upper arm - Second encounter collection"
Usage: #example
* identifier[0].system = "urn:oid:2.16.840.1.113883.19.5.1.798.32"
* identifier[=].value = "C104082902"
* identifier[=].assigner.display = "LIS"
* identifier[+].system = "urn:oid:2.16.840.1.113883.19.5.1.798.800"
* identifier[=].value = "C10408290:42"
* type = $v2-0487#BLDV "Blood venous"
* type.text = "Blood venous"
* subject = Reference(patient-example-ach-ach-pass2)
* subject.display = "Pass1 ACH"
* receivedTime = "2024-02-02T11:26:00-05:00"
* collection.collectedDateTime = "2024-02-02T11:24:00-05:00"
* collection.bodySite = $sct#1255295007 "Structure of blood vessel of left upper arm (body structure)"