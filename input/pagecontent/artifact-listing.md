This page provides an organized list of the primary FHIR artifacts defined as part of this implementation guide.
test

<!-- Taken from xslt - If there is a description in the group, then show the descriptions table column. Not sure if this is needed
<xsl:variable name="showDescriptions" select="count(parent::f:definition/f:resource[f:groupingId/@value=current()/@id]/f:description/@value)!=0"/> -->

{% for group in site.data.artifact-grouping.groups %}
<h3>{{group[1].name}}</h3>
<p>{{group[1].description | markdownify}}</p>
<table class="grid">
  <col style="width:20%"/>
  <tbody>
    <tr>
      <th>Title</th>
      <th>Description</th>
    </tr>
    {% for resource in group[1].resources -%}
    {% assign artifact_name = site.data.resources[resource].title %}
    {% if artifact_name == null or artifact_name == '' %}
      {% assign artifact_name = resource.name %}
    {% endif %}
    {% assign artifact_description = site.data.resources[resource].description %}
    {% if artifact_description == null or artifact_description == '' %}
      {% assign artifact_description = resource.description %}
    {% endif %}
    <!-- Get the resource information -->
    <tr>
      <td style="column-width:30%">
        <a href="{{site.data.resources[resource].path}}">{{artifact_name}}</a>
      </td>
      <!-- 
      <xsl:if test="$showDescriptions">-->
        <td>
          {{artifact_description | markdownify}}
          <!-- may need to pull descriptions of non-sd artifacts from the IG resource, but where can I get that? -->
        </td>
    </tr>
    {%endfor%}
  </tbody>
</table>
{% endfor %}
<!--
<h2>All</h2>
{% for hash in site.data %}
  {{hash[0]}}
{% endfor %}
<h2>Info</h2>
{% for hash_info in site.data.info %}
  {{hash_info[0]}}
{% endfor %}
<h2>Artifacts</h2>
{% for hash_art in site.data.artifacts %}
  {{hash_art[0]}}
{% endfor %}
<h2>Canonicals</h2>
{% for hash_can in site.data.canonicals %}
  {{hash_can[0]}}
{% endfor %}
<h2>Questionnaires</h2>
{% for hash_qs in site.data.questionnaires %}
  {{hash_qs[0]}}
{% endfor %}
<h2>Resources</h2>
{% for hash_rs in site.data.resources %}
  {{hash_rs[0]}}
{% endfor %}
-->


<!--
{%- for sd_hash in site.data.artifact-grouping -%}
  {%- assign sd1= sd_hash[1] -%}
  {%- unless sd1.type == "Extension" -%}
    {% assign types =  types | append: "," | append: sd1.type %}
  {%- endunless -%}
{% endfor %}
{% assign my_types = types | split: "," %}
{% assign my_types = my_types | sort | uniq %}
{% for i in my_types offset:1 %}
  <h4>{{ i }}</h4>
  <ul>
    {%- for sd_hash in site.data.structuredefinitions -%}
      {%- assign sd1 = sd_hash[1] -%}
      {%- if sd1.type == i %}
        {%- assign new = false -%}
        {%- assign parent = false -%}
        {%- assign child = false -%}
        {%- for sd_hash2 in site.data.structuredefinitions -%}
          {%- assign sd2 = sd_hash2[1] -%}
          {% if sd1.basename == sd2.name %}
            {%- assign child = true -%}
            {% break %}
          {% elsif sd1.name == sd2.basename%}
             {%- assign parent = true -%}
             {% break %}
          {% endif %}
        {% endfor %}


        {%- for new_stuff in site.data.new_stuff -%}
           {%- if new_stuff == sd1.name -%}
             {%- assign new = true -%}
             {%- break -%}
           {%- endif -%}
        {%- endfor -%}

          {%- unless parent or child -%}
            {%- if new -%}
              <li><a href="{{sd1.path}}"><span class="bg-success" markdown="1">{{sd1.title}}</span><!-- new-content --></a></li>
            {% else %}
              <li><a href="{{sd1.path}}">{{sd1.title}}</a></li>
            {% endif %}
          {%- endunless -%}

          {%- if parent -%}
            {%- if new -%}
              <li><a href="{{sd1.path}}"><span class="bg-success" markdown="1">{{sd1.title}}</span><!-- new-content --></a>
            {% else %}
              <li><a href="{{sd1.path}}">{{sd1.title}}</a>
            {% endif %}
                <ul>
                {%- for sd_hash3 in site.data.structuredefinitions -%}
                  {%- assign sd3 = sd_hash3[1] -%}
                  {% if sd1.name == sd3.basename %}
                    {%- assign new = false -%}
                    {% for new_stuff in site.data.new_stuff %}
                         {%- if new_stuff == sd3.name -%}
                           {%- assign new = true -%}
                           {%- break -%}
                         {%- endif -%}
                    {%- endfor -%}


                      {%- if new -%}
                        <li><a href="{{sd3.path}}"><span class="bg-success" markdown="1">{{sd3.title}}</span><!-- new-content --></a></li>
                      {% else %}
                        <li><a href="{{sd3.path}}">{{sd3.title}}</a></li>
                      {% endif %}

                  {% endif %}
                {% endfor %}
                </ul>
            </li>
          {%- endif -%}
      {%- endif -%}
    {%- endfor -%}
  </ul>
{% endfor %}
-->