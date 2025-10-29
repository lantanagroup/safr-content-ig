This section of the implementation guide (IG) defines the specific conformance requirements for systems wishing to conform to this US SAFR Reporting IG. The bulk of it focuses on evaluating facility data against measure criteria and submitting those data to MeasureReport Recipient (NHSN), though it also provides guidance on privacy, security, and other implementation requirements.

### Pre-reading

Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Actors](actors.html) and [Use Cases](usecases.html) pages provide context for the intent and general process flow of this formal specification, as well as details on the various actors involved.


### Conventions

This implementation guide (IG) uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but are not a recommendation for or against adoption.

#### Must Support ###

The following rules regarding Must Support  elements apply to all Profiles in this guide. The Must Support definitions are not inherited from other IGs, even for profiles in this guide derived from another guide.

Sender:

* If the data element is available in through the Data Source, the data element *SHALL* be provided (either through submission or response to a query) for measure calculation or risk adjustment.
* If the sender does not capture/store the data, the data are not available, or sharing of the data is not authorized, the system **SHOULD NOT** send the element if the element is not marked as mandatory (lower cardinality of 0).

Receiver: 

* The receiver **SHALL** be capable of processing resource instances containing must-support data elements without generating an error or causing the application to fail.
* The receiver **SHALL** be able to process resource instances containing must-support data elements asserting missing information (data absent reason extension).

#### Profiles

This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of measure report submissions.

The full set of profiles defined in this IG can be found by following the links on the [Artifacts](artifacts.html) page.

#### Reporting Scenarios

The following reporting scenarios use the Actors defined on the [Actors](actors.html) and [Use Cases](usecases.html) pages.

#### Push to MeasureReport Recipient (NHSN)

In this scenario both the Data Source and Digital Quality Measure Evaluation Engine reside at the reporting facility, and may be the same system (e.g., an EHR that performs it’s own internal measure evaluation). The Measure Evaluation Engine first retrieves the latest FHIR measures and related resources from the measure repository and extracts the data requirements for each measure. The Measure Evaluation Engine queries the Data Source for data that it will evaluate against a measure and prepares Bundle containing MeasureReport and supporting resources, then sends it to the MeasureReport Recipient (NHSN). 

In this scenario the Measure Evaluation Engine SHALL perform a FHIR POST or PUT to push the MeasureReport Bundle to the MeasureReport Recipient (NHSN).
<figure>
  {% include usfr-push-1.svg %}
  <figcaption></figcaption>
</figure>

1. **Retrieve Measure Bundle:** The Measure Evaluation Engine uses an HTTP GET against the measure repository for an [USSafrMeasureBundle](StructureDefinition-us-safr-measure-bundle.html) containing a [CQFMContinuousVariableMeasure]({{site.data.fhir.ver.cqfm}}/StructureDefinition-cv-measure-cqfm.html) <!--[CRMIShareableMeasure]({{site.data.fhir.ver.crmi}}/StructureDefinition-crmi-shareablemeasure.html)--> and related resources. The exact Bundle(s) to retrieve is determined out of band by the facility and MeasureReport Recipient (NHSN) during onboarding and subsequent discussions. After retrieving the Bundle, the Measure evaluation engine parses the contents to determine which resources are needed from the Data Source, then proceeds to step 2.

2. **Query Data Sources:** The Measure Evaluation Engine queries the Data Source to retrieve and evaluate the data defined in the measure. It is acceptable for an EHR to query it's own internal data store using non-FHIR methods or import data from other systems that are not FHIR-enabled.

3. **Submit MeasureReport Bundle** The Measure Evaluation Engine uses an HTTP POST to submit the [SafrMeasureReportBundle](StructureDefinition-us-safr-measurereport-bundle.html) to the MeasureReport Recipient. The MeasureReport Recipient validates the Bundle and proceeds to load the data into other MeasureReport Recipient (NHSN) systems (details of such systems are out of scope for this IG).

4. **Forward to MeasureReport Recipient (NHSN) Systems:** The MeasureReport Recipient (NHSN) forwards the validated MeasureReport Bundle content to other back-end MeasureReport Recipient (NHSN) systems (details of such systems are out of scope for this IG).



