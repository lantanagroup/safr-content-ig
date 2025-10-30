Instance: SafrCapabilityStatementMeasureReportRecipient
InstanceOf: CapabilityStatement
Title: "US SAFR MeasureReport Recipient CapabilityStatement"
Usage: #definition
* url = Canonical(SafrCapabilityStatementMeasureReportRecipient)
* name = "SafrCapabilityStatementMeasureReportRecipient"
* status = #active
* experimental = false
* date = "2024-07-30"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 Public Health Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "This statement defines the expected capabilities of a system at NHSN, federal and jurisdictional Public Health Agencies including State, Tribal, Local and Territorial (STLT) Health Departments that receives MeasureReport bundles from the Measure Evaluation Engine and validates 
the result against the profiles in this implementation guide, and potentially other measure-specific profiles that are distributed with the measures themselves. The MeasureReport Recipient acts as a 
[DEQM Receiver Server](https://www.hl7.org/fhir/us/davinci-deqm/STU4/CapabilityStatement-receiver-server.html), provides write access to Bundle resources containing 
MeasureReport and other related resources, and implements the $validate operation."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/davinci-deqm/CapabilityStatement/receiver-server|5.0.0-ballot" //http://hl7.org/fhir/us/cqfmeasures/CapabilityStatement/publishable-measure-repository  CQFMPublishableMeasureRepository|3.0.0)
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest[+]
  * mode = #server
  * security.description = "Implementations **SHOULD** consider the guidance included Security section of this IG."

  * resource[+]
    * type = #Bundle
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * supportedProfile[+] = Canonical(SafrMeasureReportBundle)
    * supportedProfile[=].extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * interaction[+]
      * code = #create
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
    * interaction[+]
      * code = #read
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
    * interaction[+]
      * code = #search-type
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
//TODO. How are these searched for?

  * resource[+]
    * type = #MeasureReport
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * supportedProfile[+] = Canonical(DEQMSubjectListMeasureReport)
    * supportedProfile[=].extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * supportedProfile[+] = Canonical(DEQMSummaryMeasureReportProfile)
    * supportedProfile[=].extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * supportedProfile[+] = Canonical(DEQMIndividualMeasureReportProfile)
    * supportedProfile[=].extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * interaction[+]
      * code = #create
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
    * interaction[+]
      * code = #read
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD
    * interaction[+]
      * code = #search-type
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHOULD

