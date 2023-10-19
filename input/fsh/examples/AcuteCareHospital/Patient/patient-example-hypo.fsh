Instance: patient-example-hypo
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
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "urn:oid:1.2.5.8.2.7"
* identifier.value = "100000891"
* active = true
* name[0].use = #official
* name[=].text = "Edadd Hypo"
* name[=].family = "Hypo"
* name[=].given = "Edadd"
* name[+].use = #usual
* name[=].text = "Edadd Hypo"
* name[=].family = "Hypo"
* name[=].given = "Edadd"
* telecom.system = #phone
* telecom.value = "999-999-9999"
* telecom.use = #home
* gender = #male
* birthDate = "1985-12-07"
* deceasedBoolean = false
* address[0].use = #old
* address[=].line = "Homeless"
* address[=].city = "Ann Arbor"
* address[=].state = "MI"
* address[=].postalCode = "48105"
* address[=].country = "US"
* address[+].use = #home
* address[=].line = "Homeless"
* address[=].city = "Ann Arbor"
* address[=].state = "MI"
* address[=].postalCode = "48105"
* address[=].country = "US"