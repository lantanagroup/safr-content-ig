"""
This module provides configuration and setup helpers for the publisher CLI. This includes functions to load configuration from the IG repository, initialize the output folder with necessary files and templates, and define constants and templates used throughout the publication process. The `load_configuration()` function reads the `publication-request.json` and `sushi-config.yaml` files from the IG repository to construct a configuration dictionary that is used in subsequent steps. The `initialize_webroot()` function sets up the `webroot` folder with necessary JSON files for the publisher, while the `initialize_templates()` function sets up the `templates` folder with any custom templates from the IG repository as well as default header, postamble, and preamble templates. Constants such as URLs for downloading the publisher and tooling JARs, file patterns for post-processing, and template strings for generating configuration files are also defined in this module for easy maintenance and reuse across the publication process.
"""

import json
import yaml
import configparser
from pathlib import Path
import shutil
import logging
import requests

# Constants and templates moved from original script
IG_PUBLISHER_URL = "https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
#CQF_TOOLING_REPO = "https://oss.sonatype.org/service/local/repositories/releases/content/org/opencds/cqf/tooling-cli"
CQF_TOOLING_REPO = "https://repo1.maven.org/maven2/org/opencds/cqf/tooling-cli"
CQF_TOOLING_MANIFEST = "https://repo1.maven.org/maven2/org/opencds/cqf/tooling-cli/maven-metadata.xml"
#CQF_TOOLING_URL = "https://oss.sonatype.org/service/local/repositories/releases/content/org/opencds/cqf/tooling-cli/3.6.0/tooling-cli-3.6.0.jar"
#CQL_TOOLING_URL = "https://repo1.maven.org/maven2/org/opencds/cqf/tooling-cli/3.6.0/tooling-cli-3.6.0.jar"
DEFAULT_CQF_VERSION = "3.6.0"
CQF_TOOLING_JAR = "tooling-cli.jar"
CQF_TOOLING_JAR_PREFIX = "tooling-cli-"

pub_repos = {'ig-history': 'https://github.com/HL7/fhir-ig-history-template.git', 'ig-registry': 'https://github.com/FHIR/ig-registry.git'}

# This is used to retrieve the package lists to build out the publication-feed.json and package-feed.json files
ig_suite_package_list = {'gov.cdc.nhsn': 'https://github.com/lantanagroup/nhsn-measures/refs/heads/development/package.json', 'gov.cdc.nhsn.safr-content-ig': 'https://raw.githubusercontent.com/lantanagroup/safr-content-ig/refs/heads/development/package.json'}

reduce_file_patterns = ['**/*.ttl*', '**/*.r4b.tgz', '**/*.db', '**/qa-tx.html', '**/*.json1', '**/*.json2', '**/*.xml1', '**/*.xml2', '**/excels.zip']

accessibility_update_file_patterns = ['**/qa*.html', '**/StructureDefinition-*.html', '**/StructureDefinition-*.xml']
accessibility_old_string = ['<span style="opacity: 0.5">', '<span style=\\"opacity: 0.5\\">', '&lt;span style=\\&quot;opacity: 0.5\\&quot;&gt;', '<a style="opacity: 0.5; opacity: 0.5', '<a style=\\"opacity: 0.5; opacity: 0.5', '&lt;a style=\\&quot;opacity: 0.5; opacity: 0.5', 'background-color: red', 'background-color: green']
accessibility_new_string = ['<span style="opacity: 0.87; font-style: italic;">', '<span style=\\"opacity: 0.87; font-style: italic;\\">', '&lt;span style=\\&quot;opacity: 0.87; font-style: italic;\\&quot;&gt;', '<a style="opacity: 0.87; opacity: 0.87; font-style: italic;', '<a style=\\"opacity: 0.5; opacity: 0.5', '&lt;a style=\\&quot;opacity: 0.87; opacity: 0.87; font-style: italic', 'background-color: #B60000', 'background-color: #006600']

default_config = {  'server-type': 'asp-new', 
                    'package-id-pattern': 'gov.cdc.nhsn.*', 
                    'ig_suite_url': 'http://www.cdc.gov/nhsn/fhirportal', 
                    'ig_suite_title': 'The CDC NHSN Public Health Reporting FHIR Implementation Guides', 
                    'ig_suite_description': 'This IG suite contains FHIR implementation guides developed by the CDC National Healthcare Safety Network (NHSN) to support public health reporting.',
                    'package_suite_title': 'The CDC NHSN Public Health Reporting FHIR IG Packages', 
                    'package_suite_description': 'This suite contains FHIR packages developed by the Centers for Disease Control and Prevention (CDC) National Healthcare Safety Network (NHSN) to support public health reporting.',
                    'publish-path': '/ig'}

