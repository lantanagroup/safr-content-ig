// Examples of separated bundles


Instance: bundle-example-ach-monthly-header
InstanceOf: NHSNSubmissionHeaderBundle
Title: "Example ACH Monthly Submission Header Bundle"
Description: "Example Separated ACH Monthly Submission Header Bundle"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e9"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/Organization/organization-example-submitting-organization"
* entry[=].resource = organization-example-submitting-organization
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-submitting-device"
* entry[=].resource = device-example-submitting-device
* entry[+].fullUrl = "http://nhsnlink.org/fhir/List/list-example-ach-monthly-patients-of-interest"
* entry[=].resource = list-example-ach-monthly-patients-of-interest
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-ach-monthly-subjectlist1"
* entry[=].resource = measurereport-example-ach-monthly-subjectlist1


Instance: bundle-example-ach-monthly-subject-ach-pass1
InstanceOf: NHSNSubjectBundle
Title: "Example ACH Monthly Submission Subject Bundle 1"
Description: "Example Separated ACH Monthly Submission Subject Bundle 1 for LOS/MEN"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e1"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-monthly-pass1"
* entry[=].resource = measurereport-example-individual-ach-monthly-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-monthly-pass1"
* entry[=].resource = patient-example-ach-monthly-pass1
//* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-monthly-pass1"
//* entry[=].resource = patient-example-ach-monthly-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-monthly-pass1"
* entry[=].resource = encounter-example-ach-monthly-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-monthly-pass1"
* entry[=].resource = coverage-example-ach-monthly-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-monthly-pass1"
* entry[=].resource = condition-example-diagnosis-ach-monthly-pass1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-monthly-pass1-central-line"
* entry[=].resource = device-example-ach-monthly-pass1-central-line
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass1-vancomycin"
* entry[=].resource = medadmin-example-ach-monthly-pass1-vancomycin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass1-vancomycin"
* entry[=].resource = medicationrequest-example-ach-monthly-pass1-vancomycin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass1-blood"
* entry[=].resource = observation-example-ach-monthly-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass1-csf"
* entry[=].resource = observation-example-ach-monthly-pass1-csf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass1-gestational-age"
* entry[=].resource = observation-example-ach-monthly-pass1-gestational-age
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass1-vitals-weight"
* entry[=].resource = observation-example-ach-monthly-pass1-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-monthly-pass1-central-line"
* entry[=].resource = procedure-example-ach-monthly-pass1-central-line
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-monthly-pass1-lumbar"
* entry[=].resource = procedure-example-ach-monthly-pass1-lumbar
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass1-blood"
* entry[=].resource = servicerequest-example-ach-monthly-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass1-csf"
* entry[=].resource = servicerequest-example-ach-monthly-pass1-csf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-monthly-pass1-blood"
* entry[=].resource = specimen-example-ach-monthly-pass1-blood
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-monthly-pass1-csf"
* entry[=].resource = specimen-example-ach-monthly-pass1-csf



Instance: bundle-example-ach-monthly-subject-ach-pass2
InstanceOf: NHSNSubjectBundle
Title: "Example ACH Monthly Submission Subject Bundle 2"
Description: "Example Separated ACH Monthly Submission Subject Bundle 2 for Hypoglycemia and VTE"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e1"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-monthly-pass2"
* entry[=].resource = measurereport-example-individual-ach-monthly-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-monthly-pass2"
* entry[=].resource = patient-example-ach-monthly-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-monthly-pass2-emergency"
* entry[=].resource = encounter-example-ach-monthly-pass2-emergency
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-monthly-pass2-inpatient"
* entry[=].resource = encounter-example-ach-monthly-pass2-inpatient
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-monthly-pass2"
* entry[=].resource = coverage-example-ach-monthly-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-monthly-pass2-problem"
* entry[=].resource = condition-example-diagnosis-ach-monthly-pass2-problem
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-monthly-pass2"
* entry[=].resource = condition-example-diagnosis-ach-monthly-pass2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-monthly-pass2-compress-hose"
* entry[=].resource = device-example-ach-monthly-pass2-compress-hose
* entry[+].fullUrl = "http://nhsnlink.org/fhir/DiagnosticReport/diagnosticreport-example-ach-monthly-pass2-radiology"
* entry[=].resource = diagnosticreport-example-ach-monthly-pass2-radiology
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-dex4"
* entry[=].resource = medadmin-example-ach-monthly-pass2-dex4
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-heparin-1"
* entry[=].resource = medadmin-example-ach-monthly-pass2-heparin-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-heparin-2"
* entry[=].resource = medadmin-example-ach-monthly-pass2-heparin-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-insulin-lispro-1"
* entry[=].resource = medadmin-example-ach-monthly-pass2-insulin-lispro-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-insulin-lispro-2"
* entry[=].resource = medadmin-example-ach-monthly-pass2-insulin-lispro-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-insulin-lispro-3"
* entry[=].resource = medadmin-example-ach-monthly-pass2-insulin-lispro-3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass2-insulin-lispro-4"
* entry[=].resource = medadmin-example-ach-monthly-pass2-insulin-lispro-4
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass2-dex4-tablet"
* entry[=].resource = medicationrequest-example-ach-monthly-pass2-dex4-tablet
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass2-heparin"
* entry[=].resource = medicationrequest-example-ach-monthly-pass2-heparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass2-insulin-lispro"
* entry[=].resource = medicationrequest-example-ach-monthly-pass2-insulin-lispro
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass2-metformin"
* entry[=].resource = medicationrequest-example-ach-monthly-pass2-metformin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-aptt"
* entry[=].resource = observation-example-ach-monthly-pass2-aptt
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-poc-1"
* entry[=].resource = observation-example-ach-monthly-pass2-poc-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-poc-2"
* entry[=].resource = observation-example-ach-monthly-pass2-poc-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-hemo-a1c"
* entry[=].resource = observation-example-ach-monthly-pass2-hemo-a1c
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-hemo"
* entry[=].resource = observation-example-ach-monthly-pass2-hemo
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass2-vitals-weight"
* entry[=].resource = observation-example-ach-monthly-pass2-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-monthly-pass2-ivcf"
* entry[=].resource = procedure-example-ach-monthly-pass2-ivcf
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass2-aptt"
* entry[=].resource = servicerequest-example-ach-monthly-pass2-aptt
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass2-glucose"
* entry[=].resource = servicerequest-example-ach-monthly-pass2-glucose
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass2-hemo-a1c"
* entry[=].resource = servicerequest-example-ach-monthly-pass2-hemo-a1c
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass2-hemo"
* entry[=].resource = servicerequest-example-ach-monthly-pass2-hemo
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-monthly-pass2-blood-1"
* entry[=].resource = specimen-example-ach-monthly-pass2-blood-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-monthly-pass2-blood-2"
* entry[=].resource = specimen-example-ach-monthly-pass2-blood-2




