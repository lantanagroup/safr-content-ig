Instance: device-example-ach-ach-pass2-compress-hose
InstanceOf: AcuteCareHospitalDevice
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "100051034"

* type.coding[+] = $sct#348681001 "Graduated compression elastic hosiery (physical object)"
* type.text = "Graduated compression elastic hosiery"
* patient = Reference(patient-example-ach-ach-pass2)
* patient.display = "Pass2 ACH"


