Instance: USSAFRMeasureBundleExample
InstanceOf: USSafrMeasureBundle
Title: "Bundle - US SAFR Measure Bundle Example"
Description: "Bundle containing a measure for NHSN reporting."
Usage: #example

* type = #collection
//* timestamp = "2025-03-05T08:15:00-05:00"
* entry[measure].resource = BedCapacityMeasureExample
* entry[measure].fullUrl = "http://hl7.org/fhir/us/safr/Measure/BedCapacityMeasureExample"
* entry[1].resource = cqf-tooling
* entry[1].fullUrl = "http://hl7.org/fhir/us/safr/Device/cqf-tooling"
