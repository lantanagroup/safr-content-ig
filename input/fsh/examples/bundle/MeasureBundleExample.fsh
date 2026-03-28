Instance: NHSNSAFRMeasureBundleExample
InstanceOf: USSafrMeasureBundle
Title: "Bundle - NHSN SAFR Measure Bundle Example"
Description: "Bundle containing a measure for NHSN reporting."
Usage: #example

* type = #collection
//* timestamp = "2025-03-05T08:15:00-05:00"
* entry[measure].resource = BedCapacityMeasure
* entry[measure].fullUrl = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/Measure/BedCapacityMeasure"
* entry[1].resource = cqf-tooling
* entry[1].fullUrl = "http://www.cdc.gov/nhsn/fhirportal/safr/ig/Device/cqf-tooling"
