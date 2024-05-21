Instance: patient-example-rps-rsvlabbtg
InstanceOf: CrossMeasurePatient
Title: "Patient - RPS Patient Example RSV Lab BTG"
Description: "Patient - Example RPS Patient RSV Lab BTG"
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2076-8 "Native Hawaiian or Other Pacific Islander"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Native Hawaiian or Other Pacific Islander"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Non Hispanic or Latino"

//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = $sct#446141000124107 "Identifies as female gender"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Identifies as female gender"

* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #F
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1000009002"
* active = true
* name[0].use = #official
* name[=].text = "RPS InfluenzaTherapeutic"
* name[=].family = "InfluenzaTherapeutic"
* name[=].given = "RPS"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #female
* birthDate = "2015-05-05"
* deceasedBoolean = false
* address[+].use = #home
* address[=].line = "123 Happy Place"
* address[=].city = "Charlotte"
* address[=].state = "MI"
* address[=].postalCode = "48813"
* address[=].country = "US"

* contact[+].relationship = #Mother
* contact[=].name.text = "Mother Nature"
* contact[=].name.family = "Nature"
* contact[=].name.given = "Mother"
* contact[=].address.use = #home
* contact[=].address.line = "123 Happy Place"
* contact[=].address.city = "Charlotte"
* contact[=].address.state = "MI"
* contact[=].address.postalCode = "48813"
* contact[=].address.country = "US"

