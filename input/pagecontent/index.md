### Overview

The US Situational Awareness Framework for Reporting (US SAFR) Implementation Guide (IG) establishes a standardized, FHIR-based approach to support public health 
decision-making during emergencies. By enhancing situational awareness, this IG aims to provide a real-time, national or jurisdictional view of healthcare system capacity, 
respiratory disease trends, and other critical public health metrics. The guide is designed to facilitate seamless data exchange between healthcare facilities and
public health authorities (federal and/or jurisdictional),thereby strengthening the nation’s emergency preparedness and response capabilities.


### Purpose ###

This specification seeks to achieve the following objectives:

1. **Standardized FHIR Interfaces:** Enable interoperable data exchange with the National Healthcare Safety Network (NHSN) of the Centers for Disease Control and Prevention (CDC) and other federal or jurisdictional public health agencies.
2. **Automated Data Collection:** Minimize manual intervention through real-time data collection.
3. **Increased Situational Awareness:** Provide a comprehensive view of healthcare capacity and trends, serving as a foundation for future data reporting needs. 

By addressing these goals, US SAFR supports healthcare facilities and public health authorities in reporting critical data efficiently, ensuring patient safety and informed decision-making 
during public health emergencies. 

### Background ###
The COVID-19 pandemic revealed significant gaps in the ability to monitor healthcare system stress and capacity. This project integrates and generalizes previous initiatives, 
including [SANER - Situational Awareness for Novel Epidemic Response IG (universal realm)](https://build.fhir.org/ig/HL7/fhir-saner/index.html) and 
[DEQM - Data Exchange for Quality Measure IG (US realm)]({{site.data.fhir.ver.deqm}}/index.html), into a unified framework tailored for the US. Key highlights include:

1. Standardized definitions of healthcare bed capacity and other metrics.
2. Compatibility with existing federal systems and regulatory requirements.
3. Development of at least one IG tailored for US-specific needs, leveraging United States Core Data for Interoperability (USCDI) and US terminology. The US SAFR IG builds upon lessons 
learned during the pandemic to create a reliable, automated, and standardized reporting framework for the future.


### Audience ###
This guide is intended for a broad range of interoperability partners, including:

- **Healthcare Organizations:** Hospitals, acute care centers, and other providers with public health reporting obligations.
- **Federal Agencies:** CDC, ASTP/ONC, CMS, ASPR, and other federal public health entities.
- **Provider HIT Vendors:** Developers of provider HIT such as EHRs, administrative, and logistics systems that are the source of US SAFR data.
- **Standards Development Organizations:** Stakeholders involved in advancing FHIR and other health data standards.
- **Public Health Authorities:** State, tribal, local, and territorial (STLTs) public health agencies seeking to improve situational awareness and emergency response.

### Design Considerations ###
The design of US SAFR emphasizes:

- **Interoperability:** Seamless data exchange between hospitals, jurisdictions, and federal systems via FHIR.
- **Scalability:** A framework capable of addressing both current and future situational awareness needs.
- **Data Uniformity:** Consistent definitions and structures to facilitate regional and national collaboration.
- **Automated Compliance:** Streamlined reporting aligned with federal regulations to reduce the administrative burden.

The guide ensures alignment with existing initiatives, such as SANER and DEQM, while addressing US-specific requirements and terminology.

### Relationship to Other Standards ###

The US SAFR IG harmonizes with and extends the following standards:

1. **[SANER (Universal Realm):](https://build.fhir.org/ig/HL7/fhir-saner/index.html)** Provides the foundation for situational awareness reporting globally. US SAFR adapts SANER for US-specific requirements while maintaining interoperability.
2. **[DEQM (US Realm):]({{site.data.fhir.ver.deqm}}/index.html)** Ensures alignment with existing US-specific quality measurement standards.
3. **[NHSN Bed Connectivity Initiative:](https://www.cdc.gov/nhsn/bed-capacity/index.html)** Standardizes real-time bed capacity reporting across hospitals and jurisdictions.
4. **[Hospital Respiratory Data Reporting:](https://www.cdc.gov/nhsn/psc/hospital-respiratory-reporting.html)** Establishes reporting standards for COVID-19, influenza, RSV, and related data.
5. **[NHSN dQM Reporting:](http://hl7.org/fhir/us/nhsn-dqm/ImplementationGuide/hl7.fhir.us.nhsn-dqm)** Defines the standard framework for reporting patient line-level clinical data using a digital Quality Measure (dQM). Whereas, US SAFR focuses on situational awareness reporting excluding protected health information.

By aligning with these standards, US SAFR supports a unified reporting framework for healthcare capacity and situational awareness data.

Other FHIR standard related dependencies:

{% include dependency-table.xhtml %}

### Out of Scope ###
Subscriptions is not covered in this IG currently, but future versions will plan to incorporate [FHIR Subscriptions R5 Backport](https://build.fhir.org/ig/HL7/fhir-subscription-backport-ig/) to support emergencies that require rapid changes in reporting.

### Acknowledgements ###

This implementation guide is a product of the [HL7 International–Public Health Work Group](http://www.hl7.org/Special/committees/pher/).

 




