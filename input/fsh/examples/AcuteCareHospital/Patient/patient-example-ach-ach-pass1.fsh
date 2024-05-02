Instance: patient-example-ach-ach-pass1
InstanceOf: CrossMeasurePatient
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2054-5 "Black or African American"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Black or African American"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Hispanic or Latino"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #M
// Not supported by US Core 3.1.1, Can be added for later versions
//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].valueCodeableConcept = $sct#446151000124109 "Identifies as male gender (finding)"

* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1601191901010308"
* active = true
* name[0].use = #official
* name[=].text = "Pass1 ACH"
* name[=].family = "ACH"
* name[=].given = "Pass1"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #female
* birthDate = "2024-02-01"
* deceasedBoolean = false
* address[0].use = #home
* address[=].type = #both
* address[=].line = "456 Alphabet Street"
* address[=].city = "Lansing"
* address[=].district = "Ingham County"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"

* contact[0].relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"

* contact[=].name[0].text = "Mom Parent"
* contact[=].name[=].family = "Parent"
* contact[=].name[=].given = "Mom"
* contact[=].address[0].line = "456 Alphabet Street"
* contact[=].address[=].city = "Lansing"
* contact[=].address[=].state = "MI"
* contact[=].address[=].postalCode = "48864"


* communication[0].language = urn:ietf:bcp:47#en-US "English (United States)"