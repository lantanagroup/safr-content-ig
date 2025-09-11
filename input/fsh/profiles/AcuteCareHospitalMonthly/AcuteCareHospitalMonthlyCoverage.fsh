Profile: AcuteCareHospitalMonthlyReportingCoverage
Parent: Coverage
Id: ach-monthly-coverage
Title: "ACH Monthly Event Coverage"
Description: "This profile contains Required and Must Support data elements for reporting coverage information to the NHSN Acute Care Hospital (ACH) Monthly Digital Quality Measure. This profile is based on the [HL7 FHIR® R4 Coverage Profile v4.0.1](http://hl7.org/fhir/R4/coverage.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* type from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591 (extensible)
* type MS
* policyHolder MS
  * reference 1.. MS
* subscriber MS
  * reference 1.. MS
* subscriberId MS
* dependent MS
* relationship MS
* period MS
* beneficiary.reference 1.. MS
* payor.reference 1.. MS