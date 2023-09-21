Profile: SubjectListMeasureReportProfile
Parent: MeasureReport
Id: subjectlist-measurereport
Title: "Subject-List MeasureReport Profile"
Description: "A Subject-List MeasureReport contains the count of subjects (i.e. patients) in the Initial Population (IP). It also references the Individual MeasureReport List."
* ^status = #active
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* contained ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* contained contains ip-measurereport-list 1..1
* contained[ip-measurereport-list] only IndividualMeasureReportList
  * ^short = "The Individual MeasureReport List pointed to by MeasureReport.group.population.subjectResults"
* type only code
* type = #subject-list (exactly)
* type MS SU
  * ^isModifier = false
* group 1..1 MS
  * ^short = "Initial population group"
  * population 1..1 MS
    * ^short = "Initial population"
    * code 1..
    * code = $measure-population#initial-population "Initial Population"
    * count 1..
    * subjectResults 1..
    * subjectResults only Reference(IndividualMeasureReportList)
      * ^short = "List referencing all individual measure reports for this measure"