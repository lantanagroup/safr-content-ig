Profile: PatientsOfInterestList
Parent: List
Id: poi-list
Title: "Patients-Of-Interest List"
Description: "A Patients of Interest List defines all individual Patients considered for inclusion in NHSN Measure reporting."
* ^status = #active
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* extension contains PatientListApplicablePeriod named patient-list-applicable-period 0..1
* extension[patient-list-applicable-period] ^short = "The reporting period associated with the census List"
* identifier 1..
* entry.item only Reference(USCorePatientProfile)
  * ^short = "Patient Of Interest reference"