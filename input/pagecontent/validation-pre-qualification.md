All submission data must pass pre-qualification prior to submission to the National Healthcare Safety Network (NHSN), regardless of the mechanism/tools used for evaluation and submission. Pre-qualification involves categorizing Fast Healthcare Interoperability Resources (FHIR) validation issues (errors, warnings and informational) for a given submission dataset to NHSN. Categories are defined to match one or multiple types of validation issues. One key component of every category is the required “acceptability” flag (field). Every category must be defined according to NHSN as either acceptable or unacceptable.  

### <b>Example of an <i>Acceptable</i> validation issue</b>: Code does not match the preferred ValueSet  

The informational validation message, “none of the codings are in the value set, and a coding is recommended to come from this value set,” results when any coding outside of any value set with a preferred binding strength is found in any resource. For instance, the Acute Care Hospital (ACH) Monthly Event Encounter profile binds Encounter.hospitalization.dischargeDisposition to the [DischargeDisposition](http://hl7.org/fhir/R4/valueset-encounter-discharge-disposition.html) ValueSet with a [preferred](http://hl7.org/fhir/R4/terminologies.html#preferred) binding strength. In cases where a code that is not in this value set is found, FHIR validation will produce an informational message, “none of the codings are in the value set DischargeDispotition, and a coding is recommended to come from this value set.” Similarly, an instance of ACH Monthly Condition with Condition.severity containing a code representing “low,” FHIR validation will produce the message, “none of the codings are in the value set DiagnosisSeverity, and a coding is recommended to come from this value set.”  

NHSN has determined that all codes outside of value sets bound with a preferred binding strength are acceptable for submission. Therefore, both instances/messages would be categorized under “none of the codings are in the value set, and a coding is recommended to come from this value set” with an acceptable=true flag and would not result in the hindrance of submitting this scenario’s data set to NHSN.  

### <b>Example of an <i>Unacceptable</i> validation issue</b>: Minimum requirement not met for profile

The validation error message, “minimum required = 1, but only found 0 (from ‘profile’)”, results when any required element is missing from any resource. For instance, the [ACH Monthly Encounter](StructureDefinition-ach-monthly-encounter.html) profile requires .period to follow every .location, e.g., Encounter.location.period. When .period is absent, the validation message "minimum required = 1, but only found 0” results. Similarly, [ACH Monthly Coverage](StructureDefinition-ach-monthly-coverage.html) requires .type, e.g.,  Coverage.class.type. When .type is missing, the validation message "minimum required = 1, but only found 0” results. 

NHSN has determined that resources missing required elements, as in the Encounter.location.period and Coverage.class.type examples, are unacceptable issues and therefore would result in a failed submission of this dataset to NHSN.  

<b>Note:</b> If one or more unacceptable categories exist within a potential data submission set, the entire dataset will not be submitted.  

### <b>When Pre-qualification Happens During Submission to NHSN</b> 

Validation and subsequent pre-qualification occur after data evaluation and before final submission to NHSN. Implementers acting as data submitters to NHSN perform and attest to pre-qualification for each dataset submitted to NHSN. An implementer system representing a new data source targeting NHSN submission in conformance with this guide should expect extensive and iterative pre-qualification-driven testing to identify acceptable and unacceptable data quality issues. To ensure a successful NHSN submission, it is crucial to address the unacceptable issues with the guidance provided for resolution. These issues may be addressed and resolved through various potential mechanisms, such as technical (i.e., configuration) updates at the data source (EHR), modifications to clinical workflows, data querying, and/or data normalization.  

<div>
<figure class="figure">
    <figcaption class="figure-caption"><strong>Figure 1: Process Flow for Pre-qualification </strong></figcaption>
    <img src="SubmissionDiagram.PNG" alt="Figure 1: Process Flow for Pre-qualification" title="Figure 1: Process Flow for Pre-qualification" class="img-responsive img-rounded center-block" width="75%">
</figure>
<p></p>
</div>
<p>
  Figure 1, above, the process flow for pre-qualification. This process includes:
  <ol>
    <li>Primary dQM data is retrieve from the EHR Data Source through a secure FHIR API using the Patients of Interest List and the dQM definitions that the facility is enrolled in.</li>
    <li>This data goes through an initial evaluation within involves data normalization and determination of what data is reportable.
      <ul>
        <li>Data this is determines as reportable, will continue through the process.</li>
        <li>Data that is not reportable is discarded and does not continue further in the process.</li>
      </ul>
    </li>
    <li>The data this is reportable is augmented with related supplemental data retrieve from the same EHR Data Source API.</li>
    <li>The submission dataset is subject to an initial validation and bundled up into a MeasureReport bundle.</li>
    <li>A pre-qualification process is run on the submission dataset which identifies potential issues (errors, warnings and informational) which are categorized.</li>
    <li>A key component of every category is “acceptability”, which is used to determine if the type of issue is considered acceptable for submission to the NHSN Application.
      <ul>
        <li>If a submission has not issues or only "acceptable" issues the submission is successful and sent to the NHSN Appliaction.</li>
        <li>If one or more unacceptable categories exist within a submission dataset, the entire dataset will not be sent to the NHSN Application and a review and remediation process can take place.</li>
      </ul>
    </li>
  </ol>
</p>
Pre-qualification categorization is technology agnostic; the frameworks and programming languages used to implement above do not matter. This allows the evaluation and submission of data to NHSN through multiple systems and pathways, provided pre-qualification results are acceptable. Similarly, the technology used to implement pre-qualification categorization to determine and assert only acceptable issues exist within a given submission dataset is not mandated.  

