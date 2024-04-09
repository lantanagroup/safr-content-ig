Instance: immunization-example-rps-influenzatherapeutic
InstanceOf: Immunization
Title: "Immunization - RPS Immunization Example Influenza Therapeutic"
Description: "Immunization - Example RPS Immunization Influenza Therapeutic"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234"
* status = #completed
* vaccineCode = urn:oid:1.2.36.1.2001.1005.17#FLUVAX
* vaccineCode.text = "Fluvax"
* lotNumber = "AAJN11K"
* expirationDate = "2025-02-15"
* patient = Reference(Patient/patient-example-rps-influenzatherapeudic)
* encounter = Reference(Encounter/encounter-example-rps-influenzatherapeudic)
* occurrenceDateTime = "2024-01-02"
* primarySource = true
* doseQuantity = 5 'mg'
* note.text = "Notes on adminstration of vaccine"
* isSubpotent = true