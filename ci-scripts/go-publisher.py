
import sys
import glob
import os.path
import time
from datetime import datetime

import argparse
import configparser
from pathlib import Path
from urllib.request import urlopen
import xmltodict
import semver
import shutil
import validators
import json
import yaml


#########################################################################################
#
#  Usage: python go_publisher.py [Github repo url] [Local output path (absolute or relative)] {-b [repo branch id]}
#         -b branch is optional
#
#   NOTE: Builds can be quite large, 1 GB+ and can take well more than an hour to build 
#
#
#  After building, one could run a web host to try it out in a browser. CD to the output folder and run: jekyll server -s webroot
#  The url will be indicated in the terminal
#
# 
#  IG Repo Requirements:
#           IF the IG uses a custom template, the full publication will need some special matching template files stored in the regular IG's repo
#           This will allow the IG to specify the history page template. 
#           Place the appropriate templates in the custom templates folder specified in the ig.ini template setting. 
#           The templates should be in the folder [custom template]/templates where [custom template] is the folder in the ig.ini
#           This can include the header.template, history.template, preamble.template, and searchfor.template.html files.
#           Without these templates, this script currently creates the a default set of templates (that are not automatically maintained)
#
#########################################################################################

# TODO Immediate, Make sure it builds well using the history and other template files. Need documentation for this.
# TODO Support for pub repo parameter, handle auto 
# TODO need to handle exceptions. e.g. if failing to create a folder, need to bail.
# TODO Later? Need an initialization "mode". Add parameter to initialize. Add a means to check the pub repo for initialization files.
# TODO Add check to see if cql files existing in IG repo/input/cql (and subfolders) and run cqf tooling if so.
# TODO Consider downloading the default templates from an authoritative source instead of using hard coded variables 


IG_PUBLISHER_URL = "https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
CQF_TOOLING_REPO = "https://oss.sonatype.org/service/local/repositories/releases/content/org/opencds/cqf/tooling-cli"
CQF_TOOLING_URL = "https://oss.sonatype.org/service/local/repositories/releases/content/org/opencds/cqf/tooling-cli/3.6.0/tooling-cli-3.6.0.jar"
DEFAULT_CQF_VERSION = "3.6.0"
CQF_TOOLING_JAR = "tooling-cli.jar"
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

pub_repos = {'ig-history': 'https://github.com/HL7/fhir-ig-history-template.git', 'ig-registry': 'https://github.com/FHIR/ig-registry.git'}

default_config = {'server-type': 'asp-old'}

