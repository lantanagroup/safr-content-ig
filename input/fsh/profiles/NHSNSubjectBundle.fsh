Profile: NHSNSubjectBundle
Parent: Bundle
Id: nhsn-subject-bundle
Title: "NHSN Subject Bundle"
Description: "This profile defines a valid subject-specific dQM Bundle. The Bundle is comprised of entry slices representing the a Patient, individual MeasureReports, and the underlying patient-centric clinical information."
* obeys bundle-no-modifier-extensions and bundle-contain-all-measurereport-references and bundle-all-measurereport-measure-contains-version
* . ^short = "A Bundle contains a collection of Resources"
// WARNING: The constraint index in the following rule (e.g., constraint[0]) may be incorrect.
// Please compare with the constraint array in the original definition's snapshot and adjust as necessary.
  //* ^constraint.expression.fhir_comments = "<expression value=\"(select(modifierExtension) | descendants().select(modifierExtension)).exists().not()\"/>"
* entry ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resource"
  //* ^slicing.discriminator.fhir_comments = "<discriminator>\r\n                    <type value=\"type\"/>\r\n                    <path value=\"resource\"/>\r\n                </discriminator>"
  * ^slicing.rules = #open
  * ^short = "An entry in the Bundle; will have a Resource or information"

* entry contains
//    submitting-organization 1..1 and
//    submitting-device 1..1 and
//    poi-list 1..1 and
//    subject-list 1..* and
    individual-measurereport 1..* and
    patient 1..1
/* entry[submitting-organization] ^short = "The Submitting Organization: the organization that is the source of the data"
  * resource 1..
  * resource only SubmittingOrganization
    * ^short = "Bundle entry for submitting organization"
* entry[submitting-device] ^short = "The Submitting Device: the device or software that is submitting the data"
  * resource 1..
  * resource only NHSNSubmittingDevice
    * ^short = "Bundle entry for submitting device"
* entry[poi-list] ^short = "The Patients of Interest List: a List containing Patient FHIR IDs that may be included in the Initial Population across all measures"
  * resource 1..
  * resource only PatientsOfInterestList
    * ^short = "The Bundle entry for Patients of Interest List"
* entry[subject-list] ^short = "Summary Measure Report: For each measure, there is one Summary MeasureReport. The Summary MeasureReport includes the population count and a link to the List of Individual MeasureReports that are included in the summary"
  * resource only SubjectListMeasureReportProfile
    * ^short = "The Bundle entry for a Summary Measure Report"
*/    
* entry[individual-measurereport] ^short = "Individual Measure Report: each Individual MeasureReport refers to one Patient and one measure included in the Individual Measure Report List"
  * resource 1..
  * resource only DEQMIndividualMeasureReportProfile
    * ^short = "The Bundle entry for an Individual Measure Report"
* entry[patient] ^short = "The Patients associated with an Individual MeasureReport"
  * resource 1..
  * resource only CrossMeasurePatient
    * ^short = "The Bundle entry for a Patient associated with an Individual Measure Report"