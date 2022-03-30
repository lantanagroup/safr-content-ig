library AdultPatients version '0.0.001'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers
include MATGlobalCommonFunctionsFHIR4 version '6.1.000' called Global

parameter "Performance Period" Interval<DateTime>
 default Interval[@2022-01-01T00:00:00.0, @2022-02-01T00:00:00.0)

context Patient

define "Initial Population":
    "Age" >= 18

define "Age":
    "AgeInYearsAt"(start of "Performance Period")

define "SDE Conditions":
    [Condition]

define "SDE Medication Requests":
    [MedicationRequest]