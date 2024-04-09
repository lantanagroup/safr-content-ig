Instance: immunization-example-rps-influenzatherapeudic
InstanceOf: Immunization
Usage: #example
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234"
* status = #completed
* vaccineCode = urn:oid:1.2.36.1.2001.1005.17#FLUVAX
* vaccineCode.text = "Fluvax"
* administeredProduct.concept.coding.system = "urn:oid:2.16.840.1.113883.6.69"
* administeredProduct.concept.coding.code = "70461-0321-03"
* administeredProduct.concept.text = "Flucelvax (Influenza, injectable, MDCK, preservative free, quadrivalent)"
* lotNumber = "AAJN11K"
* expirationDate = "2025-02-15"
* patient = Reference(Patient/patient-example-rps-influenzatherapeudic)
* encounter = Reference(Encounter/encounter-example-rps-influenzatherapeudic)
* occurrenceDateTime = "2024-01-02"
* primarySource = true
* site = $v3-ActSite#LA "left arm"
* route = $v3-RouteOfAdministration#IM "Injection, intramuscular"
* doseQuantity = 5 'mg'
* note.text = "Notes on adminstration of vaccine"
* reason.concept.coding.system = "http://snomed.info/sct"
* reason.concept.coding.code = "429060002"
* isSubpotent = true
* programEligibility.program.text = "VFC"
* programEligibility.programStatus.coding.system = "http://terminology.hl7.org/CodeSystem/immunization-program-eligibility"
* programEligibility.programStatus.coding.code = "uninsured"