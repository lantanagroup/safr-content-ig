Profile: IndividualMeasureReportList
Parent: List
Id: ip-measurereport-list
Title: "NHSN Individual MeasureReport List"
Description: "An Individual MeasureReport List contains references to all Individual MeasureReports for a given NHSN measure; each MeasureReport pertains to an individual patient within the Initial Population of a given measure."
* ^status = #active
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* entry 1..
  * item only Reference(DEQMIndividualMeasureReportProfile)
    * ^short = "Individual measure report reference. For complete bundle submissions, include reference that resolves in the bundle. For subject specific bundle submissions, this needs to be a business identifier (Last.entry.item.identifier = MeasureReport.identifier)"
    * ^comment = "For complete bundle submissions (using MeasureReport/nhsn-measurereport-bundle) where all of the resources are in the same bundle, a reference should be included. Subject specific bundle submissions (using MeasureReport/nhsn-subject-bundle), the resources are not internally resolvable, so a business identifier is required in (List.entry.item.identifier matching MeasureReport.identifier)"
    * reference 1..