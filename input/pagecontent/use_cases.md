### Actors 

This implementation guide (IG) defines the following actors: a data source, a dQM evaluation engine, a measure source, and a data aggregator.  

<b>Note:</b> A given system may play the role of multiple actors. For example, an electronic health record (EHR) could serve as both the data source and dQM evaluation engine when calculating a measure internally. Likewise, a system such as NHSNLink, which resides at the National Healthcare Safety Network (NHSN) and queries the data source remotely may act as the dQM evaluation engine and MeasureReport recipient, evaluating the data, producing, and validating MeasureReport bundles. 

The actors defined here are used in the Reporting Scenarios section of the [Specification](specification.html) page in this IG. 

- <b>Data Source:</b> The EHRs for facilities reporting to NHSN serve as the data source.   
- <b>Measure Source:</b> NHSN stores Fast Healthcare Interoperability Resources (FHIR) resources used for dQM reporting, such as Measure, Library, ValueSet, etc. that systems can query for the latest measure content before querying the EHR FHIR server and performing measure evaluation.   
- <b>dQM Evaluation Engine:</b>  Requests and queries patients from the EHR FHIR server and evaluates the data against the dQM retrieved from the Measure Source. The dQM evaluation engine validates the data against the profiles in this IG. 
- <b>MeasureReport Recipient:</b> NHSN ingests the MeasureReport bundles from the dQM evaluation engine.  

### Use Cases

This IG serves a wide variety of NHSN use cases.

### Use Case 1: Acute Care Hospital (ACH) Monthly

#### ACH Monthly Description

The NHSN ACH Monthly dQM enables facilities to electronically report line-level data to NHSN for the following modules, which provide monthly event rates back to the facility. These dQMs include:

- Glycemic Control (includes hyperglycemia and medication-related hypoglycemia events)
- Bacteremia & Fungemia Surveillance (includes Hospital-Onset Bacteremia & Fungemia events)
- Clostridioides difficile Surveillance (includes Healthcare facility-onset, antibiotic-Treated CDI events)
- Sepsis Surveillance (includes Adult Community-onset Sepsis events)
- Venous Thromboembolism (VTE)-related Prophylaxis and event rates (under development)
- Late-Onset Sepsis / Meningitis (LOS/MEN) (under development)
- Hospital-onset Acute Kidney Injury (HAKI) (under development)
- Opioid-related Adverse Events (ORAE) (under development)

#### ACH Monthly Patients of Interest

The facility works with NHSN to define a patients of interest (POI) list. The POI list is often the facility’s entire Inpatient, Emergency, and Observation population. The data for the patients on the list are then extracted and evaluated against the measure criteria for the initial population.

#### ACH Monthly Initial Population

The initial population in the ACH Monthly dQM is defined as all encounters for patients of any age in an Emergency Department (ED), observation, or inpatient location or all encounters for patients of any age with an ED, observation, inpatient, or short stay status during the measurement period. Once an individual patient meets the population criteria, the line-level data needed to calculate metrics, to benchmark, and/or to stratify the individual protocol measures is submitted to NHSN. 

#### ACH Monthly Additional Use Case Information References

