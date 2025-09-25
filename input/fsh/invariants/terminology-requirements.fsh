// This file handles Invariants enforcing special terminology rules including code systems and a choice of bindings across elements or resources

/*
https://lantana.atlassian.net/browse/MEASDEV-774
Encounter Invariant:
(Encounter.class = IMP, ACUTE, NONAC, OBSENC, or SS [Short Stay]) 
OR (Encounter.type = "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307',  or "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292’ or  "Observation Services": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143'
OR (Encounter.location:Location.type in http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265)
*/

Invariant: encounter-ach-monthly-initial-population
Description: "Encounter: (class must be from ACH Monthly encounter class) or (type from 'Encounter Inpatient', 'Emergency Department Visit', or 'Observation Services') or (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "class.memberOf('http://www.cdc.gov/nhsn/fhirportal/dqm/ig/ValueSet/ach-monthly-encounter-class') or class.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.274') or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143')).exists() or location.where(location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists()).exists()"

//class.memberOf('http://www.cdc.gov/nhsn/fhirportal/dqm/ig/ValueSet/ach-encounter-class').exists()               or class.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.274') or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292')).exists() or           type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143')).exists() or where(location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists())"



/* MEASDEV-1234: Update RPS Encounter Profiles */
Invariant: encounter-ach-daily-initial-population
Description: "Encounter: (class must be from ACH Daily encounter class) or (type from 'Encounter Inpatient' or 'Observation Services') or (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "class.memberOf('http://www.cdc.gov/nhsn/fhirportal/dqm/ig/ValueSet/ach-daily-encounter-class') or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143')).exists() or where(location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists())"


Invariant: encounter-location-type-initial-population
Description: "Encounter: references at least one Location where type is from 'Inpatient, Emergency, and Observation Locations'"
Severity: #warning
Expression: "location.where(location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists()).exists() or location.where(location.resolve().partOf.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists()).exists()"

Invariant: dqm-Con-2
Description: "At least one Condition.category SHALL be encounter-diagnosis, problem-list-item, or health-concern"
Severity: #error
Expression: "category.where(coding.where(system = 'http://terminology.hl7.org/CodeSystem/condition-category' and code='encounter-diagnosis').exists()).exists() or category.where(coding.memberOf('http://hl7.org/fhir/us/core/ValueSet/us-core-problem-or-health-concern')).exists()"
XPath: "true()"


/*
Removing because MEASDEV-1977 called for the creation of an additional invariant for "ACH Daily and Monthly Encounter profiles" to validate the presence of an HSLOC code in Location.type
Invariant: location-type-initial-population
Description: "Location: (Location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #warning
Expression: "type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists() or where(location.partOf.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists())"

/* Invariant tests
Invariant: encounter-ach-initial-population1
Description: "Encounter: (class must be from ACH encounter class) "
Severity: #error
//Expression: "class.where(coding.memberOf('http://www.cdc.gov/nhsn/fhirportal/dqm/ig/ValueSet/ach-encounter-class')).exists()"
Expression: "class.memberOf('http://terminology.hl7.org/ValueSet/v3-ActEncounterCode').exists()"

Invariant: encounter-ach-initial-population2
Description: "Encounter: (type from 'Encounter Inpatient', 'Emergency Department Visit', or 'Observation Services')"
Severity: #error
Expression: "type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292')).exists() or type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1111.143')).exists()"


Invariant: encounter-ach-initial-population3
Description: "Encounter: (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "where(location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists())"




// a does not seem to fail when it should
Invariant: encounter-ach-initial-population3a
Description: "Encounter: (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "where(location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists()).exists()"


Invariant: encounter-ach-initial-population3b
Description: "Encounter: (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "where(location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists())"


Invariant: encounter-ach-initial-population3c
Description: "Encounter: (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "location.location.resolve().type.where(coding.memberOf('http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1046.265')).exists()"

Invariant: location-ach-initial-population-direct
Description: "Encounter: (Encounter location type from 'Inpatient, Emergency, and Observation Locations')"
Severity: #error
Expression: "type.where(coding.memberOf('http://terminology.hl7.org/ValueSet/v3-ServiceDeliveryLocationRoleType')).exists()"
*/
/*
 Medication terminology Invariant:
 BindingMedication.code required to RxNorm (Any RxNorm, can’t use US Core RxNorm VS which restricts) (verify this allows additional codings)
*/
Invariant: medication-coding-from-rxnorm
Description: "Medication: code must contains a RxNorm coding"
Severity: #error
Expression: "code.where(coding.system='http://www.nlm.nih.gov/research/umls/rxnorm').exists()"

/*
 Observation terminology Invariant:
Observation.code required to LOINC (http://hl7.org/fhir/ValueSet/observation-codes) (verify this allows additional codings)
*/
Invariant: observation-coding-from-loinc
Description: "Observation: code must contains a LOINC coding"
Severity: #error
Expression: "code.where(coding.system='http://loinc.org').exists()"

/*
 Condition terminology Invariant:
Condition.code required to ICD9/ICD10/SNOMED VS (Any SNOMED Code, so can’t use US Core VS) (verify this allows additional codings)
*/
Invariant: Condition-coding-from-common-codesystems
Description: "Condition: code must contains a SNOMED CT, ICD-10-CM, or ICD-9-CM coding"
Severity: #error
Expression: "code.coding.where(system='http://snomed.info/sct').exists() or code.coding.where(system='http://hl7.org/fhir/sid/icd-9-cm').exists() or code.coding.where(system='http://hl7.org/fhir/sid/icd-10-cm').exists()"




//Expression: "code.where(code.memberOf('http://hl7.org/fhir/ValueSet/observation-vitalsignresult'))"