canonical_patterns = ['ImplementationGuide-', 'StructureDefinition-', 'CodeSystem', 'ValueSet', 'SearchParameter', 'OperationDefinition', 'Library', 'Measure', 'ActivityDefinition', 'DeviceDefinition', 'EventDefinition', 'ObservationDefinition', 'PlanDefinition', 'Questionnaire', 'SpecimenDefinition']


package_registry_template = '''{
  "packages" : [
    {
      "path" : "fhir/package-list.json",
      "package-id" : "{package-id}",
      "title" : "{desc}",
      "canonical" : "{canonical}",
      "category" : "{category}",
      "ci-build" : "{ci-build}"
    }
  ]
}'''

# Base template for publish-setup.json, contains information that is relevant for the IG publisher, so it knows how that publication is laid out and what web server is in use. 
#Documentation: https://confluence.hl7.org/spaces/FHIR/pages/81027536/Maintaining+a+FHIR+IG+Publication#MaintainingaFHIRIGPublication-Documentationforpublish-setup.json
publish_setup_template = '''
{
    "website": {
        "style": "fhir.layout",
        "url": "{ig_suite_url}",
        "server": "{server-type}",
        "org": "{publisher.name}",
        "index-template": "index.template",
        "clone-xml-json": true
    },
    "feeds": {
      "package": "package-feed.xml",
      "publication": "publication-feed.xml"
    },
    "layout-rules": [
        {
            "npm": "{package-id-pattern}",
            "canonical": "{ig_suite_url}/{4}/ig",
            "destination": "/{4}/ig"
        }
    ]
}'''

package_feed_template = '''<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fhir="http://hl7.org/fhir/feed" version="2.0">
    <channel>
        <title>{package_suite_title}</title>
        <description>{package_suite_description}</description>
        <link>{ig_suite_url}</link>
        <generator>HL7, Inc FHIR Publication tooling - Lantana Consulting Group Variant</generator>
        <lastBuildDate></lastBuildDate>
        <atom:link href="{ig_suite_url}/package-feed.xml" rel="self" type="application/rss+xml"/>
        <pubDate></pubDate>
        <language>en</language>
        <ttl>600</ttl>
        <item></item>
    </channel>
</rss>'''

publication_feed_template = '''<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fhir="http://hl7.org/fhir/feed" version="2.0">
    <channel>
        <title>{ig_suite_title}</title>
        <description>{ig_suite_description}</description>
        <link>{ig_suite_url}</link>
        <generator>HL7, Inc FHIR Publication tooling - Lantana Consulting Group Variant</generator>
        <lastBuildDate></lastBuildDate>
        <atom:link href="{ig_suite_url}/publication-feed.xml" rel="self" type="application/rss+xml"/>
        <pubDate></pubDate>
        <language>en</language>
        <ttl>600</ttl>
        <item></item>
    </channel>
</rss>'''

header_template = '''  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets-hist/ico/apple-touch-icon-144-precomposed.png"/>
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets-hist/ico/apple-touch-icon-114-precomposed.png"/>
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets-hist/ico/apple-touch-icon-72-precomposed.png"/>
  <link rel="apple-touch-icon-precomposed" href="assets-hist/ico/apple-touch-icon-57-precomposed.png"/>
  <link rel="shortcut icon" href="assets-hist/ico/favicon.png"/>
  '''

postamble_template = '''  <!-- ==============END CONTENT END CONTENT=================== -->

<p></p>
 </div>

    </div>  <!-- /inner-wrapper -->
            </div>  <!-- /row -->
        </div>  <!-- /container -->

    </div>  <!-- /segment-content -->

    </div>  <!-- /inner-wrapper -->
            </div>  <!-- /row -->
        </div>  <!-- /container -->

    </div>  <!-- /segment-content -->

<div id="segment-footer" class="segment">  <!-- segment-footer -->
  <div class="container">  <!-- container -->
   <div class="inner-wrapper">
    <p>
      <span id="ig-footer">TBD </span> &reg;&copy; <a style="color: #81BEF7" href="http://hl7.org/fhir">FHIR</a> |
                <a style="color: #81BEF7" rel="license" href="http://hl7.org/fhir/license.html"><img style="border-style: none;" alt="CC0" src="cc0.png"/></a>
        </p>
   </div>  <!-- /inner-wrapper -->
  </div>  <!-- /container -->
 </div>  <!-- /segment-footer -->
  <!-- disqus thread -->
 <div id="segment-post-footer" class="segment hidden">  <!-- segment-post-footer -->
  <div class="container">  <!-- container -->
  </div>  <!-- /container -->
 </div>  <!-- /segment-post-footer -->
'''

