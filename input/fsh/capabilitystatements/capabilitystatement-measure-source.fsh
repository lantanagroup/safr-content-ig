Instance: SafrCapabilityStatementmeasurerepository
InstanceOf: CapabilityStatement
Title: "US SAFR Measure Source CapabilityStatement"
Usage: #definition
* url = Canonical(SafrCapabilityStatementmeasurerepository)
* name = "SafrCapabilityStatementmeasurerepository"
* status = #active
* experimental = false
* date = "2024-07-30"
* publisher = "HL7 International / Public Health"
* contact.name = "HL7 Public Health Work Group"
* contact.telecom.system = #url
* contact.telecom.value = "http://www.hl7.org/Special/committees/pher"
* description = "This statement defines the expected capabilities of a system at NHSN, federal and jurisdictional Public Health Agencies including State, Tribal, Local and Territorial (STLT) Health Departments that stores FHIR resources such as Measure, Library, ValueSet, etc. that are used for 
Measure Reporting. The Measure Evaluation Engine queries the Measure Source for the latest Measure content before querying the Patient Data Source and performing measure evaluation. 
The Measure Source acts as a [CQFM Publishable Measure Repository](https://hl7.org/fhir/us/cqfmeasures/measure-repository-service.html#publishable-measure-repository)."
* jurisdiction = urn:iso:std:iso:3166#US
* kind = #requirements
* imports = "http://hl7.org/fhir/us/cqfmeasures/CapabilityStatement/publishable-measure-repository|3.0.0" 
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* rest[+]
  * mode = #server
  * security.description = "Implementations **SHOULD** consider the guidance included [NHSN Security & Privacy Considerations](security.html)."

// TODO, The CQFM meathod of getting the measure/ibrary bundle it through the Library/$cqfm.package operation
  * resource[+]
    * type = #Library
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHOULD
    * supportedProfile = Canonical(CRMIComputableLibrary|1.0.0)
    * supportedProfile.extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
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


  * resource[+]
    * type = #Measure
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHOULD
    * supportedProfile = Canonical(CQFMComputableMeasure)
    * supportedProfile.extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
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

//Add Bundle. How are these searched for?