For specific information on the individual NHSN protocols and metrics see: 
[Acute Care / Critical Access Hospitals (ACH) | NHSN | CDC ](https://www.cdc.gov/nhsn/acute-care-hospital/index.html)
[Example ACH Monthly Initial Population Library (CQL)](Library-NHSNAcuteCareHospitalMonthlyInitialPopulation.html)
[Example ACH Monthly Measure Library ](Measure-NHSNAcuteCareHospitalMonthlyInitialPopulation.html)

#### ACH Monthly Submission Examples

- [Full ACH Measure Submission Bundle](Bundle-submission-full-example1.html)
- [ACH Monthly Submission Header Bundle](Bundle-bundle-example-ach-monthly-header.html)
- [ACH Monthly Submission Subject Bundle 1](Bundle-bundle-example-ach-monthly-subject-ach-pass1.html)
- [ACH Monthly Submission Subject Bundle 2](Bundle-bundle-example-ach-monthly-subject-ach-pass2.html)
- [ACH Monthly Submission Subject Bundle 3](Bundle-bundle-example-ach-monthly-subject-ach-pass3.html)


#### ACH Monthly Bundle Submission Examples

- [Full ACH Monthly Measure Submission Bundle](Bundle-submission-full-example1.html)
- [Submitting Organization](Organization-organization-example-submitting-organization.html) 
- [Submitting Device](Device-device-example-submitting-device.html) 

#### ACH Monthly POI List

- [ACH Monthly Patients Of Interest](List-list-example-ach-monthly-patients-of-interest.html)

#### ACH Monthly Subject List Measure Report

- [ACH Monthly Subject List](MeasureReport-measurereport-example-ach-monthly-subjectlist1.html)

#### ACH Monthly Individual Measure Report

- [ACH Monthly Individual Measure Report List](List-list-example-ach-monthly-individual-measurereport-list.html)

#### ACH Monthly Initial Population (IP) Examples

##### ACH Monthly IP Patient Examples

- [Patient - Example ACH Monthly Pass1 - LOS/MEN](Patient-patient-example-ach-monthly-pass1.html)
- [Patient - Example ACH Monthly Pass2 - Hypo](Patient-patient-example-ach-monthly-pass2.html)
- [Patient - Example ACH Monthly Pass3 - CDI/HOB](Patient-patient-example-ach-monthly-pass3.html)

##### ACH Monthly IP Encounter Examples

- [Encounter - Example ACH Monthly Pass2 - Inpatient](Encounter-encounter-example-ach-monthly-pass2-inpatient.html)
- [Encounter - Example ACH Monthly Pass2 - Emergency](Encounter-encounter-example-ach-monthly-pass2-emergency.html)
- [Encounter - Example ACH Monthly Pass3 - Short Stay](Encounter-encounter-example-ach-monthly-pass3-short-stay.html)
- [Encounter - Example ACH Monthly Pass3 - Acute Critical Care](Encounter-encounter-example-ach-monthly-pass3-acute.html)

#### ACH Monthly Line Level Data Examples

##### ACH Monthly IP Condition Examples

- [Condition - Example Diagnosis ACH Monthly Pass1 Encounter Diagnosis](Condition-condition-example-diagnosis-ach-monthly-pass1.html)
- [Condition - Example Diagnosis ACH Monthly Pass2 Problem List](Condition-condition-example-diagnosis-ach-monthly-pass2-problem.html)

##### ACH Monthly IP Coverage Examples

- [Coverage - Example ACH Monthly Pass1 Medicaid](Coverage-coverage-example-ach-monthly-pass1.html)
- [Coverage - Example ACH Monthly Pass2 Commercial](Coverage-coverage-example-ach-monthly-pass2.html)

<!-- Device

- [Device - Example ACH Monthly Pass1 Central Line](Device-device-example-ach-monthly-pass1-central-line.html) -->

##### ACH Monthly IP Diagnostic Report Examples

- [DiagnosticReport - Example ACH Monthly Pass2 Cardiopulmonary1](DiagnosticReport-diagnosticreport-example-ach-monthly-pass2-cardiopulmonary.html)
- [DiagnosticReport - Example ACH Monthly Pass2 Lab CBC](DiagnosticReport-diagnosticreport-example-ach-monthly-pass2-lab-cbc.html)

##### ACH Monthly IP Location Examples

- [Location - Example ACH Monthly Emergency](Location-location-example-ach-monthly-emergency.html)
- [Location - Example ACH Monthly Inpatient](Location-location-example-ach-monthly-inpatient.html)
- [Location - Example ACH Monthly NICU](Location-location-example-ach-monthly-nicu-level-iii.html)

##### ACH Monthly IP Medication Examples

- [Medication - Example ACH Monthly Heparin](Medication-medication-example-heparin.html)
- [Medication - Example ACH Monthly Metformin 1000](Medication-medication-example-metformin-1000.html)
- [Medication - Example ACH Monthly Vancomycin 15](Medication-medication-example-vancomycin-15.html)
- [Medication - Example ACH Monthly Insulin Lispro](Medication-medication-example-insulin-lispro.html)

##### ACH Monthly IP Medication Administration Examples

- [MedicationAdministration - Example ACH Monthly Pass2 Heparin 1](MedicationAdministration-medadmin-example-ach-monthly-pass2-heparin-1.html)
- [MedicationAdministration - Example ACH Monthly Pass2 Heparin 2](MedicationAdministration-medadmin-example-ach-monthly-pass2-heparin-2.html)
- [MedicationAdministration - Example ACH Monthly Pass2 Insulin Lispro 1](MedicationAdministration-medadmin-example-ach-monthly-pass2-insulin-lispro-1.html)
- [MedicationAdministration - Example ACH Monthly Pass2 Insulin Lispro 2](MedicationAdministration-medadmin-example-ach-monthly-pass2-insulin-lispro-2.html)

##### ACH Monthly IP Medication Request Examples

- [MedicationRequest - Example ACH Monthly Pass1 Vancomycin](MedicationRequest-medicationrequest-example-ach-monthly-pass1-vancomycin.html)
- [MedicationRequest - Example ACH Monthly Pass2 Metformin](MedicationRequest-medicationrequest-example-ach-monthly-pass2-metformin.html)

##### ACH Monthly IP Observation Examples

- [Observation - Example ACH Monthly Pass1 Blood Culture](Observation-observation-example-ach-monthly-pass1-blood.html)
- [Observation - Example ACH Monthly Pass1 CSF](Observation-observation-example-ach-monthly-pass1-csf.html)
- [Observation - Example ACH Monthly Pass1 Gestational Age](Observation-observation-example-ach-monthly-pass1-gestational-age.html)
- [Observation - Example ACH Monthly Pass1 Vitals Weight](Observation-observation-example-ach-monthly-pass1-vitals-weight.html)
- [Observation - Example ACH Monthly Pass2 Hemo A1C](Observation-observation-example-ach-monthly-pass2-hemo-a1c.html)
- [Observation - Example ACH Monthly Pass3 C. diff](Observation-observation-example-ach-monthly-pass3-cdiff.html)

##### ACH Monthly IP Procedure Examples

- [Procedure - Example ACH Monthly Pass1 Central Line](Procedure-procedure-example-ach-monthly-pass1-central-line.html)
- [Procedure - Example ACH Monthly Pass1 Lumbar](Procedure-procedure-example-ach-monthly-pass1-lumbar.html)

##### ACH Monthly IP Service Request Examples

- [ServiceRequest - Example ACH Monthly Pass1 Blood Culture](ServiceRequest-servicerequest-example-ach-monthly-pass1-blood.html)
- [ServiceRequest - Example ACH Monthly Pass1 CSF](ServiceRequest-servicerequest-example-ach-monthly-pass1-csf.html)
- [ServiceRequest - Example ACH Monthly Pass2 Glucose](ServiceRequest-servicerequest-example-ach-monthly-pass2-glucose.html)
- [ServiceRequest - Example ACH Monthly Pass2 Hemo A1C](ServiceRequest-servicerequest-example-ach-monthly-pass2-hemo-a1c.html)
- [ServiceRequest - Example ACH Monthly Pass3 Cdiff](ServiceRequest-servicerequest-example-ach-monthly-pass3-cdiff.html)

##### ACH Monthly IP Specimen Examples

- [Specimen - Example ACH Monthly Pass1 Blood](Specimen-specimen-example-ach-monthly-pass1-blood.html)
- [Specimen - Example ACH Monthly Pass1 CSF](Specimen-specimen-example-ach-monthly-pass1-csf.html)
- [Specimen - Example ACH Monthly Pass3 Stool](Specimen-specimen-example-ach-monthly-pass3-stool.html)

<!-- ### Use Case 2: Bed Capacity Reporting

#### Description

The NHSN Bed Capacity measure allows for facilities to report real-time hospital bed capacity data electronically to CDC’s National Healthcare Safety Network (NHSN), enabling a jurisdictional capacity datastore and dashboard for viewing real-time occupancy information. The goal of this measure is to strengthen healthcare systems capacity by providing near real time insight into routine operations and especially during public health emergencies.

The NHSN Bed Capacity use case is intended to follow the pattern of a [SANER](https://hl7.org/fhir/uv/saner/) measure, but there are currently incompatibilities between SANER and DEQM that the owning HL7 work groups have agreed to resolve, but have not yet implemented. Once SANER and DEQM are harmonized this IG will likely be updated to reflect that.

#### Background

Formally called the NHSN Connectivity Initiative: Hospital Bed Capacity Project, the objective of this measure is to establish a web-based easy-to use interface to be accessed by hospitals and governmental agencies at a state and regional level to coordinate daily, surge and crisis needs.  Since March 2020, the U.S. government has been consistently collecting data from hospitals and states to better understand healthcare system stress, capacity, capabilities, and hospitalizations. The COVID-19 pandemic underscored the Federal needs for data are continuously evolving, and that data modernization must be prioritized to reduce burden and maximize efficiency.

#### Bed Inclusion Criteria

For all bed censuses and counts, the following bed types should be <u>included</u>:
1. All inpatient staffed and unblocked beds
2. Observation beds


#### Bed Exclusion Criteria

For all bed censuses and counts, the following bed types should be <u>excluded</u>:
1. Virtual beds or locations in the EMR that are not physical spaces (i.e., beds used for interoperative phase of care or in certain operative settings or virtual staging areas for admissions.)
2. Beds no longer in use, even in case of surge
3. Blocked beds (i.e., beds blocked due to logistical or maintenance challenges, staffing restrictions, isolation, etc.) 


#### Unit Inclusion Criteria

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


[//]: # #### Bed Capacity Examples
[//]: #- [MeasureReport - Children's Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-chld.html)
[//]: #- [MeasureReport - Hospital Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-hosp.html)
[//]: #- [MeasureReport - Inpatient Psychiatric Facility Bed Capacity Individual Measure Report](MeasureReport-bed-capacity-measurereport-example-ipf.html) -->

### Use Case 2: ACH Daily

#### ACH Daily Description

The NHSN Respiratory Pathogens Surveillance (RPS) module enables the measurement of facility and unit-specific incidence and prevalence of Coronavirus 2019 (COVID-19), Influenza, and Respiratory Syncytial Virus (RSV) disease among patients admitted to the hospital (inpatient, observation, or short stay status), and specific associated patient outcomes. The RPS module offers a mechanism for ongoing monitoring of infectious respiratory viral illness among hospitalized patients with minimal human resource expenditure via 100% electronically automated data capture. This initial version of the module is based on electronic data capture and upload of demographic, administrative, and clinical data from the facility’s electronic source systems such as the EHR, patient registration system (admission, discharge, and transfer [ADT] data), laboratory information system, and pharmacy electronic medication administration system.

RPS module data collected via the ACH Daily dQM may be used by facilities for quality improvement and patient care planning purposes, as well as by local, state, and federal public health agencies in coordination and response to public health outbreaks. Facilities will have access to their data via the analysis functions of NHSN.

#### ACH Daily Patients of Interest

The facility will work with NHSN to define a POI list. This is often the entire inpatient, observation, or short stay population at the facility. The data for the patients in the list are then extracted and evaluated against the measure criteria for the initial population (see below).

#### ACH Daily Initial Population

The ACH Daily Initial Population includes all encounters with an inpatient, observation, or short stay status for patients of any age during the measurement period.

#### ACH Daily Additional Use Case Information References

[https://www.cdc.gov/nhsn/acute-care-hospital/index.html](https://www.cdc.gov/nhsn/acute-care-hospital/index.html)

#### ACH Daily Submission Examples

- [Full ACH Daily Measure Submission Bundle](Bundle-bundle-example-ach-daily-full.html)
- [ACH Daily Submission Header Bundle](Bundle-bundle-example-ach-daily-header.html)
- [ACH Daily Submission Initial Population Pass Bundle](Bundle-bundle-example-ach-daily-subject-initialpopulationpass.html)
- [ACH Daily Submission Negative PCR Bundle](Bundle-bundle-example-ach-daily-subject-negativepcr.html)
- [ACH Daily Submission Influenza Therapeutic Bundle](Bundle-bundle-example-ach-daily-subject-influenzatherapeutic.html)
- [ACH Daily Submission RSV Lab BTG Bundle](Bundle-bundle-example-ach-daily-subject-rsvlabbtg.html)

#### ACH Daily Bundle Submission Examples

- [Submitting Organization](Organization-organization-example-submitting-organization.html)
- [Submitting Device](Device-device-example-submitting-device.html)

#### ACH Daily POI List

- [ACH Daily Patients Of Interest](List-list-example-ach-daily-patients-of-interest.html)

#### ACH Daily Subject List Measure Report

- [ACH Daily Subject List](MeasureReport-measurereport-example-ach-daily-subjectlist.html)

#### ACH Daily Individual Measure Report

- [ACH Daily Individual Measure Report List](List-list-example-ach-daily-individual-measurereport-list.html)

#### ACH Daily Initial Population Examples

##### ACH Daily IP Patient Examples

- [Patient - Example ACH Daily Influenza Therapeutic](Patient-patient-example-ach-daily-influenzatherapeutic.html)
- [Patient - Example ACH Daily Initial Population Pass](Patient-patient-example-ach-daily-initialpopulationpass.html)
- [Patient - Example ACH Daily Negative PCR](Patient-patient-example-ach-daily-negativepcr.html)
- [Patient - Example ACH Daily RSV Lab BTG](Patient-patient-example-ach-daily-rsvlabbtg.html)

##### ACH Daily IP Encounter Examples

- [Encounter - Example ACH Daily Influenza Therapeutic](Encounter-encounter-example-ach-daily-influenzatherapeutic.html)
- [Encounter - Example ACH Daily Initial Population Pass 1](Encounter-encounter-example-ach-daily-initialpopulationpass-1.html)
- [Encounter - Example ACH Daily Initial Population Pass 2](Encounter-encounter-example-ach-daily-initialpopulationpass-2.html)
- [Encounter - Example ACH Daily Negative PCR 1](Encounter-encounter-example-ach-daily-negativepcr-1.html)
- [Encounter - Example ACH Daily Negative PCR 2](Encounter-encounter-example-ach-daily-negativepcr-2.html)
- [Encounter - Example ACH Daily RSV Lab BTG](Encounter-encounter-example-ach-daily-rsvlabbtg.html)

#### ACH Daily Line Level Data Examples

##### ACH Daily IP Diagnostic Report (Lab) Examples

- [DiagnosticReport - Example ACH Daily Initial Population Pass](DiagnosticReport-diagnosticreport-example-ach-daily-initialpopulationpass.html)

##### ACH Daily IP Lab Result Observation Examples

- [Lab Observation - Example ACH Daily Initial Population Pass](Observation-lab-observation-example-ach-daily-initialpopulationpass.html)
- [Lab Observation - Example ACH Daily Negative PCR 1](Observation-lab-observation-example-ach-daily-negativepcr-1.html)
- [Lab Observation - Example ACH Daily Negative PCR 2](Observation-lab-observation-example-ach-daily-negativepcr-2.html)
- [Lab Observation - Example ACH Daily RSV Lab BTG](Observation-lab-observation-example-ach-daily-rsvlabbtg.html)

##### ACH Daily IP Location Examples

- [Location - Example ACH Daily Inpatient](Location-location-example-ach-daily-inpatient.html)

##### ACH Daily IP Medication Examples

- [Medication - Example ACH Daily Influenza Therapeutic](Medication-medication-example-ach-daily-influenzatherapeutic.html)
- [Medication - Example ACH Daily Initial Population Pass](Medication-medication-example-ach-daily-initialpopulationpass.html)
- [Medication - Example ACH Daily Negative PCR](Medication-medication-example-ach-daily-negativepcr.html)
- [Medication - Example ACH Daily RSV Lab BTG 1](Medication-medication-example-ach-daily-rsvlabbtg-1.html)
- [Medication - Example ACH Daily RSV Lab BTG 2](Medication-medication-example-ach-daily-rsvlabbtg-2.html)

##### ACH Daily IP Medication Administration Examples

- [Medication Administration - Example ACH Daily Influenza Therapeutic](MedicationAdministration-medadmin-example-ach-daily-influenzatherapeutic.html)
- [Medication Administration - Example ACH Daily Initial Population Pass 1](MedicationAdministration-medadmin-example-ach-daily-initialpopulationpass-1.html)
- [Medication Administration - Example ACH Daily Initial Population Pass 2](MedicationAdministration-medadmin-example-ach-daily-initialpopulationpass-2.html)
- [Medication Administration - Example ACH Daily RSV Lab BTG 1](MedicationAdministration-medadmin-example-ach-daily-rsvlabbtg-1.html)
- [Medication Administration - Example ACH Daily RSV Lab BTG 2](MedicationAdministration-medadmin-example-ach-daily-rsvlabbtg-2.html)

##### ACH Daily IP Medication Request Examples

- [Medication Request - Example ACH Daily Influenza Therapeutic](MedicationRequest-medicationrequest-example-ach-daily-influenzatherapeutic.html)
- [Medication Request - Example ACH Daily Initial Population Pass](MedicationRequest-medicationrequest-example-ach-daily-initialpopulationpass.html)
- [Medication Request - Example ACH Daily Negative PCR](MedicationRequest-medicationrequest-example-ach-daily-negativepcr.html)
- [Medication Request - Example ACH Daily RSV Lab BTG 1](MedicationRequest-medicationrequest-example-ach-daily-rsvlabbtg-1.html)
- [Medication Request - Example ACH Daily RSV Lab BTG 2](MedicationRequest-medicationrequest-example-ach-daily-rsvlabbtg-2.html)

##### ACH Daily IP Observation Examples

- [Observation - Example ACH Daily Initial Population Pass Isolation](Observation-observation-example-ach-daily-initialpopulationpass-isolation.html)

##### ACH Daily IP Procedure Examples

- [Procedure - Example ACH Daily Negative PCR Intubation](Procedure-procedure-example-ach-daily-negativepcr-intubation.html)

##### ACH Daily IP Service Request Examples

- [ServiceRequest - Example ACH Daily Initial Population Pass COVID](ServiceRequest-servicerequest-example-ach-daily-initialpopulationpass-covid.html)
- [ServiceRequest - Example ACH Daily Negative PCR COVID 1](ServiceRequest-servicerequest-example-ach-daily-negativepcr-covid-1.html)
- [ServiceRequest - Example ACH Daily Negative PCR COVID 2](ServiceRequest-servicerequest-example-ach-daily-negativepcr-covid-2.html)
- [ServiceRequest - Example ACH Daily RSV Lab BTG](ServiceRequest-servicerequest-example-ach-daily-rsvlabbtg-rsv.html)

##### ACH Daily IP Specimen Examples

- [Specimen - Example ACH Daily Initial Population Pass](Specimen-specimen-example-ach-daily-initialpopulationpass.html)
- [Specimen - Example ACH Daily Negative PCR 1](Specimen-specimen-example-ach-daily-negativepcr-1.html)
- [Specimen - Example ACH Daily Negative PCR 2](Specimen-specimen-example-ach-daily-negativepcr-2.html)
- [Specimen - Example ACH Daily RSV Lab BTG](Specimen-specimen-example-ach-daily-rsvlabbtg.html)