preamble_template = '''<body>
 <div id="segment-header" class="segment">  <!-- segment-header -->
  <div class="container">  <!-- container -->
   <a id="logo" no-external="true" href="http://hl7.org/fhir"><img src="assets/images/fhir-logo-www.png" alt="logo fhir"></a>
<div>
<a id="hl7-logo" no-external="true" href="http://www.hl7.org">
     <img alt="visit the hl7 website" width="42" height="50" src="assets/images/hl7-logo.png"/>
    </a>
   </div>
   <div id="ig-status" style="font-size:24px;padding-top: 20px;">
<b id="ig-title">AU Core</b>
</div>
 </div>
  <div class="container">  <!-- container -->
 </div></div>  <!-- /segment-header -->

 <div id="segment-navbar" class="segment">  <!-- segment-navbar -->
  <div id="stripe"> </div>
  <div class="container">  <!-- container -->
   <!-- HEADER CONTENT -->

   <nav class="navbar navbar-inverse">
    <div class="container">
     <button data-target=".navbar-inverse-collapse" class="navbar-toggle" data-toggle="collapse" type="button">
      <span class="icon-bar"> </span>
      <span class="icon-bar"> </span>
      <span class="icon-bar"> </span>
     </button>
     <a class="navbar-brand hidden" href="http://hl7.org/fhir/index.html">FHIR</a>
     <div class="nav-collapse collapse navbar-inverse-collapse">
      <ul class="nav navbar-nav">
              <li><a href="history.html">History</a></li>
            </ul>

     </div>  <!-- /.nav-collapse -->
    </div>  <!-- /.container -->
   </nav>  <!-- /.navbar -->

  <!-- /HEADER CONTENT -->
  </div>  <!-- /container -->
 </div>  <!-- /segment-navbar -->

  <!-- ============BreadCrumb=============== -->
  </div>  <!-- /container -->
 </div>  <!-- /segment-breadcrumb -->

 <div id="segment-content" class="segment">  <!-- segment-content -->
 <div class="container">  <!-- container -->
            <div class="row">
             <div class="inner-wrapper">
'''

web_config = r'''<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <system.webServer>
        <rewrite>
            <rules>
                <rule name="All-Segments-html">
                    <match url="^(ActivityDefinition|ActorDefinition|CapabilityStatement|ChargeItemDefinition|Citation|CodeSystem|CompartmentDefinition|ConceptMap|ConditionDefinition|DeviceDefinition|EventDefinition|Evidence|EvidenceVariable|ExampleScenario|GraphDefinition|ImplementationGuide|Library|Measure|MessageDefinition|NamingSystem|ObservationDefinition|OperationDefinition|PlanDefinition|Questionnaire|Requirements|SearchParameter|SpecimenDefinition|StructureDefinition|StructureMap|SubscriptionTopic|TerminologyCapabilities|TestPlan|TestScript|ValueSet)\/([A-Za-z0-9\-\.]{1,64})" />
                    <action type="Redirect" url="{R:1}-{R:2}.html"  redirectType="Found" />
                </rule>
            </rules>
        </rewrite>
    </system.webServer>
</configuration>'''


