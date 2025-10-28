Profile: LongTermCareMonthlyReportingCoverage
Parent: QICoreCoverage|6.0.0
Id: ltc-monthly-coverage
Title: "LTC Monthly Event Coverage"
Description: "This profile contains Required and Must Support data elements for reporting coverage information to the NHSN Long-term Care Monthly Digital Quality Measure. This profile is based on the HL7 FHIR® QI Core [Coverage](http://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-coverage.html) profile, which inherits from the US Core 6.1.0 [Coverage](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-coverage.html) profile."
* ^status = #active
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-coverage|6.0.0"
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591 (extensible)
* type MS
// * policyHolder MS
//   * reference 1.. MS
* subscriber MS
  * reference 1.. MS
// * subscriberId MS
// * dependent MS
// * relationship MS
// * period MS
// * beneficiary.reference 1.. MS
// * payor.reference 1.. MS