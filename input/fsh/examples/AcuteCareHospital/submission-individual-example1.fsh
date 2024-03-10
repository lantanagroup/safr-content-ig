Instance: bundle-example-ach-header
InstanceOf: NHSNSubmissionHeaderBundle
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e9"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/Organization/organization-example-submitting-organization"
* entry[=].resource = organization-example-submitting-organization
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-submitting-device"
* entry[=].resource = device-example-submitting-device
* entry[+].fullUrl = "http://nhsnlink.org/fhir/List/list-example-ach-patients-of-interest"
* entry[=].resource = list-example-ach-patients-of-interest
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-ach-subjectlist1"
* entry[=].resource = measurereport-example-ach-subjectlist1


Instance: bundle-example-ach-subject-ach-pass1
InstanceOf: NHSNSubjectBundle
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e1"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-ach-pass1"
* entry[=].resource = measurereport-example-individual-ach-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-ach-pass1"
* entry[=].resource = patient-example-ach-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-ach-pass1"
* entry[=].resource = patient-example-ach-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-ach-pass1"
* entry[=].resource = encounter-example-ach-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-pass1"
* entry[=].resource = coverage-example-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-pass1"
* entry[=].resource = condition-example-diagnosis-ach-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-ach-pass1-central-line"
* entry[=].resource = device-example-ach-ach-pass1-central-line
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass1-vancomycin"
* entry[=].resource = medicationadministration-example-ach-pass1-vancomycin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass1-vancomycin"
* entry[=].resource = medicationrequest-example-ach-pass1-vancomycin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass1-blood"
* entry[=].resource = observation-example-ach-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass1-csf"
* entry[=].resource = observation-example-ach-pass1-csf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass1-gestational-age"
* entry[=].resource = observation-example-ach-pass1-gestational-age
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass1-vitals-weight"
* entry[=].resource = observation-example-ach-pass1-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-ach-pass1-central-line"
* entry[=].resource = procedure-example-ach-ach-pass1-central-line
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-ach-pass1-lumbar"
* entry[=].resource = procedure-example-ach-ach-pass1-lumbar
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass1-blood"
* entry[=].resource = servicerequest-example-ach-ach-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass1-csf"
* entry[=].resource = servicerequest-example-ach-ach-pass1-csf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-ach-pass1-blood"
* entry[=].resource = specimen-example-ach-ach-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-ach-pass1-csf"
* entry[=].resource = specimen-example-ach-ach-pass1-csf



