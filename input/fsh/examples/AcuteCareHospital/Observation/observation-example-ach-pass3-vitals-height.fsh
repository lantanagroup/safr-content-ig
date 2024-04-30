Instance: observation-example-ach-pass3-vitals-height
InstanceOf: AcuteCareHospitalReportingVitalsObservation
Usage: #inline
* status = #final
* category[VSCat] = $observation-category#vital-signs "Vital Signs"
* category[VSCat].text = "Vital Signs"
* code = $loinc#8302-2 "Body height"
* code.text = "Height"
* subject = Reference(patient-example-ach-ach-pass3)
* subject.display = "Pass3 ACH"
* encounter = Reference(encounter-example-ach-ach-pass3-short-stay)
* encounter.display = "Short Stay"
* effectiveDateTime = "2024-02-01T19:21:00-05:00"
* issued = "2024-02-01T19:21:00-05:00"
* valueQuantity = 176.8 'cm' "cm"