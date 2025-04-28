Instance: specimen-example-ach-daily-negativepcr-2
InstanceOf: AcuteCareHospitalDailyEventSpecimen
Title: "Specimen - ACH Daily Specimen Example Negative PCR 2"
Description: "Specimen - Example ACH Daily Specimen Negative PCR 2"
Usage: #example

// * type = $v2-0487#NASDR "Drainage, Nasal"
// The "type" description that was previously here does not appear to be correct. It looks like a method type rather than a specimen type. Please verify before reactivating RPS.
// * type.text = "Polymerase chain reaction (PCR)"
* type = $sct#168141000 "Nasal fluid specimen (specimen)"
* type.text = "Nasal fluid specimen (specimen)"
* subject.reference = "Patient/patient-example-ach-daily-negativepcr"
* subject.display = "ACHDaily, NegativePCR"
* receivedTime = "2024-01-02T16:30:00Z"
* collection.collectedDateTime = "2024-01-02T15:45:00Z"
* collection.bodySite = $sct#1825009 "Entire root of nose (body structure)"