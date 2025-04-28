Instance: patient-example-ach-daily-initialpopulationpass
InstanceOf: CrossMeasurePatient
Title: "Patient - ACH Daily Patient Example Initial Population Pass"
Description: "Patient - Example ACH Daily Patient Initial Population Pass"
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#1002-5 "American Indian or Alaska Native"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Asian"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Non Hispanic or Latino"

//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = $sct#407376001 "Male-to-female transsexual"
//* extension[=].extension[+].url = "text"
//* extension[=].extension[=].valueString = "Male-to-female transsexual"

* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #F
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1000009001"
* active = true
* name[0].use = #official
* name[=].text = "ACHDaily, InitialPopulationPass"
* name[=].family = "InitialPopulationPass"
* name[=].given = "ACHDaily"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #female
* birthDate = "2005-01-15"
* deceasedBoolean = false
* address[+].use = #home
* address[=].line = "123 Alphabet Street"
* address[=].city = "Lansing"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"