def main():
    parser = argparse.ArgumentParser(description="""FHIR IG Publisher - Full Publication Setup Script""")
    parser.add_argument('ig_repo', type=repo_url_arg, help="Path to FHIR IG Repository", nargs='?')    
    parser.add_argument('output_path', type=output_folder_arg, help="Output Folder path", nargs='?')
    parser.add_argument('-b', '--branch', help="Repository Branch")
    
    args = parser.parse_args()

   
    if not (args.ig_repo and args.output_path):
        parser.print_help()
        parser.error('Need a FHIR IG repo and Output folder')

    start = time.time()

    directory_path = Path(args.output_path)
    try:
        directory_path.mkdir()
        print(f"Directory '{directory_path}' created successfully.")
    except FileExistsError:
        print(f"Directory '{directory_path}' already exists.")
    except PermissionError:
        print(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        print(f"An error occurred: {e}")


    os.chdir(directory_path)

    current_time = time.time()
    print("Current execution time (in seconds)", current_time - start)

    ig_repo_path = clone_repos(args.ig_repo, args.branch)


      

    

    current_time = time.time()
    print("Current execution time (in seconds)", current_time - start)

    initialize_output_folder(ig_repo_path=ig_repo_path)

    initialize_templates(ig_repo_path=ig_repo_path)


    

    current_time = time.time()
    print("Set up complete - Current execution time (in seconds)", current_time - start)


    ig_build_start_time = time.time()
    print("Starting to run IG Build - " + str(ig_repo_path))
    run_ig_build(ig_repo_path=ig_repo_path)
    ig_build_end_time = time.time()       
    print(f"IG Build complete -  IG build time (in seconds) {str(ig_build_end_time - ig_build_start_time)}")

    current_time = time.time()
    print("Current execution time (in seconds)", current_time - start)

    full_build_start_time = time.time()
    print("Starting to run full build -")
    

    run_full_build(publish_path=str(Path('.').parent.resolve()), ig_repo_path=ig_repo_path)
    full_build_end_time = time.time()
    
    print(f"Full Build complete -  IG build time (in seconds) {str(full_build_end_time - full_build_start_time)}")

    end = time.time()
    print("Full execution time (in seconds)", end - start)


####################### END OF main() #######################




def clone_repos(ig_repo, branch):
    print("Cloning FHIR IG repo: " + ig_repo)
    # TODO May need to support authenticated access to private repo. Will need to add
    #os.system("sshpass -p your_password ssh user_name@your_localhost")
    if branch == None:
        os.system(f"git clone {ig_repo}")
        print(f"Cloned: git clone {ig_repo}")
    else:
        os.system(f"git clone -b {branch} --single-branch {ig_repo}")
        print(f"Cloned: git clone {ig_repo} -b {branch}")

    # Get the path of the file
    ig_repo_path = list(Path('.').iterdir())[0]

    for key, value in pub_repos.items():
        print(f"Cloning {key} repo: {value}")
        os.system(f"git clone {value} {key}") # Cloning

    return ig_repo_path

def load_configuration(ig_repo_path):
    with open(ig_repo_path + '/publication-request.json', 'r') as file:
        config_data = json.load(file)

    config_data['ig_repo_path'] = ig_repo_path

    with open(ig_repo_path + '/sushi-config.yaml', 'r') as file:
        sushi_config = yaml.safe_load(file)
        config_data['canonical'] = sushi_config['canonical']
        config_data['publisher.name'] = sushi_config['publisher']['name']
        
        config_data['canonical-end'] = '/' + sushi_config['canonical'].rsplit('/', 1)[1]
        

    for key in default_config:
        if not key in config_data:
            config_data[key] = default_config[key]

    return config_data
    
def initialize_output_folder(ig_repo_path):
    # Retrieve latest publisher
    # curl -L https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o ~/src/publisher.jar
    print("Retrieving the latest build jar files (publisher.jar tooling-cli.jar).")
    os.system(f"curl -L {IG_PUBLISHER_URL} -o ./publisher.jar") # Cloning

    # TODO Add check to see if cql files existing in IG repo/input/cql (and subfolders) and run cqf tooling if so.
    dir = Path.cwd()
    files = dir.glob(f'{str(ig_repo_path)}/input/cql/*.cql')
    if(len(list(files)) > 0):
        tooling_url = get_latest_cqf_tooling_url()

        print("CQL Files found. Retrieving the latest tooling-cli.jar IG Publisher file and will run tooling.")
        os.system(f"curl -L {tooling_url} -o ./{CQF_TOOLING_JAR}") 
    else:
        print("No CQL Files found. Will not download and run CQF Tooling")


    config_data = load_configuration(str(ig_repo_path))

    initialize_webroot(config_data=config_data)
    
  
def get_latest_cqf_tooling_url():
    cqf_url = CQF_TOOLING_URL

    CQF_TOOLING_REPO

    file = urlopen(CQF_TOOLING_REPO)
    data = file.read()
    
    file.close()

    cqf_data = xmltodict.parse(data)
    
    current_version = DEFAULT_CQF_VERSION
    index = 0
    while index < len(cqf_data['content']['data']['content-item']):
        #print(cqf_data['content']['data']['content-item'][index]['text'])
        ValueError
        try:
            if(semver.compare(current_version, cqf_data['content']['data']['content-item'][index]['text']) < 0):
                #print(f"Higher version found: Current Version {current_version}; new version: {cqf_data['content']['data']['content-item'][index]['text']}")
                current_version = cqf_data['content']['data']['content-item'][index]['text']
                cqf_url = cqf_data['content']['data']['content-item'][index]['resourceURI'] + 'tooling-cli-' + current_version + '.jar'
            #else:
            #    print(f"Lower version found: Current Version {current_version}; new version: {cqf_data['content']['data']['content-item'][index]['text']}")
        except ValueError as ve:
            print(f'Non-Semver version found: {cqf_data['content']['data']['content-item'][index]['text']}')
        index = index + 1

    return cqf_url
    
def initialize_webroot(config_data):
    
    directory_path = Path("webroot")
    try:
        directory_path.mkdir()
        print(f"Directory '{directory_path}' created successfully.")
    except FileExistsError:
        print(f"Directory '{directory_path}' already exists.")
    except PermissionError:
        print(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        print(f"An error occurred: {e}")


    package_registry = package_registry_template

    for key in config_data:
       package_registry = package_registry.replace("{"+key+"}", str(config_data[key]))

    #print(package_registry)
    with open("webroot/package-registry.json", "w") as template_file:
        template_file.write(package_registry)

    publish_setup = publish_setup_template
    for key in config_data:
       publish_setup = publish_setup.replace("{"+key+"}", str(config_data[key]))
    
    with open("webroot/publish-setup.json", "w") as template_file:
        template_file.write(publish_setup)


    package_feed = package_feed_template
    for key in config_data:
       package_feed = package_feed.replace("{"+key+"}", str(config_data[key]))
    
    with open("webroot/package-feed.xml", "w") as template_file:
        template_file.write(package_feed)

    
    publication_feed = publication_feed_template
    for key in config_data:
       publication_feed = publication_feed.replace("{"+key+"}", str(config_data[key]))
    
    with open("webroot/publication-feed.xml", "w") as template_file:
        template_file.write(publication_feed)


    # TODO Copy files from https://github.com/HL7/fhir-ig-history-template asset-hist
    #   Then need co look at ig_repo_path ig.ini for template = X, to copy X/content/assets-hist to webroot/assets-hist to overwrite any files
    #  possible merge - https://nehals4545.medium.com/how-to-merge-folders-using-python-functions-727b7e03261a
    


def initialize_templates(ig_repo_path):
    
    directory_path = Path("templates")

    # TODO Address template files, perhaps need to copy from  history.template requirement 
    #  Perhaps could copy over from a ig_repo_path ig.ini template = X with X/*.template files, and then add these templates to the publish-setup.json creating elements under website using the template file name
    #   ex
    #   "history-template": "history.template",
    #   "index-template": "index.template",
    # If not in custom template (and instead of the way it is done currently by having the file contents loaded in a variable), copy default from github https://github.com/HL7/fhir-web-templates
    

    try:
        directory_path.mkdir()
        print(f"Directory '{directory_path}' created successfully.")
    except FileExistsError:
        print(f"Directory '{directory_path}' already exists.")
    except PermissionError:
        print(f"Permission denied: Unable to create '{directory_path}'.")
    except Exception as e:
        print(f"An error occurred: {e}")

    # copy template related files if they exist
    copy_template_files(ig_repo_path=ig_repo_path)

    if(not Path("templates/header.template").exists()):
        with open("templates/header.template", "w") as template_file:
            template_file.write(header_template)

    if(not Path("templates/postamble.template").exists()):
        with open("templates/postamble.template", "w") as template_file:
            template_file.write(postamble_template)
        
    if(not Path("templates/preamble.template").exists()):
        with open("templates/preamble.template", "w") as template_file:
            template_file.write(preamble_template)


def copy_template_files(ig_repo_path):
    ig_ini_path = Path(str(ig_repo_path) + '/ig.ini')

    # Check if the file exists
    if ig_ini_path.exists():
        print("The file exists.")
        config = configparser.ConfigParser()
        config.read(str(ig_ini_path))
        template_id = config['IG']['template']
        print(template_id)
        template_assets_path = Path(str(ig_repo_path) + '/' + template_id + '/content/assets')
        if(template_assets_path.is_dir()):
            print("Custom template folder exists: " + str(template_assets_path))

            p = Path('docs')
            for folder in template_assets_path.glob('*'):
                if(folder.is_dir()):
                    print(folder.name)
                    for file in folder.glob('*'):
                        if(file.is_file):
                            print(file.name)
                            # Copy to ig-history assets-hist
                            print("Copy: " + str(file) + "-> " + 'ig-history/assets-hist/' + folder.name + '/' + file.name)
                            if(Path('ig-history/assets-hist/' + folder.name + '/' + file.name).exists()):
                                print(" File Exists, deleting: " + 'ig-history/assets-hist/' + folder.name + '/' + file.name)
                                Path('ig-history/assets-hist/' + folder.name + '/' + file.name).unlink()

                            shutil.copy(str(file), 'ig-history/assets-hist/' + folder.name + '/' + file.name)


        templates_path = Path(str(ig_repo_path) + '/' + template_id + '/templates')
        if(templates_path.is_dir()):
            print("Custom template exists: " + str(templates_path))
            for file in templates_path.glob('*template*'):
                print("Found template file: " + file.name)
                
                if(file.name == 'history.template'):
                    Path('ig-history/' + file.name).unlink()
                    print("Copy: " + str(file) + "-> " + 'ig-history/' + file.name)
                    shutil.copy(str(file), 'ig-history/' + file.name)    
                else:
                    print("Copy: " + str(file) + "-> " + 'templates/' + file.name)
                    shutil.copy(str(file), 'templates/' + file.name)


def run_ig_build(ig_repo_path):
    os.chdir(ig_repo_path)
    # TODO Is there a way to check whether CQF Tooling needs to be run first?
    # JAVA -jar "%input_cache_path%\%tooling_jar%" -RefreshIG -ini="%ig_ini_path%" -t -d -ss=false -timestamp=true
    print("Pre building with sushi")
    os.system("sushi .")

    if(os.path.isfile(f"../{CQF_TOOLING_JAR}")):

        print("Running CQF Tooling")
        shutil.copy('../' + CQF_TOOLING_JAR, './' + CQF_TOOLING_JAR)
        
        # Check if CQF Tooling exists, and if so, run.
        cqf_build_command = f"java \"-Dfile.encoding=UTF-8\" -jar {CQF_TOOLING_JAR} -RefreshIG -ini=\"./ig.ini\" -t -d -ss=false -timestamp=true"    
        print(cqf_build_command)
        os.system(cqf_build_command)
    else:
        print("CQF Tooling DOES NOT Exist")
    
    
    
    print("Running individual IG build")
    ig_build_command = f"java \"-Dfile.encoding=UTF-8\" -jar ../publisher.jar -ig ."    
    print(ig_build_command)
    os.system(ig_build_command)

    os.chdir('..')

def run_full_build(publish_path, ig_repo_path):

    #current_path = str(Path('.').)
    #os.system(f"java -jar publisher.jar -go-publish -source {ig_repo_path} -o ./publisher.jar") # Cloning
    #print(f"java -jar publisher.jar -go-publish -source {ig_repo_path}  -web {publish_path}\\webroot -registry {publish_path}\\ig-registry\\fhir-ig-list.json -history {publish_path}\\ig-history -templates {publish_path}\\templates")
    #print(f"java -jar publisher.jar -go-publish -source {ig_repo_path} -web {str(Path(publish_path + '\\webroot').resolve())} -registry {str(Path(publish_path + '\\ig-registry\\fhir-ig-list.json').resolve())} -history {str(Path(publish_path + '\\ig-history').resolve())} -templates {str(Path(publish_path + '\\templates').resolve())}")
    print("Running full versioned IG build")
    full_build_command = f"java -jar publisher.jar -go-publish -source {str(Path(ig_repo_path).resolve())} -web {str(Path(publish_path + '/webroot').resolve())} -registry {str(Path(publish_path + '/ig-registry/fhir-ig-list.json').resolve())} -history {str(Path(publish_path + '/ig-history').resolve())} -templates {str(Path(publish_path + '/templates').resolve())}"
    print(full_build_command)
    os.system(full_build_command)
    #java -jar publisher.jar -go-publish -source .\nhsn-measures\ -web C:\dev\fhir\web\Publish\webroot -registry C:\dev\fhir\web\Publish\ig-registry\fhir-ig-list.json -history
 #C:\dev\fhir\web\Publish\ig-history -templates C:\dev\fhir\web\Publish\templates


def repo_url_arg(string):
    if( not validators.url(string)):
        print("URL is not valid: " + string)
    else:
        return string

def output_folder_arg(string):
    if(Path(string).is_dir()):
        print("Folder already exists: " + string)
    else:        
        return string


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


publish_setup_template = '''
{
    "website": {
        "style": "fhir.layout",
        "url": "{canonical}",
        "server": "{server-type}",
        "org": "{publisher.name}",
        "index-template": "index.template",
        "clone-xml-json": true
    },
    "layout-rules": [
        {
            "npm": "{package-id}",
            "canonical": "{canonical}",
            "destination": "{canonical-end}"
        }
    ],
    "layout": {
        "id": "{package-id}",
        "canonical": "{canonical}"
    }
}'''

# feed creation is not yet working. Need to figure out why before using this
publish_setup_with_feeds_template = '''
{
    "website": {
        "style": "fhir.layout",
        "url": "{canonical}",
        "server": "{server-type}",
        "org": "{publisher.name}",
        "index-template": "index.template",
        "clone-xml-json": true
    },
    "feeds" : {
        "package" : "package-feed.xml",
        "publication" : "publication-feed.xml"
    },
    "layout-rules": [
        {
            "npm": "{package-id}",
            "canonical": "{canonical}",
            "destination": "{canonical-end}"
        }
    ],
    "layout": {
        "id": "{package-id}",
        "canonical": "{canonical}"
    }
}'''

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


    
</div>

    </div>  <!-- /inner-wrapper -->
            </div>  <!-- /row -->
        </div>  <!-- /container -->

    </div>  <!-- /segment-content -->


<div id="segment-footer" class="segment">  <!-- segment-footer -->
  <div class="container">  <!-- container -->
   <div class="inner-wrapper">
    <p>
      <span id="ig-footer">TBD </span> &reg;&copy; <a style="color: #81BEF7" href="http://hl7.org/fhir">FHIR</a> |
             <!--  <a style="color: #81BEF7" rel="license"  <href="../license.html"><img style="border-style: none;" alt="CC0" src="cc0.png"/></a> -->
                <a style="color: #81BEF7" rel="license" href="http://hl7.org/fhir/license.html"><img style="border-style: none;" alt="CC0" src="cc0.png"/></a>
        </p>
   </div>  <!-- /inner-wrapper -->
  </div>  <!-- /container -->
 </div>  <!-- /segment-footer -->
  <!-- disqus thread -->
  <!-- disqus -->
  <!-- end disqus -->

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


# Feeds do not currently work
package_feed_template = '''<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:fhir="http://hl7.org/fhir/feed" version="2.0">
    <channel>
        <title>{title}</title>
        <description>{description}</description>
        <link>{canonical}/package-feed.xml</link>
        <generator>HL7, Inc FHIR Publication tooling - Lantana Consulting Group Variant</generator>
        <lastBuildDate></lastBuildDate>
        <atom:link href="{canonical}/package-feed.xml" rel="self" type="application/rss+xml"/>
        <pubDate></pubDate>
        <language>en</language>
        <ttl>600</ttl>
    </channel>
</rss>'''

publication_feed_template = '''<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:dc="http://purl.org/dc/elements/1.1/"
      xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:fhir="http://hl7.org/fhir/feed"
      xmlns:atom="http://www.w3.org/2005/Atom" version="2.0">
   <channel>
        <title>{title}</title>
        <description>{description}</description>
        <link>{canonical}</link>
      <generator>HL7, Inc FHIR Publication tooling - Lantana Consulting Group Variant</generator>
      <lastBuildDate>{current-date}</lastBuildDate>
      <atom:link href="{canonical}/package-feed.xml" rel="self" type="application/rss+xml"/>
      <pubDate>{current-date}</pubDate>
      <language>en</language>
      <ttl>600</ttl>
      <item>
      </item>
   </channel>
</rss>'''

main()