Instance: bundle-example-ach-monthly-subject-ach-pass3
InstanceOf: NHSNSubjectBundle
Title: "Example ACH Monthly Submission Subject Bundle 3"
Description: "Example Separated ACH Monthly Submission Subject Bundle 3 for CDI and VTE"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:1eaddf4c-2ec0-4dc4-b26f-9586d7a777e2"
* type = #collection
* timestamp = "2024-02-05T21:04:29.481+00:00"
* entry[0].fullUrl = "http://nhsnlink.org/fhir/MeasureReport/measurereport-example-individual-ach-monthly-pass3"
* entry[=].resource = measurereport-example-individual-ach-monthly-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Patient/patient-example-ach-monthly-pass3"
* entry[=].resource = patient-example-ach-monthly-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-monthly-pass3-acute"
* entry[=].resource = encounter-example-ach-monthly-pass3-acute
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Encounter/encounter-example-ach-monthly-pass3-short-stay"
* entry[=].resource = encounter-example-ach-monthly-pass3-short-stay
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Coverage/coverage-example-ach-monthly-pass3"
* entry[=].resource = coverage-example-ach-monthly-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-monthly-pass3-problem"
* entry[=].resource = condition-example-diagnosis-ach-monthly-pass3-problem
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Condition/condition-example-diagnosis-ach-monthly-pass3"
* entry[=].resource = condition-example-diagnosis-ach-monthly-pass3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Device/device-example-ach-monthly-pass3-ivcs-pump"
* entry[=].resource = device-example-ach-monthly-pass3-ivcs-pump
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass3-enoxaparin"
* entry[=].resource = medadmin-example-ach-monthly-pass3-enoxaparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass3-metronidazole-1"
* entry[=].resource = medadmin-example-ach-monthly-pass3-metronidazole-1
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass3-metronidazole-2"
* entry[=].resource = medadmin-example-ach-monthly-pass3-metronidazole-2
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationAdministration/medadmin-example-ach-monthly-pass3-metronidazole-3"
* entry[=].resource = medadmin-example-ach-monthly-pass3-metronidazole-3
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass3-cipro"
* entry[=].resource = medicationrequest-example-ach-monthly-pass3-cipro
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass3-enoxaparin"
* entry[=].resource = medicationrequest-example-ach-monthly-pass3-enoxaparin
* entry[+].fullUrl = "http://nhsnlink.org/fhir/MedicationRequest/medicationrequest-example-ach-monthly-pass3-metronidazole"
* entry[=].resource = medicationrequest-example-ach-monthly-pass3-metronidazole
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass3-cdiff"
* entry[=].resource = observation-example-ach-monthly-pass3-cdiff
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass3-vitals-height"
* entry[=].resource = observation-example-ach-monthly-pass3-vitals-height
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Observation/observation-example-ach-monthly-pass3-vitals-weight"
* entry[=].resource = observation-example-ach-monthly-pass3-vitals-weight
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Procedure/procedure-example-ach-monthly-pass3-transfusion"
* entry[=].resource = procedure-example-ach-monthly-pass3-transfusion
* entry[+].fullUrl = "http://nhsnlink.org/fhir/ServiceRequest/servicerequest-example-ach-monthly-pass3-cdiff"
* entry[=].resource = servicerequest-example-ach-monthly-pass3-cdiff
* entry[+].fullUrl = "http://nhsnlink.org/fhir/Specimen/specimen-example-ach-monthly-pass3-stool"
* entry[=].resource = specimen-example-ach-monthly-pass3-stool