def load_configuration(ig_repo_path):
    """
    Load configuration data from the IG repository.
    This function reads the `publication-request.json` file from the IG repository to load the initial configuration data. It then reads the `sushi-config.yaml` file to extract additional information such as the canonical URL and publisher name, which are added to the configuration data. Finally, it ensures that any default configuration values are included in the resulting configuration dictionary. This configuration data is used throughout the publication process to customize templates and control build behavior based on the specific IG being published.
    Args:        ig_repo_path: Path to the cloned IG repository from which to load configuration data.
    Returns:     A dictionary containing the loaded configuration data, including values from both `publication-request.json` and `sushi-config.yaml`, as well as any default values for missing keys.
    """
    with open(str(ig_repo_path) + '/publication-request.json', 'r') as file:
        config_data = json.load(file)

    config_data['ig_repo_path'] = ig_repo_path

    with open(ig_repo_path + '/sushi-config.yaml', 'r') as file:
        sushi_config = yaml.safe_load(file)
        config_data['canonical'] = sushi_config['canonical']
        config_data['publisher.name'] = sushi_config['publisher']['name']
        #config_data['canonical-end'] = '/' + sushi_config['canonical'].rsplit('/', 1)[1] # being replaced due to supporting multiple IGs

    # Add 

    for key in default_config:
        if key not in config_data:
            config_data[key] = default_config[key]


    # Get publish path from publish_setup.json (using layout-rules.destination and package id) if it exists, otherwise default to 'webroot/ig'
    publish_path = default_config['publish-path']
    publish_setup_path = Path("webroot/publish-setup.json")
    if publish_setup_path.exists():
        with open(publish_setup_path, 'r') as file:
            publish_setup = json.load(file)
            if 'layout-rules' in publish_setup and 'destination' in publish_setup['layout-rules'][0]:
                publish_path = publish_setup['layout-rules'][0]['destination']
                # TODO Replace placeholders in the publish path with actual values from the config data (e.g. {4} with the appropriate value from the package id or canonical url)
                publish_path = publish_setup['layout-rules'][0]['destination'].format('',*config_data['package-id'].split('.'))

    config_data['publish-path'] = publish_path


    return config_data