#### Pull Direct from Healthcare Facility 
In this scenario, both the Digital Quality Measure Evaluation Engine and the MeasureReport Recipient reside within an Public Health Agency (NHSN) controlled environment, and may be the same system. The Measure Evaluation Engine first retrieves the latest FHIR measures and related resources from the measure repository and extracts the data requirements for each measure. The Measure Evaluation Engine queries the Data Source for data that it will evaluate against a measure and prepares Bundle containing MeasureReport and supporting resources.
In this scenario the Data Source SHALL have a FHIR API that at a minimum provides read access to all US Core profiles. Some measures may require additional FHIR resources beyond US Core, such as MedicationAdministration.

<figure>
  {%include usfr-1.svg %}
  <figcaption></figcaption>
</figure>

1. **Retrieve Measure Bundle:** The Measure Evaluation Engine uses an HTTP GET against the measure repository for an [USSafrMeasureBundle](StructureDefinition-us-safr-measure-bundle.html) containing a [CQFMContinuousVariableMeasure]({{site.data.fhir.ver.cqfm}}/StructureDefinition-cv-measure-cqfm.html)<!--[CRMIShareableMeasure]({{site.data.fhir.ver.crmi}}/StructureDefinition-crmi-shareablemeasure.html)--> and related resources. The exact Bundle(s) to retrieve is determined out of band by the facility and MeasureReport Recipient (NHSN) during onboarding and subsequent discussions. After retrieving the Bundle, the Measure evaluation engine parses the contents to determine which resources are needed from the Data Source, then proceeds to step 2.

2. **Query Data Sources:** The MeasureReport Recipient (NHSN) queries the Data Source to retrieve and evaluate the data defined in the measure.

3. **Submit MeasureReport Bundle** The Measure Evaluation Engine uses an HTTP POST to submit the [SafrMeasureReportBundle](StructureDefinition-us-safr-measurereport-bundle.html) to the MeasureReport Recipient. The MeasureReport Recipient (NHSN) validates the Bundle and proceeds to load the data into other backend systems (details of such systems are out of scope for this IG).


#### Aggregate at States and Push to MeasureReport Recipient (NHSN)
In this scenario, a state/jurisdiction retrieves the measure bundle from NHSN and queries for data for aggregation from one or more healthcare facility before evaluating and submitting the MeasureReport to the Measure Recipient on behalf of the facilities.

In this scenario the state/jurisdiction SHALL have a FHIR API that at a minimum provides read access to all US Core profiles. Some measures may require additional FHIR resources beyond US Core, such as MedicationAdministration.

<figure>
  {% include usfr-2.svg %}
  <figcaption></figcaption>
</figure>

1. **Retrieve Measure Bundle:** The state/jurisdiction Measure Evaluation Engine uses an HTTP GET to retrieve the [USSafrMeasureBundle](StructureDefinition-us-safr-measure-bundle.html) containing a [CQFMContinuousVariableMeasure]({{site.data.fhir.ver.cqfm}}/StructureDefinition-cv-measure-cqfm.html)<!--[CRMIShareableMeasure]({{site.data.fhir.ver.crmi}}/StructureDefinition-crmi-shareablemeasure.html)--> and related resources from the measure repository. The exact Bundle(s) to retrieve is determined out of band by the facility and MeasureReport Recipient (NHSN) during onboarding and subsequent discussions. After retrieving the Bundle, the Measure evaluation engine parses the contents to determine which resources are needed from the Data Source, then proceeds to step 2.

2. **Query Healthcare Facility:** The state/jurisdiction query each healthcare facility EHR for data aggregation via FHIR API. 

3. **Submit MeasureReport to MeasureReport Recipient** The Measure Evaluation Engine uses an HTTP POST to submit the [SafrMeasureReportBundle](StructureDefinition-us-safr-measurereport-bundle.html) to the MeasureReport Recipient (NHSN). The MeasureReport Recipient (NHSN) validates the Bundle and proceeds to load the data into other backend systems (details of such systems are out of scope for this IG).