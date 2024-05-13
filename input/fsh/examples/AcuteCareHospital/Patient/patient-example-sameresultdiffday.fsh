Instance: patient-example-sameresultdiffday
InstanceOf: CrossMeasurePatient
Title: "Patient - Example Sameresultdiffday"
Description: "Patient - Example Sameresultdiffday - Hypoglycemia"
Usage: #example
* extension[0].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "White or Caucasian"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
* extension[=].extension[0].url = "ombCategory"
* extension[=].extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2186-5 "Not Hispanic or Latino"
* extension[=].extension[+].url = "text"
* extension[=].extension[=].valueString = "Not Hispanic or Latino"
* extension[+].url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex"
* extension[=].valueCode = #M
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "100000889"
* active = true
* name[0].use = #official
* name[=].text = "Sameresultdiffday Hypo"
* name[=].family = "Hypo"
* name[=].given = "Sameresultdiffday"
* name[+].use = #usual
* name[=].text = "Sameresultdiffday Hypo"
* name[=].family = "Hypo"
* name[=].given = "Sameresultdiffday"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #male
* birthDate = "1952-12-31"
* deceasedBoolean = false
* address[0].use = #old
* address[=].line = "5678 Sesame"
* address[=].city = "Lansing"
* address[=].district = "INGHAM"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"
* address[+].use = #home
* address[=].line = "5678 Sesame"
* address[=].city = "Lansing"
* address[=].district = "INGHAM"
* address[=].state = "MI"
* address[=].postalCode = "48864"
* address[=].country = "US"