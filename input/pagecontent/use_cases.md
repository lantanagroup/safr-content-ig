### Use Cases ###

This implementation guide will serve a wide variety of use cases for NHSN.

#### Use Case 1: Acute Care Hospital (ACH)

##### Description

The NHSN Acute Care Hospital (ACH) digital quality measure (dQM) allows facilities to report line-level data electronically to NHSN for the following modules that provide monthly event rates back to the facility such as: Glycemic Control (hyperglycemia and medication-related hypoglycemia); Healthcare facility-onset, antibiotic-Treated Clostridioides difficile (C. difficile) Infection (HT-CDI); Hospital-Onset Bacteremia & Fungemia (HOB), Venous Thromboembolism (VTE)-related prophylaxis and event rates (under development), Late Onset Sepsis / Meningitis (under development), Hospital-onset Acute Kidney Injury (HAKI) (under development), and Opioid-related Adverse Events (ORAE) (under development). NHSN protocols for these measures will soon be available at https://www.cdc.gov/nhsn/acute-care-hospital/index.html.  

##### Patients of Interest

The facility will work with NHSN to define a list of patients of interest(POI list). This is often the entire in-patient population at the facility. The data for the patients in the list are then extracted and evaluated against the measure criteria for the initial population (see below).

##### Initial Population

The initial population in the ACH dQM is defined as all encounters for patients of any age in an Emergency Department (ED), observation, or inpatient location or all encounters for patients of any age with an ED, observation, inpatient, or short stay status during the measurement period. Once an individual patient meets the population criteria, the line-level data needed to calculate metrics, benchmark and or stratify the individual protocol measures is submitted to NHSN.

