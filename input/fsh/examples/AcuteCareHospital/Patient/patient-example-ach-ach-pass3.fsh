Instance: patient-example-ach-ach-pass3
InstanceOf: CrossMeasurePatient
Title: "Patient - Example ACH Pass3 - CDI/HOB"
Description: "Patient - Example ACH Pass3 - Healthcare facility-onset, antibiotic-treated Clostridioides difficile infection / Hospital-onset bacteremia and fungemia (CDI/HOB)"
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2028-9 "Asian"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "White"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Non Hispanic or Latino"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #M
// Not supported by US Core 3.1.1, Can be added for later versions
//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].valueCodeableConcept = $sct#446151000124109 "Identifies as male gender (finding)"

* meta.security[0] = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#R "Restricted"

* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1601191903010308"
* active = true
* name[0].use = #official
* name[=].text = "Pass3 ACH"
* name[=].family = "ACH"
* name[=].given = "Pass3"
* telecom.system = #email
* telecom.value = "ACHtestcase@testcase.com"
* telecom.use = #home
* gender = #female
* birthDate = "2007-10-08"

* address[0].line = "5678 Sesame Lansing"
* address[=].city = "Lansing"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"

* communication[0].language = urn:ietf:bcp:47#zh "Chinese"
