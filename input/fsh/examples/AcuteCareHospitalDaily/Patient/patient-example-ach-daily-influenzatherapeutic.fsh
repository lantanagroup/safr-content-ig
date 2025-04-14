Instance: patient-example-ach-daily-influenzatherapeutic
InstanceOf: CrossMeasurePatient
Title: "Patient - ACH Daily Patient Example Influenza Therapeutic"
Description: "Patient - Example ACH Daily Patient Influenza Therapeutic"
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
// Not supported by US Core 3.1.1, Can be added for later versions
//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = $sct#446151000124109 "Identifies as male gender"
//* extension[=].extension[+].url = "text"
//* extension[=].extension[=].valueString = "Identifies as male gender"

* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #M
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1000009001"
* active = true
* name[0].use = #official
* name[=].text = "ACHDaily InfluenzaTherapeutic"
* name[=].family = "InfluenzaTherapeutic"
* name[=].given = "ACHDaily"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #male
* birthDate = "2020-02-29"
* deceasedBoolean = false
* address[+].use = #home
* address[=].line = "789 Alphabet Street"
* address[=].city = "Lansing"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"

* contact[+].relationship = $v3-RoleCode#MTH "mother"
* contact[=].name.text = "Mama Bear"
* contact[=].name.family = "Bear"
* contact[=].name.given = "Mama"
* contact[=].address.use = #home
* contact[=].address.line = "789 Alphabet Street"
* contact[=].address.city = "Lansing"
* contact[=].address.state = "MI"
* contact[=].address.postalCode = "48864"
* contact[=].address.country = "US"

