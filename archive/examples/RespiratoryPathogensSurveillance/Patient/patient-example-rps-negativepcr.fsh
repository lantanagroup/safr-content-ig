Instance: patient-example-rps-negativepcr
InstanceOf: CrossMeasurePatient
Title: "Patient - RPS Patient Example Negative PCR"
Description: "Patient - Example RPS Patient Negative PCR"
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2028-9 "Asian"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Asian"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Non Hispanic or Latino"

//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].extension[0].url = "ombCategory"
//* extension[=].extension[=].valueCoding = $sct#446131000124102 "Identifies as non-conforming gender"
//* extension[=].extension[+].url = "text"
//* extension[=].extension[=].valueString = "Identifies as non-conforming gender"

* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #F
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1000009001"
* active = true
* name[0].use = #official
* name[=].text = "RPS NegativePCR"
* name[=].family = "NegativePCR"
* name[=].given = "RPS"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #other
* birthDate = "2005-02-01"
* deceasedBoolean = false
* address[+].use = #home
* address[=].line = "456 Alphabet Street"
* address[=].city = "Lansing"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"