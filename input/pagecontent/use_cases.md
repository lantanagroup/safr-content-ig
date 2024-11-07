### Actors 

This implementation guide (IG) defines the following actors: a data source, a dQM evaluation engine, a measure source, and data aggregator. 

Note: A given system may play the role of multiple actors. For example, an EHR could be both the data source and dQM evaluation engine when calculating a measure internally. Likewise, a system such as NHSNLink that resides at NHSN and queries the data source remotely may act as the dQM evaluation engine and MeasureReport recipient and evaluate the data, produce, and validate MeasureReport bundles. 

The actors defined here are used in the Reporting Scenarios section of the [Specification](specification.html) page in this IG. 

- <b>Data Source</b>: The EHRs for facilities reporting to NHSN serves as the data source.   
- <b>Measure Source</b>: NHSN stores FHIR resources used for dQM reporting such as Measure, Library, ValueSet, etc. that systems can query for the latest measure content before querying the EHR FHIR server and performing measure evaluation.   
- <b>dQM Evaluation Engine</b>: Requests and queries patients from the EHR FHIR server and evaluates the data against the dQM retrieved from the Measure Source. The dQM evaluation engine validates the data against the profiles in this IG. 
- <b>MeasureReport Recipient</b>: NHSN ingests the MeasureReport bundles from the dQM evaluation engine.  

This implementation guide will serve a wide variety of use cases for NHSN.

### Use Cases 

This implementation guide (IG) serves a wide variety of National Healthcare Safety Network (NHSN) use cases. 

#### Use Case 1: Acute Care Hospital (ACH)

##### Description

The NHSN Acute Care Hospital (ACH) digital quality measure (dQM) allows facilities to report line-level data electronically to NHSN for the following modules that provide monthly event rates back to the facility. These dQMs include Glycemic Control (hyperglycemia and medication-related hypoglycemia); Healthcare Facility-onset, antibiotic-Treated Clostridioides difficile (C. difficile) Infection (HT-CDI); Hospital-Onset Bacteremia and Fungemia (HOB), Venous Thromboembolism (VTE)-related Prophylaxis and event rates (under development), Late Onset Sepsis / Meningitis (under development), Hospital-onset Acute Kidney Injury (HAKI) (under development), and Opioid-related Adverse Events (ORAE) (under development).  

##### Patients of Interest

The facility works with NHSN to define a list of patients of interest (POI list). The POI list is often the facility’s entire inpatient population. The data for the patients in the list are then extracted and evaluated against the measure criteria for the initial population.

##### Initial Population

The initial population in the ACH dQM is defined as all encounters for patients of any age in an Emergency Department (ED), observation, or inpatient location or all encounters for patients of any age with an ED, observation, inpatient, or short stay status during the measurement period. Once an individual patient meets the population criteria, the line-level data needed to calculate metrics, benchmark, and or stratify the individual protocol measures is submitted to NHSN.

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

The NHSN Bed Capacity measure allows for facilities to report real-time hospital bed capacity data electronically to CDC’s NHSN, enabling a jurisdictional capacity datastore and dashboard for viewing real-time occupancy information. The goal of this measure is to provide insight into the healthcare systems’ during routine operations and especially during public health emergencies.

