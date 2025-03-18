Instance: specimen-example-rps-rsvlabbtg
InstanceOf: RespiratoryPathogensSurveillanceEventSpecimen
Title: "Specimen - RPS Daily Specimen Example RSV Lab BTG"
Description: "Specimen - Example RPS Daily Specimen RSV Lab BTG"
Usage: #example

//* type = $v2-0487#NASDR "Drainage, Nasal"
//* type.text = "Nasopharyngeal (NP) swab"
* type = $sct#258500001 "Nasopharyngeal swab (specimen)"
* type.text = "Nasopharyngeal swab (specimen)"

* subject.reference = "Patient/patient-example-rps-rsvlabbtg"
* subject.display = "RPS, RSVLabBTG"
* receivedTime = "2024-01-01T15:00:00Z"
* collection.collectedDateTime = "2024-01-01T14:00:00Z"
* collection.bodySite = $sct#1825009 "Entire root of nose (body structure)"