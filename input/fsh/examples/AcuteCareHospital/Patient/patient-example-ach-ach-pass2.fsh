Instance: patient-example-ach-ach-pass2
InstanceOf: CrossMeasurePatient
Usage: #inline
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "White"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Non Hispanic or Latino"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #F
// Not supported by US Core 3.1.1, Can be added for later versions
//* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-genderIdentity"
//* extension[=].valueCodeableConcept = $sct#446141000124107 "Identifies as female gender (finding)"

* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "1601191902010308"
* active = true
* name[0].use = #official
* name[=].text = "Pass2 ACH"
* name[=].family = "ACH"
* name[=].given = "Pass2"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #female
* birthDate = "1965-12-22"
* deceasedDateTime = "2024-02-02T16:22:00-05:00"

* address[0].line = "123 Sesame Street Lansing"
* address[=].city = "Lansing"
* address[=].district = "Ingham County"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"