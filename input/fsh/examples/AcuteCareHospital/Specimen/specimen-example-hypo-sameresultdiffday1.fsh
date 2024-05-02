Instance: specimen-example-hypo-sameresultdiffday1
InstanceOf: AcuteCareHospitalReportingSpecimen
Title: "Specimen - Hypo Specimen Example Sameresultdiffday 1"
Description: "Specimen - Example Hypo Specimen Sameresultdiffday 1"
Usage: #example
* identifier[0].system = "urn:oid:2.16.840.1.113883.19.5.1.798.32"
* identifier[=].value = "C10408290"
* identifier[=].assigner.display = "LIS"
* identifier[+].system = "urn:oid:2.16.840.1.113883.19.5.1.798.800"
* identifier[=].value = "C10408290:4"
* type = $v2-0487#STL "Stool = Fecal"
* type.text = "C. difficile PCR and Toxin"
* subject.reference = "Patient/patient-example-sameresultdiffday"
* subject.display = "Hypo, Sameresultdiffday"
* receivedTime = "2023-01-04T22:06:00Z"
* collection.collectedDateTime = "2023-01-04T20:39:00Z"
* collection.bodySite = $sct#181261002 "Entire rectum (body structure)"