The NHSN Bed Capacity use case is intended to follow the pattern of a [SANER](https://hl7.org/fhir/uv/saner/) (Situational Awareness for Novel Epidemic Response) measure, but there are currently incompatibilities between SANER and DEQM (Data Exchange for Quality Measures) that the owning HL7 work groups (WG) have agreed to resolve, but have not yet implemented. Once SANER and DEQM are harmonized this IG will likely be updated to reflect that.

##### Background

Formally called the NHSN Connectivity Initiative: Hospital Bed Capacity Project, the objective of NHSN Bed Capacity measure is to establish a web-based easy-to use interface to be accessed by hospitals and governmental agencies at a state and regional level to coordinate daily, surge, and crisis needs. Since March 2020, the U.S. government has been consistently collecting data from hospitals and states to better understand healthcare system stress, capacity, capabilities, and hospitalizations. The COVID-19 pandemic underscored the Federal Government’s continuously evolving needs for data and the need to prioritize data modernization to reduce burden and maximize efficiency.

##### Bed Inclusion Criteria

For all bed censuses and counts, the following bed types should be <u>included</u>:
1. All inpatient staffed and unblocked beds
2. Observation beds

##### Bed Exclusion Criteria

For all bed censuses and counts, the following bed types should be <u>excluded</u>:
1. Virtual beds or locations in the EHR that are not physical spaces (i.e., beds used for interoperative phase of care or in certain operative settings or virtual staging areas for admissions.) 
2. Beds no longer in use, even in case of surge
3. Blocked beds (i.e., beds blocked due to logistical or maintenance challenges, staffing restrictions, isolation, etc.)  

##### Unit Inclusion Criteria

- Emergency department (ED)
- Intensive care unit (ICU) 
- Level of care (LOC) 
- Medicine telemetry/medicine surgery acute care bed (MT/MS) 
- Neonatal intensive care unit (NICU) 
- Negative pressure (NP) 
- Obstetrics (OB) 
- Observation (OBS) 
- Progressive care unit (PCU) 
- Pediatric (Peds) 
- Pediatric intensive care unit (PICU) 
- Psychiatric (Psych) 
- Rehabilitation (Rehab) 

##### Bed Capacity Examples
- [MeasureReport - Children's Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-chld.html)
- [MeasureReport - Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-hosp.html)
- [MeasureReport - Inpatient Psychiatric Facility Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-ipf.html)

#### Use Case 3: Respiratory Pathogens Surveillance (RPS)

##### Description

The NHSN Respiratory Pathogens Surveillance (RPS) module enables the measurement of facility and unit-specific incidence and prevalence of Coronavirus 2019 (COVID-19), Influenza, and Respiratory Syncytial Virus (RSV) disease among patients admitted to the hospital (inpatient, observation, or short stay status), and specific associated patient outcomes. The RPS module supports an electronic health record (EHR)-/vendor-neutral standard for reporting patient-level data on hospitalized patients with a respiratory illness due to one or more of the pathogens under surveillance. Data collected via the RPS module may be used by facilities for quality improvement and patient care planning purposes, as well as by local, state, and federal public health agencies in coordination and response to public health outbreaks. The RPS module offers a mechanism for ongoing monitoring of infectious respiratory viral illness among hospitalized patients with minimal human resource expenditure via 100% electronically automated data capture. This initial version of the module is based on electronic data capture and upload of demographic, administrative, and clinical data from the facility’s electronic source systems such as the electronic health record (EHR), patient registration system (admission, discharge, and transfer [ADT] data), laboratory information system, and pharmacy electronic medication administration system. Facilities will have access to their data via the analysis functions of NHSN.

##### Patients of Interest

The facility will work with NHSN to define a list of patients of interest (POI list). This is often the entire in-patient population at the facility. The data for the patients in the list are then extracted and evaluated against the measure criteria for the initial population (see below).

##### Initial Population

The Respiratory Pathogens Surveillance Initial Population includes all encounters with an inpatient, observation, or short stay status for patients of any age during the measurement period.

##### Additional Use Case Information References

[https://www.cdc.gov/nhsn/acute-care-hospital/index.html](https://www.cdc.gov/nhsn/acute-care-hospital/index.html)

##### RPS Submission Examples

- [Full RPS Measure Submission Bundle](Bundle-bundle-example-rps-full.html)
- [Example RPS Submission Header Bundle](Bundle-bundle-example-rps-header.html)
- [Example RPS Submission Initial Population Pass Bundle](Bundle-bundle-example-rps-subject-initialpopulationpass.html)
- [Example RPS Submission Negative PCR Bundle](Bundle-bundle-example-rps-subject-negativepcr.html)
- [Example RPS Submission Influenza Therapeutic Bundle](Bundle-bundle-example-rps-subject-influenzatherapeutic.html)
- [Example RPS Submission RSV Lab BTG Bundle](Bundle-bundle-example-rps-subject-rsvlabbtg.html)

##### Bundle Submission Examples

- [Submitting Organization](Organization-organization-example-submitting-organization.html)
- [Submitting Device](Device-device-example-submitting-device.html)

POI List

- [RPS Patients Of Interest](List-list-example-rps-patients-of-interest.html)

Subject List Measure Report

- [RPS Subject List](MeasureReport-measurereport-example-rps-subjectlist.html)

Individual Measure Report

- [RPS Individual Measure Report List](List-list-example-rps-individual-measurereport-list.html)

##### Initial Population Examples

Patient

- [Patient - RPS Patient Example Influenza Therapeutic](Patient-patient-example-rps-influenzatherapeutic.html)
- [Patient - RPS Patient Example Initial Population Pass](Patient-patient-example-rps-initialpopulationpass.html)
- [Patient - RPS Patient Example Negative PCR](Patient-patient-example-rps-negativepcr.html)
- [Patient - RPS Patient Example RSV Lab BTG](Patient-patient-example-rps-rsvlabbtg.html)

Encounter

- [Encounter - RPS Encounter Example Influenza Therapeutic](Encounter-encounter-example-rps-influenzatherapeutic.html)
- [Encounter - RPS Encounter Example Initial Population Pass 1](Encounter-encounter-example-rps-initialpopulationpass-1.html)
- [Encounter - RPS Encounter Example Initial Population Pass 2](Encounter-encounter-example-rps-initialpopulationpass-2.html)
- [Encounter - RPS Encounter Example Negative PCR 1](Encounter-encounter-example-rps-negativepcr-1.html)
- [Encounter - RPS Encounter Example Negative PCR 2](Encounter-encounter-example-rps-negativepcr-2.html)
- [Encounter - RPS Encounter Example RSV Lab BTG](Encounter-encounter-example-rps-rsvlabbtg.html)

##### Line Level Data Examples

Diagnostic Report (Lab)

- [DiagnosticReport -  Example Initial Population Pass](DiagnosticReport-diagnosticreport-example-rps-initialpopulationpass.html)

Lab Result Observation 

- [Lab Observation - RPS Observation Example Initial Population Pass](Observation-lab-observation-example-rps-initialpopulationpass.html)
- [Lab Observation - RPS Observation Example Negative PCR 1](Observation-lab-observation-example-rps-negativepcr-1.html)
- [Lab Observation - RPS Observation Example Negative PCR 2](Observation-lab-observation-example-rps-negativepcr-2.html)
- [Lab Observation - RPS Observation Example RSV Lab BTG](Observation-lab-observation-example-rps-rsvlabbtg.html)

Location

- [Location - Example RPS - Inpatient](Location-location-example-rps-inpatient.html)

Medication

- [Medication - RPS Medication Example Influenza Therapeutic](Medication-medication-example-rps-influenzatherapeutic.html)
- [Medication - RPS Medication Example Initial Population Pass](Medication-medication-example-rps-initialpopulationpass.html)
- [Medication - RPS Medication Example Negative PCR](Medication-medication-example-rps-negativepcr.html)
- [Medication - RPS Medication Example RSV Lab BTG 1](Medication-medication-example-rps-rsvlabbtg-1.html)
- [Medication - RPS Medication Example RSV Lab BTG 2](Medication-medication-example-rps-rsvlabbtg-2.html)

Medication Administration

- [Medication Administration - RPS Medication Administration Example Influenza Therapeutic](MedicationAdministration-medicationadministration-example-rps-influenzatherapeutic.html)
- [Medication Administration - RPS Medication Administration Example Initial Population Pass 1](MedicationAdministration-medicationadministration-example-rps-initialpopulationpass-1.html)
- [Medication Administration - RPS Medication Administration Example Initial Population Pass 2](MedicationAdministration-medicationadministration-example-rps-initialpopulationpass-2.html)
- [Medication Administration - RPS Medication Administration Example RSV Lab BTG 1](MedicationAdministration-medicationadministration-example-rps-rsvlabbtg-1.html)
- [Medication Administration - RPS Medication Administration Example RSV Lab BTG 2](MedicationAdministration-medicationadministration-example-rps-rsvlabbtg-2.html)

Medication Request

- [Medication Request - RPS Medication Request Example Influenza Therapeutic](MedicationRequest-medicationrequest-example-rps-influenzatherapeutic.html)
- [Medication Request - RPS Medication Request Example Initial Population Pass](MedicationRequest-medicationrequest-example-rps-initialpopulationpass.html)
- [Medication Request - RPS Medication Request Example Negative PCR](MedicationRequest-medicationrequest-example-rps-negativepcr.html)
- [Medication Request - RPS Medication Request Example RSV Lab BTG 1](MedicationRequest-medicationrequest-example-rps-rsvlabbtg-1.html)
- [Medication Request - RPS Medication Request Example RSV Lab BTG 2](MedicationRequest-medicationrequest-example-rps-rsvlabbtg-2.html)

Observation

- [Observation - Example RPS Initial Population Pass Social Isolation](Observation-observation-example-rps-initialpopulationpass-isolation.html)

Procedure

- [Procedure - Example RPS Negative PCR Intubation](Procedure-procedure-example-rps-negativepcr-intubation.html)

Service Request

- [ServiceRequest - Example RPS Initial Population Pass COVID](ServiceRequest-servicerequest-example-rps-initialpopulationpass-covid.html)
- [ServiceRequest - Example RPS Negative PCR COVID 1](ServiceRequest-servicerequest-example-rps-negativepcr-covid-1.html)
- [ServiceRequest - Example RPS Negative PCR COVID 2](ServiceRequest-servicerequest-example-rps-negativepcr-covid-2.html)
- [ServiceRequest - Example RPS RSV Lab BTG](ServiceRequest-servicerequest-example-rps-rsvlabbtg-rsv.html)

Specimen

- [Specimen - RPS Specimen Example Initial Population Pass](Specimen-specimen-example-rps-initialpopulationpass.html)
- [Specimen - RPS Specimen Example Negative PCR 1](Specimen-specimen-example-rps-negativepcr-1.html)
- [Specimen - RPS Specimen Example Negative PCR 2](Specimen-specimen-example-rps-negativepcr-2.html)
- [Specimen - RPS Specimen Example RSV Lab BTG](Specimen-specimen-example-rps-rsvlabbtg.html)
