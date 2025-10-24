Profile: AcuteCareHospitalMonthlyReportingProcedure
Parent: USCoreProcedureProfile|6.1.0
Id: ach-monthly-procedure
Title: "ACH Monthly Event Procedure"
Description: "This profile contains Required and Must Support data elements for reporting procedure information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the US Core 6.1.0 [Procedure](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-procedure.html) profile and applies capabilities from the QI Core 6.0.0 [Procedure](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-procedure.html) profile and QI Core 6.0.0 [Procedure Not Done](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-procedurenotdone.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure|6.1.0"
/*
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-procedure|3.1.1"

This profile does not conform to the US Core 3.1.1 Procedure for reasons that will not affect reporting sites.
Non-compliance Reasoning:
1. Procedure.performed[x]	error	The min value of '0' on the path Procedure.performed[x] does not comply with the value '1' from the claimed profile
  Performed[x] is now only required when status is completed or in-progress
2. Procedure.performed[x]	error	The type 'string' is not allowed in the claimed profile
  This element is now allowable and needs to remain so
3. Procedure.performed[x]	error	The type 'Age' is not allowed in the claimed profile
  This element is now allowable and needs to remain so
4. Procedure.performed[x]	error	The type 'Range' is not allowed in the claimed profile
  This element is now allowable and needs to remain so
*/
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1

* extension contains http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-recorded named recorded 0..1
* extension[recorded] ^short = "(QI-Core) When the procedure was first captured in the subject's record"
* basedOn ^short = "(QI-Core)(USCDI) A request for this procedure"
* code.extension contains http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet named notDoneValueSet 0..1
* code.extension[notDoneValueSet] ^short = "(QI-Core) What was not performed"
* code obeys not-done-extension-present

* status ^short = "(QI-Core)(USCDI) preparation | in-progress | not-done | on-hold | stopped | completed | entered-in-error | unknown"
* statusReason from NegationReasonCodes (extensible)
* statusReason ^short = "(QI-Core) Reason for the current status"

* subject ^short = "(QI-Core)(USCDI) Who the procedure was performed on"
* subject only Reference(CrossMeasurePatient)
* subject.reference 1.. MS
* encounter MS
  * reference 1.. MS
* performed[x] ^short = "(QI-Core)(USCDI) When the procedure was performed"
* location MS
  * reference 1.. MS
* reasonCode MS
* reasonCode from ProcedureReasonValueSet (extensible)
* reasonCode ^short = "(QI-Core)(USCDI) Coded reason procedure performed or Explanation/Justification for procedure or service"
* reasonReference MS
  * reference 1.. MS
* reasonReference only Reference(AcuteCareHospitalMonthlyReportingCondition or AcuteCareHospitalMonthlyNoteDiagnosticReport or USCoreDocumentReferenceProfile)
* reasonReference ^short = "(QI-Core)(USCDI) Coded reason procedure performed or Explanation/Justification for procedure or service"
* bodySite MS
* bodySite from http://hl7.org/fhir/ValueSet/body-site (extensible)