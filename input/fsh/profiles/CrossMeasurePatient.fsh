Profile: CrossMeasurePatient
Parent: QICorePatient|6.0.0
Id: cross-measure-patient
Title: "Cross-Measure Patient Profile"
Description: "This profile contains NHSN-specific Required and Must-Support elements for reporting Patient information on public-health surveillance measures to [NHSN](https://www.cdc.gov/nhsn/index.html).

This profile inherits from the QI Core 6.0.0 [Patient](https://hl7.org/fhir/us/qicore/STU6/StructureDefinition-qicore-patient.html) profile, which inherits from the US Core 6.1.0 [Patient](http://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-patient.html) profile.

NHSN only recognizes the data element 'sex', with male and female as the only accepted responses. These data are mapped from either the patient.extension (birthsex), or patient.gender FHIR standard data elements. These two FHIR standard data elements provide male/female options, per US Core 3.1.1.  

For data submitted for patient.gender, and/or patient.extension (birthsex) that do not align with male or female, NHSN will label those responses as not reported. As national standards update, this resource will also be updated."

* ^baseDefinition = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-patient|6.0.0"
* ^extension[$compliesWithProfile].valueCanonical = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|3.1.1"
* obeys patient-full-name
* id 1..
* meta.extension contains ReceivedDate named link-received-date-extension 0..1
* extension[race] MS
* extension[race] ^short = "US Core Race Extension (If present, must include at least one of the required codes. Preferably this would include at least a code in the ombCategory slice.)"
* extension[ethnicity] MS
* extension[ethnicity] ^short = "US Core Race Extension (If present, must include at least one of the required codes. Preferably this would include at least a code in the ombCategory slice.)"
* extension[tribalAffiliation] MS


* extension[sex] MS


* identifier
  * use MS
  * type MS
  * period MS

* name
  * use MS
  * text MS
  * prefix MS
  * suffix MS
  * period MS


* telecom MS
  * rank MS
  * period MS

* birthDate 1..
* deceased[x] MS

* address
  * use MS
  * type MS
  * text MS
  * district MS
  * country MS
  * period MS

* contact MS
  * relationship MS
  * name MS
  * telecom MS
  * address MS
  * period MS
* communication.preferred MS
* link MS
  * other.reference 1.. MS


/*Requirements for Release 1.0.0 before inheriting from QICorePatient|6.0.0
* identifier 1..
  * use MS
  * type MS
  * period MS
* name
  * use MS
  * text MS
  * prefix MS
  * suffix MS
  * period MS
* telecom
  * rank MS
  * period MS
* birthDate 1..
* deceased[x] MS
* address
  * use MS
  * type MS
  * text MS
  * district MS
  * country MS
* contact MS
  * relationship MS
  * name MS
  * address MS
  * period MS
* communication.preferred MS
* link MS
  * other.reference 1..
*/