def initialize_webroot(config_data, ig_repo_path):
    """
    Initialize the webroot folder with necessary JSON files for the publisher. This function creates the `webroot` directory if it does not exist, then generates the `package-registry.json`, `publish-setup.json`, `package-feed.xml`, and `publication-feed.xml` files in the `webroot` directory based on the provided configuration data and corresponding templates. The configuration data is used to replace placeholders in the templates to customize the generated files for the specific IG being published. This setup is necessary to ensure that the publisher has the required configuration files in place for both the initial and full build processes.
    Args:        config_data: A dictionary containing configuration values loaded from the IG repository (by the `load_configuration` function), which are used to populate the templates for the JSON and XML files generated in the webroot.
    """

    # TODO Need to address package-list updates. Update to include the latest publication version (need to first check if the package already exists and update it if so, otherwise add a new entry for the new package version) and ensure that the package registry is updated to point to the correct package list file for the latest version. This will likely involve updating the package-list.json file with the new version information and ensuring that the webroot/package-registry.json file is updated accordingly to reflect the changes in the package list. This may need to be done in a different function that has access to the version (in the publication request or sushi-config.yaml)

    logger = logging.getLogger()
    directory_path = Path("webroot")
    try:
        directory_path.mkdir(exist_ok=True)
        logger.debug(f"Directory '{directory_path}' created or already exists.")
    except PermissionError:
        logger.error(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        logger.error(f"An error occurred: {e}")

    package_registry = package_registry_template
    for key in config_data:
       package_registry = package_registry.replace("{"+key+"}", str(config_data[key]))

    with open("webroot/package-registry.json", "w") as template_file:
        template_file.write(package_registry)

    publish_setup = publish_setup_template
    for key in config_data:
       publish_setup = publish_setup.replace("{"+key+"}", str(config_data[key]))

    with open("webroot/publish-setup.json", "w") as template_file:
        template_file.write(publish_setup)

    # TODO, need to verify this works once the file is published on the 
    # If the package-feed.xml does not exist then initialize
    if not Path("webroot/package-feed.xml").exists():
        package_feed_url = default_config['ig_suite_url'] + '/package-feed.xml'
        # Attempt to retrieve the package-feed.xml and publication-feed.xml files from the ig suite base URL, and if they do not exist, then see if they are in the repository; and if not, then use the default templates defined in this script. 
        response = requests.get(package_feed_url)
        if response.status_code == 200:
            # Write the retrieved package-feed.xml content to the webroot
            try:
                with open("webroot/package-feed.xml", "w") as template_file:
                    template_file.write(response.text) 
                    logger.info(f"Successfully retrieved package-feed.xml from {package_feed_url} and wrote to webroot.")
            except Exception as e:
                logger.error(f"Failed to write retrieved package-feed.xml to webroot: {e}")

        else:
            logger.warning(f"Failed to retrieve package-feed.xml from {package_feed_url}: HTTP {response.status_code}")
            # Since the package-feed.xml is not available at the ig suite base URL, check if it is available in the repository
            if ig_repo_path.joinpath('package-feed.xml').exists():
                try:
                    # Copy the package-feed.xml from the IG repository to the webroot
                    shutil.copy(ig_repo_path.joinpath('package-feed.xml'), "webroot/package-feed.xml")
                    logger.info(f"Successfully copied package-feed.xml from IG repository to webroot.")

                    # if base_web_config = Path('./webroot/ig/web.config').resolve()
                    # with open(str(ig_repo_path) + '/package-feed.xml', 'r') as file:
                    #     package_feed_content = file.read()
                    #     with open("webroot/package-feed.xml", "w") as template_file:
                    #         template_file.write(package_feed_content)
                    #         logger.info(f"Successfully retrieved package-feed.xml from IG repository and wrote to webroot.")
                except Exception as e:
                    logger.warning(f"Failed to write package-feed.xml from IG repository to webroot: {e}")

        # If the package-feed.xml does not exist (was not available at the ig suite base URL and was not in the IG repository), then use the default template to create a package-feed.xml file in the webroot with the appropriate values filled in from the configuration data. The same process is applied for the publication-feed.xml file, where it first attempts to retrieve it from the ig suite base URL, then checks the IG repository, and if it is not found in either location, it uses the default template to create the publication-feed.xml file in the webroot with values filled in from the configuration data.
        if not Path("webroot/package-feed.xml").exists():
            logger.warning("package-feed.xml not found at IG suite base URL or in IG repository. Using default template to create package-feed.xml in webroot.")
            package_feed = package_feed_template
            for key in config_data:
                package_feed = package_feed.replace("{"+key+"}", str(config_data[key]))

            with open("webroot/package-feed.xml", "w") as template_file:
                template_file.write(package_feed)


    # TODO, need to verify this works once the file is published on the 
    # If the publication-feed.xml does not exist then initialize
    if not Path("webroot/publication-feed.xml").exists():
        publication_feed_url = default_config['ig_suite_url'] + '/publication-feed.xml'
        # Attempt to retrieve the package-feed.xml and publication-feed.xml files from the ig suite base URL, and if they do not exist, then see if they are in the repository; and if not, then use the default templates defined in this script. 
        response = requests.get(publication_feed_url)
        if response.status_code == 200:
            # Write the retrieved publication-feed.xml content to the webroot
            try:
                with open("webroot/publication-feed.xml", "w") as template_file:
                    template_file.write(response.text) 
                    logger.info(f"Successfully retrieved publication-feed.xml from {publication_feed_url} and wrote to webroot.")
            except Exception as e:
                logger.warning(f"Failed to write retrieved publication-feed.xml to webroot: {e}")

        else:
            logger.warning(f"Failed to retrieve publication-feed.xml from {publication_feed_url}: HTTP {response.status_code}")
            # Since the publication-feed.xml is not available at the ig suite base URL, check if it is available in the repository
            if ig_repo_path.joinpath('publication-feed.xml').exists():
                try:
                    # Copy the publication-feed.xml from the IG repository to the webroot
                    shutil.copy(ig_repo_path.joinpath('publication-feed.xml'), "webroot/publication-feed.xml")
                    logger.info(f"Successfully copied publication-feed.xml from IG repository to webroot.")

                    # if base_web_config = Path('./webroot/ig/web.config').resolve()
                    # with open(str(ig_repo_path) + '/package-feed.xml', 'r') as file:
                    #     package_feed_content = file.read()
                    #     with open("webroot/package-feed.xml", "w") as template_file:
                    #         template_file.write(package_feed_content)
                    #         logger.info(f"Successfully retrieved package-feed.xml from IG repository and wrote to webroot.")
                except Exception as e:
                    logger.warning(f"Failed to write publication-feed.xml from IG repository to webroot: {e}")

        # If the package-feed.xml does not exist (was not available at the ig suite base URL and was not in the IG repository), then use the default template to create a package-feed.xml file in the webroot with the appropriate values filled in from the configuration data. The same process is applied for the publication-feed.xml file, where it first attempts to retrieve it from the ig suite base URL, then checks the IG repository, and if it is not found in either location, it uses the default template to create the publication-feed.xml file in the webroot with values filled in from the configuration data.
        if not Path("webroot/publication-feed.xml").exists():
            logger.warning("publication-feed.xml not found at IG suite base URL or in IG repository. Using default template to create publication-feed.xml in webroot.")
            publication_feed = publication_feed_template
            for key in config_data:
                publication_feed = publication_feed.replace("{"+key+"}", str(config_data[key]))

            with open("webroot/publication-feed.xml", "w") as template_file:
                template_file.write(publication_feed)



    



def initialize_templates(ig_repo_path):
    """
    Initialize the templates folder with any custom templates from the IG repository as well as default header, postamble, and preamble templates. This function creates the `templates` directory if it does not exist, then copies any custom template files from the IG repository (as specified in the `ig.ini` file) into the `templates` directory. It also ensures that the default `header.template`, `postamble.template`, and `preamble.template` files are created in the `templates` directory if they do not already exist, using predefined template strings. This setup is necessary to ensure that the publisher has access to both custom and default templates for generating the IG output during the build process.
    Args:        ig_repo_path: Path to the cloned IG repository from which to load any custom templates and configuration for template setup. The presence of an `ig.ini` file in the IG repository is used to determine if there are custom templates to copy, and the paths specified in that file are used to locate and copy those templates into the `templates` directory.
    """
    logger = logging.getLogger()
    directory_path = Path("templates")
    try:
        directory_path.mkdir(exist_ok=True)
        logger.debug(f"Directory '{directory_path}' created or already exists.")
    except PermissionError:
        logger.error(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        logger.error(f"An error occurred: {e}")

    copy_template_files(ig_repo_path=ig_repo_path)

    if not Path("templates/header.template").exists():
        with open("templates/header.template", "w") as template_file:
            template_file.write(header_template)

    if not Path("templates/postamble.template").exists():
        with open("templates/postamble.template", "w") as template_file:
            template_file.write(postamble_template)

    if not Path("templates/preamble.template").exists():
        with open("templates/preamble.template", "w") as template_file:
            template_file.write(preamble_template)


def copy_template_files(ig_repo_path):
    """
    Copy custom template files from the IG repository to the templates directory. This function checks for the presence of an `ig.ini` file in the IG repository, and if it exists, it reads the specified template ID to locate any custom template files. It then copies these custom template files from the IG repository into the `templates` directory in the output folder. If a custom template file has the same name as a default template (e.g., `history.template`), it is copied to the appropriate location (e.g., `ig-history/history.template`) instead of the `templates` directory to ensure it is used correctly during the build process. This allows for customization of templates on a per-IG basis while still maintaining default templates for use when no custom templates are provided.
    Args:        ig_repo_path: Path to the cloned IG repository from which to load any custom templates and configuration for template setup. The presence of an `ig.ini` file in the IG repository is used to determine if there are custom templates to copy, and the paths specified in that file are used to locate and copy those templates into the appropriate locations in the output folder.
    """
    logger = logging.getLogger()
    ig_ini_path = Path(str(ig_repo_path) + '/ig.ini')
    if ig_ini_path.exists():
        logger.debug("The ig.ini file exists.")
        config = configparser.ConfigParser()
        config.read(str(ig_ini_path))
        template_id = config['IG']['template']
        logger.debug(f"Template ID: {template_id}")
        template_assets_path = Path(str(ig_repo_path) + '/' + template_id + '/content/assets')
        if template_assets_path.is_dir():
            logger.info("Custom template folder exists: " + str(template_assets_path))
            for folder in template_assets_path.glob('*'):
                if folder.is_dir():
                    for file in folder.glob('*'):
                        if file.is_file():
                            dest = Path('ig-history/assets-hist/' + folder.name + '/' + file.name)
                            if dest.exists():
                                dest.unlink()
                            dest.parent.mkdir(parents=True, exist_ok=True)
                            shutil.copy(str(file), str(dest))

        templates_path = Path(str(ig_repo_path) + '/' + template_id + '/templates')
        if templates_path.is_dir():
            logger.info("Custom template exists: " + str(templates_path))
            for file in templates_path.glob('*template*'):
                if file.name == 'history.template':
                    dest = Path('ig-history/' + file.name)
                    if dest.exists():
                        dest.unlink()
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copy(str(file), str(dest))
                else:
                    target_dir = Path('templates')
                    target_dir.mkdir(parents=True, exist_ok=True)
                    shutil.copy(str(file), str(target_dir / file.name))