##### Additional Use Case Information References
For specific information on the individual NHSN protocols and metrics see: 
[Acute Care / Critical Access Hospitals (ACH) | NHSN | CDC ](https://www.cdc.gov/nhsn/acute-care-hospital/index.html)
[Example ACH Initial Population Library (CQL)](Library-NHSNdQMAcuteCareHospitalInitialPopulationLibrary.html)
[Example ACH Measure Library ](Measure-NHSNdQMAcuteCareHospitalInitialPopulation.html)

##### ACH Submission Examples

##### Bundle Submission Examples

- [Full Submission Bundle](Bundle-submission-full-example1.html)
- [Submitting Organization](Organization-organization-example-submitting-organization.html) 
- [Submitting Device](Device-device-example-submitting-device.html) 

POI List

- [ACH Patients Of Interest](List-list-example-ach-patients-of-interest.html)

Subject List Measure Report

- [ACH Subject List](MeasureReport-measurereport-example-ach-subjectlist1.html)

Individual Measure Report

- [ACH Individual Measure Report List](List-list-example-ach-individual-measurereport-list.html)

##### Initial Population Examples

Patient

- [Patient - Example Sameresultdiffday](Patient-patient-example-sameresultdiffday.html)

Encounter

- [Encounter - Example ACH Pass2 - Inpatient](Encounter-encounter-example-ach-ach-pass2-inpatient.html)
- [Encounter - Example ACH Pass2 - Emergency](Encounter-encounter-example-ach-ach-pass2-emergency.html)
- [Encounter - Example ACH Pass3 - Short Stay](Encounter-encounter-example-ach-ach-pass3-short-stay.html)
- [Encounter - Example ACH Pass3 - Acute](Encounter-encounter-example-ach-ach-pass3-acute.html)

##### Line Level Data Examples

Condition

- [Condition - Example Diagnosis ACH Pass1 Encounter Diagnosis](Condition-condition-example-diagnosis-ach-pass1.html)
- [Condition - Example Diagnosis ACH Pass2 Problem List](Condition-condition-example-diagnosis-ach-pass2-problem.html)

Coverage

- [Coverage - Example ACH Pass1 Medicaid](Coverage-coverage-example-ach-pass1.html)
- [Coverage - Example ACH Pass2 Commercial](Coverage-coverage-example-ach-pass2.html)

Device

- [Device - Example ACH Pass1 Central Line](Device-device-example-ach-ach-pass1-central-line.html)

Diagnostic Report

- [DiagnosticReport - Example ACH Pass2 Cardiopulmonary1](DiagnosticReport-diagnosticreport-example-ach-ach-pass2-cardiopulmonary.html)
- [DiagnosticReport - Example ACH Pass2 Lab CBC](DiagnosticReport-diagnosticreport-example-ach-ach-pass2-lab-cbc.html)

Location

- [Location - Example ACH - Emergency](Location-location-example-ach-emergency.html)
- [Location - Example ACH - Inpatient](Location-location-example-ach-inpatient.html)
- [Location - Example ACH - Nicu](Location-location-example-ach-nicu-level-iii.html)

Medication

- [Medication - Example Heparin](Medication-medication-example-heparin.html)
- [Medication - Example Metformin 1000](Medication-medication-example-metformin-1000.html)
- [Medication - Example Vancomycin 15](Medication-medication-example-vancomycin-15.html)
- [Medication - Example Insulin Lispro](Medication-medication-example-insulin-lispro.html)

Medication Administration

- [MedicationAdministration - Example ACH Pass2 Heparin 1](MedicationAdministration-medicationadministration-example-ach-pass2-heparin-1.html)
- [MedicationAdministration - Example ACH Pass2 Heparin 2](MedicationAdministration-medicationadministration-example-ach-pass2-heparin-2.html)
- [MedicationAdministration - Example ACH Pass2 Insulin Lispro 1](MedicationAdministration-medicationadministration-example-ach-pass2-insulin-lispro-1.html)
- [MedicationAdministration - Example ACH Pass2 Insulin Lispro 2](MedicationAdministration-medicationadministration-example-ach-pass2-insulin-lispro-2.html)

Medication Request

- [MedicationRequest - Example ACH Pass1 Vancomycin](MedicationRequest-medicationrequest-example-ach-pass1-vancomycin.html)
- [MedicationRequest - Example ACH Pass2 Metformin](MedicationRequest-medicationrequest-example-ach-pass2-metformin.html)

Observation

- [Observation - Example ACH Pass1 Blood](Observation-observation-example-ach-pass1-blood.html)
- [Observation - Example ACH Pass1 Csf](Observation-observation-example-ach-pass1-csf.html)
- [Observation - Example ACH Pass1 Gestational Age](Observation-observation-example-ach-pass1-gestational-age.html)
- [Observation - Example ACH Pass1 Vitals Weight](Observation-observation-example-ach-pass1-vitals-weight.html)
- [Observation - Example ACH Pass2 Hemo A1C](Observation-observation-example-ach-pass2-hemo-a1c.html)
- [Observation - Example ACH Pass3 C. diff](Observation-observation-example-ach-pass3-cdiff.html)

Procedure

- [Procedure - Example ACH Pass1 Central Line](Procedure-procedure-example-ach-ach-pass1-central-line.html)
- [Procedure - Example ACH Pass1 Lumbar](Procedure-procedure-example-ach-ach-pass1-lumbar.html)

Service Request

- [ServiceRequest - Example ACH Pass1 Blood](ServiceRequest-servicerequest-example-ach-ach-pass1-blood.html)
- [ServiceRequest - Example ACH Pass1 CSF](ServiceRequest-servicerequest-example-ach-ach-pass1-csf.html)
- [ServiceRequest - Example ACH Pass2 Glucose](ServiceRequest-servicerequest-example-ach-ach-pass2-glucose.html)
- [ServiceRequest - Example ACH Pass2 Hemo A1C](ServiceRequest-servicerequest-example-ach-ach-pass2-hemo-a1c.html)
- [ServiceRequest - Example ACH Pass3 Cdiff](ServiceRequest-servicerequest-example-ach-ach-pass3-cdiff.html)

Specimen

- [Specimen - Example ACH Pass1 Blood](Specimen-specimen-example-ach-ach-pass1-blood.html)
- [Specimen - Example ACH Pass1 CSF](Specimen-specimen-example-ach-ach-pass1-csf.html)
- [Specimen - Example ACH Pass3 Stool](Specimen-specimen-example-ach-ach-pass3-stool.html)

#### Use Case 2: Bed Capacity Reporting

##### Description

The NHSN Bed Capacity measure allows for facilities to report real-time hospital bed capacity data electronically to CDC’s National Healthcare Safety Network (NHSN), enabling a jurisdictional capacity datastore and dashboard for viewing real-time occupancy information. The goal of this measure is to strengthen healthcare systems capacity by providing near real time insight into routine operations and especially during public health emergencies.

The NHSN Bed Capacity use case is intended to follow the pattern of a [SANER](https://hl7.org/fhir/uv/saner/) measure, but there are currently incompatibilities between SANER and DEQM that the owning HL7 work groups have agreed to resolve, but have not yet implemented. Once SANER and DEQM are harmonized this IG will likely be updated to reflect that.

##### Background

Formally called the NHSN Connectivity Initiative: Hospital Bed Capacity Project, the objective of this measure is to establish a web-based easy-to use interface to be accessed by hospitals and governmental agencies at a state and regional level to coordinate daily, surge and crisis needs.  Since March 2020, the U.S. government has been consistently collecting data from hospitals and states to better understand healthcare system stress, capacity, capabilities, and hospitalizations. The COVID-19 pandemic underscored the Federal needs for data are continuously evolving, and that data modernization must be prioritized to reduce burden and maximize efficiency.

##### Bed Inclusion Criteria

For all bed censuses and counts, the following bed types should be <u>included</u>:
1. All inpatient staffed and unblocked beds
2. Observation beds


##### Bed Exclusion Criteria

For all bed censuses and counts, the following bed types should be <u>excluded</u>:
1. Virtual beds or locations in the EMR that are not physical spaces (i.e., beds used for interoperative phase of care or in certain operative settings or virtual staging areas for admissions.)
2. Beds no longer in use, even in case of surge
3. Blocked beds (i.e., beds blocked due to logistical or maintenance challenges, staffing restrictions, isolation, etc.) 


##### Unit Inclusion Criteria

- ED    Emergency department
- ICU   Intensive care unit
- LOC   Level of care
- MT/MS Medicine telemetry/medicine surgery acute care bed
- NICU  Neonatal intensive care unit
- NP    Negative pressure
- OB    Obstetrics
- OBS   Observation
- PCU   Progressive care unit
- Peds  Pediatric
- PICU  Pediatric intensive care unit
- Psych Psychiatric
- Rehab Rehabilitation


##### Bed Capacity Examples
- [MeasureReport - Children's Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-chld.html)
- [MeasureReport - Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-hosp.html)
- [MeasureReport - Inpatient Psychiatric Facility Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-ipf.html)

