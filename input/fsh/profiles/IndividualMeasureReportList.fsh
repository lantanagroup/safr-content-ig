Profile: IndividualMeasureReportList
Parent: List
Id: ip-measurereport-list
Title: "NHSN Individual MeasureReport List"
Description: "An Individual MeasureReport List contains references to all Individual MeasureReports for a given NHSN measure; each MeasureReport pertains to an individual patient within the Initial Population of a given measure."
* ^status = #active
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* entry 1..
  * item only Reference(DEQMIndividualMeasureReportProfile)
    * ^short = "Individual measure report reference"