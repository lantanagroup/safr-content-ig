Instance: SafrCapabilityStatementDataSource
InstanceOf: CapabilityStatement
Title: "US SAFR Data Source CapabilityStatement"
Usage: #definition
* url = Canonical(SafrCapabilityStatementDataSource)
* name = "SafrCapabilityStatementDataSource"
* status = #active
* experimental = false
* date = "2024-12-12"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 Public Health Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "This statement defines the expected capabilities of a system containing data (typically patient data, but could be situational awareness data) 
that will be evaluated against one or more measures. This may be a FHIR server, an EHR with a FHIR endpoint (facade), an internal data store when the Data Source 
and Measure Evaluation Engine actors are played by the same system such as an EHR that does it’s own measure evaluation, or it may be a system containing other data 
such as situational awareness data that is reporting via CSV or other format. When FHIR enabled, the Data Source acts as a 
[US Core Server](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html).

Note: US Core Server is only needed for external evaluation engines. Examples of where this is not needed, is an EHR querying it's own data source using proprietary data access methods."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|6.1.0" //"http://hl7.org/fhir/us/core/CapabilityStatement/us-core-server|6.1.0" UsCoreServerCapabilityStatement
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest[+]
  * mode = #server