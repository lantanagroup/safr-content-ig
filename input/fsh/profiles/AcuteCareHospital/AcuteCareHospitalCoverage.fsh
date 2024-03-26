Profile: AcuteCareHospitalReportingCoverage
Parent: Coverage
Id: ach-coverage
Title: "ACH Event Coverage"
Description: "This profile contains Required and Must Support data elements for reporting coverage information to the NHSN Acute Care Hospital (ACH) Digital Quality Measures. This profile is based on the [HL7 FHIR® R4 Coverage Profile v4.0.1](http://hl7.org/fhir/R4/coverage.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* type from https://vsac.nlm.nih.gov/valueset/2.16.840.1.114222.4.11.3591/expansion (extensible)
* type MS
* policyHolder MS
* subscriber MS
* subscriberId MS
* dependent MS
* relationship MS
* period MS