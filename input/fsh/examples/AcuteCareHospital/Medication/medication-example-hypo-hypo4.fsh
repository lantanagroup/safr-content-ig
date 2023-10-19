Instance: medication-example-hypo-hypo4
InstanceOf: AcuteCareHospitalReportingMedication
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "e11kF5DQLQwz8WrCTi-fTXUBZW8CRdsY0CXeVGHY.RA8LNuzDmn9GrZmbcWKSA1xb2ES.RitNJ5o-LqrwbAoS-zJZ9Wp8oS-UB1RNw-eZ22o3"
* code.coding[0] = $atc#B05BA03
* code.coding[+] = $rxnorm#727517
* code.text = "dextrose 50% in water injection syringe"
* status = #active
* form = $sct#385219001 "Solution for injection"
* form.text = "Injection solution"
* ingredient.itemCodeableConcept.coding[0] = $atc#B05BA03
* ingredient.itemCodeableConcept.coding[+] = $rxnorm#727517
* ingredient.itemCodeableConcept.text = "dextrose 50% in water injection syringe"
* ingredient.strength.numerator = 50 '%'
* ingredient.strength.denominator = 50 '%'