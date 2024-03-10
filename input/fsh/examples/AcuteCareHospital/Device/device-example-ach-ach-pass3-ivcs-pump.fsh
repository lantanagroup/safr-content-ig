Instance: device-example-ach-ach-pass3-ivcs-pump
InstanceOf: AcuteCareHospitalDevice
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "100051035"

* type.coding[+] = $sct#469317002 "Intermittent venous compression system pump (physical object)"
* type.text = "Intermittent venous compression system pump"
* patient = Reference(patient-example-ach-ach-pass3)
* patient.display = "Pass3 ACH"


