Instance: medication-example-rps-initialpopulationpass
InstanceOf: RespiratoryPathogensSurveillanceEventMedication
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eZeW55xkBH0DrR0Xj004fNlA99h1sjXKwuhGs.PNpjjUi.Dh2-U-oGW0c9xZjPn2b29S.YZMgFiH.76i57tFS1PARcjzOMkC6TPHQQXiH6vA3"
* code.coding[+] = $rxnorm#2284960
* code.coding[+] = $rxnorm#2395502
* code.text = "remdesivir 100 MG Injection"
* status = #active
* form = $sct#385219001 "Solution for injection"
* form.text = "Injection solution"
* ingredient.itemCodeableConcept.coding[+] = $rxnorm#2284960
* ingredient.itemCodeableConcept.coding[+] = $rxnorm#2395502
* ingredient.itemCodeableConcept.text = "Insulin glargine (LANTUS) 100 unit/mL injection"
* ingredient.strength.numerator = 100 'U/mL' "unit/mL"
* ingredient.strength.denominator = 100 'U/mL' "unit/mL"