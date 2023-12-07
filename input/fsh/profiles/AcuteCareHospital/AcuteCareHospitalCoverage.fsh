Profile: AcuteCareHospitalReportingCoverage
Parent: Coverage
Id: ach-reporting-coverage
Title: "Acute Care Hospital Reporting Coverage"
Description: "TO BE REPLACED - This profile contains Required and Must Support data elements for reporting coverage information to the NHSN Glycemic Control, Hypoglycemia Module. This profile is based on the [HL7 FHIR R4 Coverage Profile v4.0.1](http://hl7.org/fhir/R4/coverage.html)."
* ^status = #active
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* type MS
* policyHolder MS
* subscriber MS
* subscriberId MS
* dependent MS
* relationship MS
* period MS