

|---|---|
|*Official URL*: http://www.cdc.gov/nhsn/fhirportal/dqm/ig/ImplementationGuide/gov.cdc.nhsn.measures|*Version*: 2.0.0 - cibuild|
|*NPM package name*: gov.cdc.nhsn.measures|*ComputableName*: NHSNMeasures|
|*Copyright/Legal*: [License](license.html)|
{:.grid}

CDC National Healthcare Safety Network (NHSN) Digital Quality Measures (dQM)

- [JSON](ImplementationGuide-gov.cdc.nhsn.measures.json)

### Cross Version Analysis

{% capture cross-version-analysis %}{% include cross-version-analysis.xhtml %}{% endcapture %}{{ cross-version-analysis | remove: '<p>' | remove: '</p>'}}

### IG Dependencies

This IG Contains the following dependencies on other IGs.
<div class="dependency-table">
{% include dependency-table.xhtml %}
</div>
### Global Profiles

{% include globals-table.xhtml %}

### Copyrights

{% capture ip-statement %}{% include ip-statements.xhtml %}{% endcapture %}

{{ ip-statement | remove: '<p>' | remove: '</p>'}}

{% if site.data.ig.definition contains "parameter" %} 
### Parameter Settings

The following [IG Parameters](https://confluence.hl7.org/display/FHIR/Implementation+Guide+Parameters) are set for this Implementation Guide:

{% for p in site.data.ig.definition.parameter %}
- code: {{p.code}}<br/>value: {{p.value }}
{%- endfor -%}

{%- endif -%}
