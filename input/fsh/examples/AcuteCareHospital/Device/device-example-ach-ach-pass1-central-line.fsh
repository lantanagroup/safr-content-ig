Instance: device-example-ach-ach-pass1-central-line
InstanceOf: AcuteCareHospitalDevice
Usage: #example
* identifier.use = #usual
* identifier.system = "urn:oid:2.16.840.1.113883.19.5.1.698.8"
* identifier.value = "1000510341"

* type.coding[+] = $sct#52124006 "Central venous catheter, device (physical object)"
* type.text = "Central venous catheter, device"
* patient = Reference(patient-example-ach-ach-pass1)
* patient.display = "Pass1 ACH"