Instance: bundle-example-ach-subject-ach-pass2
InstanceOf: NHSNSubjectBundle
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e1"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-ach-pass2"
* entry[=].resource = measurereport-example-individual-ach-ach-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-ach-pass2"
* entry[=].resource = patient-example-ach-ach-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-ach-pass2-emergency"
* entry[=].resource = encounter-example-ach-ach-pass2-emergency
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-ach-pass2-inpatient"
* entry[=].resource = encounter-example-ach-ach-pass2-inpatient
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-pass2"
* entry[=].resource = coverage-example-ach-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-pass2-problem"
* entry[=].resource = condition-example-diagnosis-ach-pass2-problem
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-pass2"
* entry[=].resource = condition-example-diagnosis-ach-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-ach-pass2-compress-hose"
* entry[=].resource = device-example-ach-ach-pass2-compress-hose
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Diagnosticreport/diagnosticreport-example-ach-ach-pass2-radiology"
* entry[=].resource = diagnosticreport-example-ach-ach-pass2-radiology
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-dex4"
* entry[=].resource = medicationadministration-example-ach-pass2-dex4
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-heparin-1"
* entry[=].resource = medicationadministration-example-ach-pass2-heparin-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-heparin-2"
* entry[=].resource = medicationadministration-example-ach-pass2-heparin-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-insulin-lispro-1"
* entry[=].resource = medicationadministration-example-ach-pass2-insulin-lispro-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-insulin-lispro-2"
* entry[=].resource = medicationadministration-example-ach-pass2-insulin-lispro-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-insulin-lispro-3"
* entry[=].resource = medicationadministration-example-ach-pass2-insulin-lispro-3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass2-insulin-lispro-4"
* entry[=].resource = medicationadministration-example-ach-pass2-insulin-lispro-4
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass2-dex4-tablet"
* entry[=].resource = medicationrequest-example-ach-pass2-dex4-tablet
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass2-heparin"
* entry[=].resource = medicationrequest-example-ach-pass2-heparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass2-insulin-lispro"
* entry[=].resource = medicationrequest-example-ach-pass2-insulin-lispro
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass2-metformin"
* entry[=].resource = medicationrequest-example-ach-pass2-metformin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-aptt"
* entry[=].resource = observation-example-ach-pass2-aptt
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-poc-1"
* entry[=].resource = observation-example-ach-pass2-poc-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-poc-2"
* entry[=].resource = observation-example-ach-pass2-poc-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-hemo-a1c"
* entry[=].resource = observation-example-ach-pass2-hemo-a1c
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-hemo"
* entry[=].resource = observation-example-ach-pass2-hemo
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass2-vitals-weight"
* entry[=].resource = observation-example-ach-pass2-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-ach-pass2-ivcf"
* entry[=].resource = procedure-example-ach-ach-pass2-ivcf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass2-aptt"
* entry[=].resource = servicerequest-example-ach-ach-pass2-aptt
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass2-glucose"
* entry[=].resource = servicerequest-example-ach-ach-pass2-glucose
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass2-hemo-a1c"
* entry[=].resource = servicerequest-example-ach-ach-pass2-hemo-a1c
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass2-hemo"
* entry[=].resource = servicerequest-example-ach-ach-pass2-hemo
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-ach-pass2-blood-1"
* entry[=].resource = specimen-example-ach-ach-pass2-blood-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-ach-pass2-blood-2"
* entry[=].resource = specimen-example-ach-ach-pass2-blood-2




Instance: bundle-example-ach-subject-ach-pass3
InstanceOf: NHSNSubjectBundle
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e2"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-ach-pass3"
* entry[=].resource = measurereport-example-individual-ach-ach-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-ach-pass3"
* entry[=].resource = patient-example-ach-ach-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-ach-pass3-acute"
* entry[=].resource = encounter-example-ach-ach-pass3-acute
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-ach-pass3-short-stay"
* entry[=].resource = encounter-example-ach-ach-pass3-short-stay
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-pass3"
* entry[=].resource = coverage-example-ach-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-pass3-problem"
* entry[=].resource = condition-example-diagnosis-ach-pass3-problem
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-pass3"
* entry[=].resource = condition-example-diagnosis-ach-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-ach-pass3-ivcs-pump"
* entry[=].resource = device-example-ach-ach-pass3-ivcs-pump
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass3-enoxaparin"
* entry[=].resource = medicationadministration-example-ach-pass3-enoxaparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass3-metronidazole-1"
* entry[=].resource = medicationadministration-example-ach-pass3-metronidazole-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass3-metronidazole-2"
* entry[=].resource = medicationadministration-example-ach-pass3-metronidazole-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationadministration/medicationadministration-example-ach-pass3-metronidazole-3"
* entry[=].resource = medicationadministration-example-ach-pass3-metronidazole-3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass3-cipro"
* entry[=].resource = medicationrequest-example-ach-pass3-cipro
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass3-enoxaparin"
* entry[=].resource = medicationrequest-example-ach-pass3-enoxaparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Medicationrequest/medicationrequest-example-ach-pass3-metronidazole"
* entry[=].resource = medicationrequest-example-ach-pass3-metronidazole
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass3-cdiff"
* entry[=].resource = observation-example-ach-pass3-cdiff
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass3-vitals-height"
* entry[=].resource = observation-example-ach-pass3-vitals-height
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-pass3-vitals-weight"
* entry[=].resource = observation-example-ach-pass3-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-ach-pass3-transfusion"
* entry[=].resource = procedure-example-ach-ach-pass3-transfusion
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Servicerequest/servicerequest-example-ach-ach-pass3-cdiff"
* entry[=].resource = servicerequest-example-ach-ach-pass3-cdiff
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-ach-pass3-stool"
* entry[=].resource = specimen-example-ach-ach-pass3-stool

