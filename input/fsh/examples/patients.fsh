Instance: ed-pat-1
InstanceOf: QICorePatient
Title: "Patient - Example ED Patient 1"
Usage: #example
* meta.profile = Canonical(QICorePatient|6.0.0)
* identifier.use = #usual
* identifier.type = $v2-0203#MR "Medical record number"
* identifier.type.text = "MRN"
* identifier.system = "http://example.org/identifiers/"
* identifier.value = "1601191902010308"
* active = true
* name[0].use = #official
* name[=].text = "Ed Patient1"
* name[=].family = "Patient1"
* name[=].given = "Ed"
* gender = #female
* birthDate = "1965-12-22"