Instance: medication-example-ach-daily-initialpopulationpass
InstanceOf: AcuteCareHospitalDailyEventMedication
Title: "Medication - ACH Daily Medication Example Initial Population Pass"
Description: "Medication - Example ACH Daily Medication Initial Population Pass"
Usage: #example
* extension.url = "http://www.cdc.gov/nhsn/fhirportal/dqm/ig/StructureDefinition/link-original-resource-id-extension"
* extension.valueString = "eZeW55xkBH0DrR0Xj004fNlA99h1sjXKwuhGs.PNpjjUi.Dh2-U-oGW0c9xZjPn2b29S.YZMgFiH.76i57tFS1PARcjzOMkC6TPHQQXiH6vA3"
* code.coding[+] = $rxnorm#2284960
* code.coding[+] = $rxnorm#2395502
* code.text = "remdesivir 200 MG IV"
* status = #active
* form = $sct#779438003 "Product containing only heparin in parenteral dose form (medicinal product form)"
* form.text = "Intravenous solution"
* ingredient.itemCodeableConcept.coding[+] = $rxnorm#2284960
* ingredient.itemCodeableConcept.coding[+] = $rxnorm#2395502
* ingredient.itemCodeableConcept.text = "remdesivir 200 MG IV"
* ingredient.strength.numerator = 200 'U/mL' "unit/mL"
* ingredient.strength.denominator = 200 'U/mL' "unit/mL"