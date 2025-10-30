Instance: SafrCapabilityStatementDataAggregator
InstanceOf: CapabilityStatement
Title: "US SAFR Data Aggregator CapabilityStatement"
Usage: #definition
* url = Canonical(SafrCapabilityStatementDataAggregator)
* name = "SafrCapabilityStatementDataAggregator"
* status = #active
* experimental = false
* date = "2024-12-12"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 Public Health Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "This statement defines the expected capabilities of a system that aggregates data from multiple Data Source actors before measure evaluation and then plays the role of a Data Source once aggregation is complete. An example would be a state public health agency aggregating data from all facilities in the state before using those data to produce a MeasureReport containing bed capacity data for the entire state. When FHIR enabled, a Data Aggregator acts as a [US Core Server](http://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html) when playing the role of a Data Source after aggregation. During aggregation, the Data Aggregator acts similar to the SANER options for aggregation, but implements its own CapabilityStatement due to the incompatibilities between DEQM and SANER."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports[+] = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client|6.1.0" 
* imports[+] = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|6.1.0" 
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest[+]
  * mode = #server
* rest[+]
  * mode = #client
