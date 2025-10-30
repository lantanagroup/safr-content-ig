Instance: SafrCapabilityStatementEvaluationEngine
InstanceOf: CapabilityStatement
Title: "US SAFR Data Evaluation Engine CapabilityStatement"
Usage: #definition
* url = Canonical(SafrCapabilityStatementEvaluationEngine)
* name = "SafrCapabilityStatementEvaluationEngine"
* status = #active
* experimental = false
* date = "2024-07-30"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 Public Health Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "This statement defines the expected capabilities of a system  that retrieves data from the Data Source and evaluates those data against one or more measures 
retrieved from the Measure Source. The resulting MeasureReport bundle and related resources are then sent to the MeasureReport recipient. The Measure Evaluation Engine acts as a 
[US Core Client](https://www.hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-client.html), 
a [DEQM Reporter Client](https://www.hl7.org/fhir/us/davinci-deqm/STU4/CapabilityStatement-reporter-client.html), and implements the $evaluation-measure operation.

Note: FHIR queries are not always required. In the case, an EHR retrieves data from it's own internal data store using non-FHIR methods or imports data from other systems that are not FHIR-enabled."

* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports[+] = "http://hl7.org/fhir/us/core/CapabilityStatement/us-core-client|6.1.0" 
* imports[+] = "http://hl7.org/fhir/us/davinci-deqm/CapabilityStatement/reporter-client" 
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest[+]
  * mode = #server
  * resource[+]
    * type = #Measure
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL

    * operation[+]
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "evaluate"
      * definition = "http://hl7.org/fhir/us/davinci-deqm/OperationDefinition/evaluate"
  