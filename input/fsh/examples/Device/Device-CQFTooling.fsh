Instance: cqf-tooling
InstanceOf: CRMISoftwareSystemDevice|1.0.0
Title: "Device - CQF Tooling System Example"
Description: "Example of a Software System Device instance for describing tooling that was used to process artifacts."
Usage: #example
//* meta.profile = "http://hl7.org/fhir/us/cqfmeasures/StructureDefinition/device-softwaresystem-cqfm"
* meta.profile = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-softwaresystemdevice|1.0.0"
* manufacturer = "CQFramework"
* deviceName.name = "cqf-tooling"
* deviceName.type = #manufacturer-name
* type = SoftwareSystemTypeCodes#tooling
* version.value = "3.1.0-SNAPSHOT"