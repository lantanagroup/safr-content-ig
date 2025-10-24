Profile: AcuteCareHospitalMonthlyReportingCoverage
Parent: QICoreCoverage|6.0.0
Id: ach-monthly-coverage
Title: "ACH Monthly Event Coverage"
Description: "This profile contains Required and Must Support data elements for reporting coverage information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile inherits from the QI Core 6.0.0 [Coverage](http://hl7.org/fhir/R4/coverage.html) profile, which inherits from the US Core 6.1.0 [Coverage](https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-coverage.html) profile."
* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-coverage|6.0.0"
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591 (extensible)
* type MS

* period MS
* beneficiary.reference 1.. MS
* beneficiary only Reference(CrossMeasurePatient)
* payor.reference 1.. MS


// TODO QUESTION ON DD, us-core-15 requires memberId or subscriber Id. This is an issue that will need to be marked as acceptable as NHSN does not need either identifier.