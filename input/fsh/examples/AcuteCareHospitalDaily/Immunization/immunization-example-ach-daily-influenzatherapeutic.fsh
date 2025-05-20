Instance: immunization-example-ach-daily-influenzatherapeutic
InstanceOf: Immunization
Title: "Immunization - ACH Daily Immunization Example Influenza Therapeutic"
Description: "Immunization - Example ACH Daily Immunization Influenza Therapeutic"
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234"
* status = #completed
* vaccineCode = urn:oid:1.2.36.1.2001.1005.17#FLUVAX
* vaccineCode.text = "Fluvax"
* lotNumber = "AAJN11K"
* expirationDate = "2025-02-15"
* patient = Reference(patient-example-ach-daily-influenzatherapeutic)
* encounter = Reference(encounter-example-ach-daily-influenzatherapeutic)
* occurrenceDateTime = "2024-01-02"
* primarySource = true
* doseQuantity = 5 'mg'
* note.text = "Notes on administration of vaccine"
* isSubpotent = true