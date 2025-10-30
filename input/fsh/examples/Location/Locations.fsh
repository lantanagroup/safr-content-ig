Instance: MemorialHospitalFacility
Title: "Location - Hospital Facility Example"
Description: "Example of a Hospital Facility for NHSN reporting."
InstanceOf: QICoreLocation
Usage: #example
* identifier.system = "http://example.org/fhir/location-identifier"
* identifier.value = "MEM-MAIN"
* name = "Memorial Hospital Main Campus"
* description = "Main hospital campus including ICU, ED, and Pediatric units"
* status = #active
* mode = #instance
* type = http://terminology.hl7.org/CodeSystem/v3-RoleCode#HOSP "Hospital"
* managingOrganization.reference = "urn:uuid:4c83e586-1277-4132-9b4e-3d1c14d38981" //Reference(MemorialHospitalOrganization)
* address.line = "123 Healthcare Drive"
* address.city = "Springfield"
* address.state = "IL"
* address.postalCode = "62701"
* address.country = "USA"
* physicalType = $location-physical-type#bu "Building"


Instance: EDBed1
InstanceOf: QICoreLocation|6.0.0
Title: "Emergency Dept. Bed 1"
Description: "A bed located in the Emergency Department."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "001"
* status = #active
* name = "ED Bed at Memorial Hospital"
* type = BedCapacityExampleCS#ED "Emergency Department"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: IRFBed2
InstanceOf: QICoreLocation|6.0.0
Title: "Inpatient Rehabilitation Bed 2"
Description: "A bed located in Inpatient Rehabilitation department of the hospital."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "002"
* status = #active
* name = "Inpatient Rehabilitation Bed at Memorial Hospital"
* type = BedCapacityExampleCS#IRF "Inpatient Rehabilitation"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: IPFBed3
InstanceOf: QICoreLocation|6.0.0
Title: "Inpatient Psychiatric Bed 3"
Description: "A bed located in the Inpatient Psychiatric Department of the hospital."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "003"
* status = #active
* name = "Inpatient Psych at Memorial Hospital"
* type = BedCapacityExampleCS#IPF "Inpatient Psychiatric"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: CHLDBed4
InstanceOf: QICoreLocation|6.0.0
Title: "Children's Bed 4"
Description: "A bed located in the Children's Department of the hospital."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "004"
* status = #active
* name = "Children's at Memorial Hospital"
* type = BedCapacityExampleCS#CHLD "Children's or Pediatric"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: OTHBed5
InstanceOf: QICoreLocation|6.0.0
Title: "Other Facility Bed 3"
Description: "A bed located in an subunit of the facility."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "004"
* status = #active
* name = "Other Facility Within Facility Bed"
* type = BedCapacityExampleCS#OTH "Other facility-within-facility or subunit"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: ICUBed6
InstanceOf: QICoreLocation|6.0.0
Title: "Intensive Care Unit Bed 6"
Description: "A bed located in the ICU Unit of the hospital."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "006"
* status = #active
* name = "Intensive Care Unit at Memorial Hospital"
* type = BedCapacityExampleCS#ICU "Intensive Care Unit"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd

Instance: PEDSBed7
InstanceOf: QICoreLocation|6.0.0
Title: "Pediatric Bed 7"
Description: "A bed located in the Pediatrics Unit of the hospital."
Usage: #example
* meta.profile[+] = "http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-location|6.0.0"
* identifier.system = "http://www.example.org/bed-location"
* identifier.value = "007"
* status = #active
* name = "Pediatric at Memorial Hospital"
* type = BedCapacityExampleCS#PEDS "Pediatric"
* physicalType = http://terminology.hl7.org/CodeSystem/location-physical-type#bd