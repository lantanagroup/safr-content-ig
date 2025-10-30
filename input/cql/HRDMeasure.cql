library HRDMeasureLibrary version '1.0.0'

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1' called FHIRHelpers

// Terminology definitions
codesystem "LOINC": 'http://loinc.org'
codesystem "SNOMED CT": 'http://snomed.info/sct'
codesystem "ICD-10-CM": 'http://hl7.org/fhir/sid/icd-10-cm'

// Value sets
valueset "Respiratory Specimen Collection Devices": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1125'
valueset "COVID-19 Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1123'
valueset "Influenza Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1012'
valueset "RSV Tests": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124'
valueset "ICU Location Types": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87'
valueset "Ventilator Device Types": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.5.1001'

// Parameter for measurement period
parameter "Measurement Period" Interval<Date>
  default Interval[@2025-03-01, @2025-03-07]

context Patient

// STRUCTURE MEASURE COMPONENTS
// For a structure measure, we assess capabilities, resources and organizational structures

// 1. Test for the presence of respiratory testing capabilities
define "Has COVID-19 Testing Capability":
  exists (
    [Device] Device
      where Device.type.coding in "COVID-19 Tests"
        and Device.status = 'active'
  )

define "Has Influenza Testing Capability":
  exists (
    [Device] Device
      where Device.type.coding in "Influenza Tests"
        and Device.status = 'active'
  )

define "Has RSV Testing Capability":
  exists (
    [Device] Device
      where Device.type.coding in "RSV Tests"
        and Device.status = 'active'
  )

// 2. Check for specimen collection capabilities
define "Has Specimen Collection Capabilities":
  exists (
    [Device] Device
      where Device.type.coding in "Respiratory Specimen Collection Devices"
        and Device.status = 'active'
  )

// 3. Check for ICU capabilities
define "Has ICU Locations":
  exists (
    [Location] Location
      where Location.type.coding in "ICU Location Types"
        and Location.status = 'active'
  )

// 4. Check for ventilator resources
define "Has Ventilator Resources":
  exists (
    [Device] Device
      where Device.type.coding in "Ventilator Device Types"
        and Device.status = 'active'
  )

// 5. Check for protocol documentation
define "Has HRD Reporting Protocol":
  exists (
    [DocumentReference] D
      where D.type.coding.code in {'11516-2'} // LOINC for infection control protocol
        and D.status = 'current'
        and D.description contains 'NHSN'
        and D.description contains 'HRD'
  )

// CONTINUOUS VARIABLE CALCULATIONS

// Hospital capacity metrics
define "Total Bed Capacity":
  Sum(
    [Location] Location
      where Location.status = 'active'
        and Location.physicalType.coding.code = 'bd'
      return (
        Location.extension E
          where E.url = 'http://hl7.org/fhir/StructureDefinition/location-bed-count'
          return E.valueInteger
      ).valueInteger
  )

define "ICU Bed Capacity":
  Sum(
    [Location] Location
      where Location.status = 'active'
        and Location.type.coding in "ICU Location Types"
        and Location.physicalType.coding.code = 'bd'
      return (
        Location.extension E
          where E.url = 'http://hl7.org/fhir/StructureDefinition/location-bed-count'
          return E.valueInteger
      ).valueInteger
  )

define "Ventilator Count":
  Count(
    [Device] Device
      where Device.type.coding in "Ventilator Device Types"
        and Device.status = 'active'
  )

// Weekly reporting compliance and metrics
define "Reporting Weeks in Measurement Period":
  Count(
    expand{@2025-03-01, @2025-03-07, week}
  )

define "HRD Reports Submitted During Period":
  Count(
    [Communication] C
      where C.category.coding.code in {'notification'}
        and C.topic.text contains 'NHSN'
        and C.topic.text contains 'HRD'
        and C.sent during "Measurement Period"
  )

define "Weekly Reporting Compliance":
  "HRD Reports Submitted During Period" / "Reporting Weeks in Measurement Period"

// Structural readiness scores
define "Has All Testing Capabilities":
  if ("Has COVID-19 Testing Capability" and "Has Influenza Testing Capability" and "Has RSV Testing Capability")
    then 1
    else 0

define "Has Required Reporting Structure":
  if ("Has HRD Reporting Protocol") 
    then 1
    else 0

// Continuous variable for structural measure assessment
define "Structural Readiness Score":
  ("Has COVID-19 Testing Capability" as Integer +
   "Has Influenza Testing Capability" as Integer +
   "Has RSV Testing Capability" as Integer +
   "Has Specimen Collection Capabilities" as Integer +
   "Has ICU Locations" as Integer +
   "Has Ventilator Resources" as Integer +
   "Has HRD Reporting Protocol" as Integer) / 7.0 * 100.0

// Main measure calculation - now focusing on structural components and their ratings
define "Measure Population":
  true

define "Measure Observation":
  "Structural Readiness Score"