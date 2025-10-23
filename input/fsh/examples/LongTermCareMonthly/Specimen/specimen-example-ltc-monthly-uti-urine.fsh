Instance: specimen-example-ltc-monthly-uti-urine
InstanceOf: USCoreSpecimenProfile|6.1.0
Title: "Specimen - Example LTC Monthly UTI - Urine"
Description: "Specimen - Example LTC Monthly UTI - Urine"
Usage: #example
* identifier[0].system = "urn:oid:2.16.840.1.113883.19.5.1.798.32"
* identifier[=].value = "C104082901"
* identifier[=].assigner.display = "LIS"
* identifier[+].system = "urn:oid:2.16.840.1.113883.19.5.1.798.800"
* identifier[=].value = "C10408290:41"
//* type = $v2-0487#BLDV "Blood venous"
//* type.text = "Blood venous"
* type = $sct#122575003 "Urine specimen (specimen)"
* type.text = "Urine specimen"
* subject = Reference(patient-example-ltc-monthly-uti)
* subject.display = "UTI LTC"
* receivedTime = "2024-02-02T18:20:00-05:00"
* collection.collectedDateTime = "2024-02-02T18:12:00-05:00"
* collection.bodySite = $sct#89837001 "Urinary bladder structure"
* collection.bodySite.text = "Urinary Bladder"