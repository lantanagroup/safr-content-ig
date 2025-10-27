Profile: AcuteCareHospitalMonthlyReportingMedicationRequest
Parent: USCoreMedicationRequestProfile|6.1.0
Id: ach-monthly-medicationrequest
Title: "ACH Monthly Event MedicationRequest"
Description: "This profile contains Required and Must Support data elements for reporting medication request (order) information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the US Core 6.1.0 [MedicationRequest](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-medicationrequest.html) profile and applies capabilities from the QI Core 6.0.0 [MedicationRequest](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationrequest.html) profile and QI Core 6.0.0 [Medication Not Requested](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-medicationnotrequested.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|6.1.0"
/*
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-medicationrequest|3.1.1"

This profile does not conform to the US Core 3.1.1 MedicationRequest for reasons that will not affect reporting sites.
Non-compliance Reasoning:
1. MedicationRequest.medication[x]:null	warning	The valueSet http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4|20240606 includes codes not allowed in the claimed profile which has value set http://hl7.org/fhir/us/core/ValueSet/us-core-medication-codes|3.1.1 (codes: 261585, 3640, 2566313, 2566314, etc)
  If a site is reporting with 3.1.1 and does not have these codes, it will not affect the receipt and validation of these resources by NHSN. We will not remove the new codes.
2. MedicationRequest.requester	error	The min value of '0' on the path MedicationRequest.requester does not comply with the value '1' from the claimed profile
  The cardinality in US Core was relaxed and is not required. requester is not used by NHSN and should not be required. We will not add this requirement.
*/
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* status ^short = "(QI-Core)(USCDI) active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown"
* statusReason from http://hl7.org/fhir/ValueSet/medicationrequest-status-reason (extensible)
* statusReason MS
* category from http://hl7.org/fhir/ValueSet/medicationrequest-category (extensible)
* category MS
* priority MS
* doNotPerform MS
* doNotPerform ^short = "(QI-Core) True if medication was not requested"
* reported[x] only Reference(QICorePractitioner or QICorePractitionerRole or QICorePatient or QICoreRelatedPerson)
* reported[x] ^short = "(QI-Core)(USCDI) Reported rather than primary record"
* reasonCode MS

* medication[x] from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.4 (extensible)
* medicationCodeableConcept.extension contains $QICoreNotDoneValueSet named notDoneValueSet 0..1
* medicationCodeableConcept.extension[notDoneValueSet] ^short = "(QI-Core) If not requested,  Url of a value set of medications not requested"
* medication[x] obeys not-done-extension-present

* medicationReference.reference 1.. MS
* medicationReference only Reference(AcuteCareHospitalMonthlyReportingMedication)

* subject only Reference(CrossMeasurePatient)
* subject.reference 1.. MS
* subject ^short = "(QI-Core)(USCDI) Who or group medication request is for"
* encounter only Reference(QICoreEncounter)
* encounter.reference 1.. MS
* encounter ^short = "(QI-Core)(USCDI) Encounter created as part of encounter/admission/stay"
* authoredOn 1..1 MS
* authoredOn ^short = "(QI-Core)(USCDI) When request was initially authored"
* requester only Reference(QICorePractitioner or QICorePractitionerRole or QICorePatient)
* requester ^short = "(QI-Core)(USCDI) Who/What requested the Request"
* requester ^comment = "Should include QICoreDevice but the base profile does excludes device references."
* reasonCode from MedicationRequestReasonValueSet (extensible)
* reasonCode ^short = "(QI-Core)(USCDI) Reason or indication for ordering or not ordering the medication"
* reasonReference MS
  * reference 1.. MS
* reasonReference only Reference(AcuteCareHospitalMonthlyReportingCondition or QICoreSimpleObservation)
* reasonReference ^short = "(QI-Core)(USCDI) QI-Core Condition or Observation that supports the prescription"
* instantiatesCanonical MS
* instantiatesUri MS
* courseOfTherapyType MS
* dosageInstruction ^short = "(QI-Core)(USCDI) How medication should be taken"
* dosageInstruction
  * text MS
  * timing MS
    * event MS
    * repeat MS
      * bounds[x] MS
      * count MS
      * countMax MS
      * duration MS
      * durationMax MS
      * durationUnit MS
      * frequency MS
      * frequencyMax MS
      * period MS
      * periodMax MS
      * periodUnit MS
      * dayOfWeek MS
      * timeOfDay MS
      * when MS
      * offset MS
    * code MS
  * asNeeded[x] MS
  * site MS
  * route from http://hl7.org/fhir/ValueSet/route-codes (extensible)
  * route 1.. MS
  * method MS
  * doseAndRate MS
    * type MS
    * dose[x] MS
    * rate[x] MS


* dosageInstruction.timing ^short = "(QI-Core)(USCDI) When medication should be administered"
* dosageInstruction.timing.repeat ^short = "(QI-Core) When the event is to occur"
* dosageInstruction.timing.repeat.bounds[x] ^short = "(QI-Core) Length/Range of lengths, or (Start and/or end) limits"
* dosageInstruction.timing.repeat.frequency ^short = "(QI-Core) Event occurs frequency times per period"
* dosageInstruction.timing.repeat.frequencyMax ^short = "(QI-Core) Event occurs frequencyMax times per period"
* dosageInstruction.timing.repeat.period ^short = "(QI-Core) Event occurs frequency times per period"
* dosageInstruction.timing.repeat.periodMax ^short = "(QI-Core) Upper limit of period (3-4 hours)"
* dosageInstruction.timing.repeat.periodUnit ^short = "(QI-Core) s | min | h | d | wk | mo | a - unit of time (UCUM)"
* dosageInstruction.asNeeded[x] ^short = "(QI-Core) Take \"as needed\" (for x)"
* dosageInstruction.doseAndRate ^short = "(QI-Core)(USCDI) Amount of medication administered"
* dosageInstruction.doseAndRate.dose[x] ^short = "(QI-Core)(USCDI) Amount of medication per dose"
* dispenseRequest ^short = "(QI-Core)(USCDI) Medication supply authorization"
* dispenseRequest.dispenseInterval ^short = "(QI-Core) Minimum period of time between dispenses"
* dispenseRequest.numberOfRepeatsAllowed ^short = "(QI-Core)(USCDI) Number of refills authorized"
* dispenseRequest.quantity ^short = "(QI-Core)(USCDI) Amount of medication to supply per dispense"
* dispenseRequest.expectedSupplyDuration ^short = "(QI-Core) Number of days supply per dispense"

// TODO QUESTION ON DD, QI Core MedicationRequest does not allow a doNotPerform = true. Therefore this will have to be based off of US Core MedicationRequest