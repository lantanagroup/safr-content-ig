Profile: AcuteCareHospitalMonthlyReportingCondition
Parent: Condition
Id: ach-monthly-condition
Title: "ACH Monthly Event Condition"
Description: "This profile contains Required and Must Support data elements for reporting patient condition information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. 
This profile does not directly inherit from, but applies the constraints from the QI Core 6.0.0 [Condition Encounter Diagnosis](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-condition-encounter-diagnosis.html) profile, which inherits from US Core 6.1.0 [Condition Encounter Diagnosis](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-condition-encounter-diagnosis.html) profile and the QI Core 6.0.0 [Condition Problems Health Concerns](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-condition-problems-health-concerns.html) profile, which inherits from the US Core 6.1.0 [Condition Problems and Health Concerns](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-condition-problems-health-concerns.html) profile."
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-condition|3.1.1"
* obeys Condition-coding-from-common-codesystems
* obeys dqm-Con-2
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1

* extension MS  
* extension contains http://hl7.org/fhir/StructureDefinition/condition-assertedDate named assertedDate 0..1 MS
* extension[assertedDate] ^short = "The date on which the existence of the Condition was first asserted or acknowledged."
* extension[assertedDate] ^comment = "The assertedDate is in the context of the recording practitioner and might not be the same as the recordedDate."
* clinicalStatus 0..1 MS

* verificationStatus 0..1 MS

* category 1..* MS
* category ^condition = "SDOH-Con-2"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "category codes"
* category contains
    encounter-diagnosis 0..1 MS and
    problem-or-health-concern 0..* MS

// TODO: QUESTION ON DD, The DD says CQL constrains to these Categories:  Encounter-diagnosis, but we also have these for problem list item of health concern. Does the DD actually mean for the IP data, and not the SDE data?
// TODO: QUESTION ON DD, We will need to look at slicing on Category. It says the slicing on the "us-core" slice is required, but the binding is extensible, which doesn't make a lot of sense.


* category[encounter-diagnosis] = ConditionCategoryCodes#encounter-diagnosis
* category[encounter-diagnosis] ^short = "encounter-diagnosis"

* category[problem-or-health-concern] from USCoreProblemOrHealthConcern|6.1.0 (required)
* category[problem-or-health-concern] ^short = "problem-list-item | health-concern"

* code 1.. MS
* code from USCoreConditionCodes|6.1.0 (extensible)
// The additional Bindings element was added in US Core 7. It is not in 6.1
/* code ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"
* code ^binding.extension.extension[0].url = "key"
* code ^binding.extension.extension[=].valueId = "us-core-condition-code-current"
* code ^binding.extension.extension[+].url = "purpose"
* code ^binding.extension.extension[=].valueCode = #current
* code ^binding.extension.extension[+].url = "valueSet"
* code ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/us/core/ValueSet/us-core-condition-code-current|6.1.0"
* code ^binding.extension.extension[+].url = "documentation"
* code ^binding.extension.extension[=].valueMarkdown = "US Core uses the current additional binding for encoding newly recorded, non-legacy problem list items, health concerns and diagnosis"
* code ^binding.extension.extension[+].url = "shortDoco"
* code ^binding.extension.extension[=].valueString = "Required for new records"
* code ^binding.description = "Valueset to describe the actual problem experienced by the patient"
*/
// TODO: QUESTION FOR DD, Should the patient and subject elements only point to US Core Patient or Cross-Measure Patient? Also, for some reason, the IG does not build without Group included in the element below. Not sure why.
* subject only Reference(CrossMeasurePatient or Group)
* subject MS
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true
* subject ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = false
* subject.reference 1.. MS

* encounter MS
  * reference 1.. MS
* onset[x] MS
* abatement[x] MS
* recordedDate MS