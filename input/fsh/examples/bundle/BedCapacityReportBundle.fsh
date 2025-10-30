// NHSN Bed Capacity Measure Report Bundle
// This represents a complete package for submitting bed capacity data

Instance: HospitalBedCapacityReportBundle
InstanceOf: SafrMeasureReportBundle
Title: "Bundle - Bed Capacity Report Bundle Example"
Description: "Bundle containing a measure report and all referenced resources for NHSN bed capacity reporting."
Usage: #example

* type = #collection
* timestamp = "2025-03-05T08:15:00-05:00"

// Entry 1: Reporting Organization
* entry[submitting-organization].resource = MemorialHospitalOrganization
* entry[submitting-organization].fullUrl = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38981"


// Entry 2: Submitting software
* entry[submitting-device].resource = cqf-tooling
* entry[submitting-device].fullUrl = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38982"


// Entry 3: The Measure Report
* entry[measurereport].resource = BedCapacityMeasureReport
* entry[measurereport].fullUrl = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38984"


// Entry 4: Hospital Facility Location
* entry[+].resource = MemorialHospitalFacility
* entry[=].fullUrl = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38983"