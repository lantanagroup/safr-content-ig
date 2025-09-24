Profile: AcuteCareHospitalMonthlyReportingCondition
Parent: Condition
Id: ach-monthly-condition
Title: "ACH Monthly Event Condition"
Description: "This profile contains Required and Must Support data elements for reporting patient condition information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® US Core Condition Profile v3.1.1](http://hl7.org/fhir/us/core/STU3.1.1/StructureDefinition-us-core-condition.html)."
* obeys Condition-coding-from-common-codesystems
* obeys dqm-Con-2
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1

* category MS
* category ^condition = "SDOH-Con-2"
* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^short = "category codes"
* category contains
    encounter-diagnosis 0..1 MS and
    problem-or-health-concern 0..* MS

* category[encounter-diagnosis] = ConditionCategoryCodes#encounter-diagnosis
* category[encounter-diagnosis] ^short = "encounter-diagnosis"

* category[problem-or-health-concern] from USCoreProblemOrHealthConcern|6.1.0 (required)
* category[problem-or-health-concern] ^short = "problem-list-item | health-concern"

* code 1.. MS
* code from USCoreConditionCodes|6.1.0 (preferred)
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

* subject only Reference(USCorePatientProfile|6.1.0 or Group)
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