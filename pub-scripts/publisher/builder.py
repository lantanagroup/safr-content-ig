import os
import shutil
from pathlib import Path
from .downloader import get_latest_cqf_tooling_url
from .config import CQF_TOOLING_JAR, load_configuration, initialize_webroot


def run_ig_build(ig_repo_path):
    """Run the IG build process on the cloned IG repository. THis is the initial publication run which is needed as a precursor to the full build. The initial run is needed to generate the JSON files from SUSHI and to get the ImplementationGuide.json file into the input folder for the tooling build. The tooling build then generates the full output including the HTML pages. Finally, we run the standard IG Publisher build to ensure we have all the expected output files in place for post processing steps.
    This function first runs the SUSHI build to generate the initial JSON files from FSH. It then checks for the presence of CQL files in the IG repository. If CQL files are found, it runs the CQF Tooling build using the latest `tooling-cli.jar` to process the CQL and generate the full IG output. If no CQL files are present, it falls back to running the standard IG Publisher build using `publisher.jar` without invoking the tooling. This approach ensures that we get the benefits of the latest tooling for CQL processing when needed, while still supporting non-CQL IGs without forcing them to use the tooling.
    Args:
        ig_repo_path: Path to the cloned IG repository on which to run the build.
    """

    os.chdir(ig_repo_path)
    print("Pre building with sushi")
    os.system("sushi .")
    
    cwd = os.getcwd()

    # Print the current working directory
    print("Current Working Directory:", cwd)

    # TODO Copy Implementation Guide to input/data/ig.json, 
# copy .\fsh-generated\resources\ImplementationGuide-gov.cdc.nhsn.safr.json .\input\data\ig.json
    # Find ImplementationGuide.*.json in ig_repo_path\fsh-generated\resources and copy to ig_repo_path\input\data\ig.json
    fsh_generated_resources = Path(cwd).joinpath('fsh-generated/resources')

    ig_json_files = list(fsh_generated_resources.glob('ImplementationGuide-*.json'))  
    if ig_json_files:
        latest_ig_json = max(ig_json_files, key=os.path.getctime)  # Get the most recently created IG JSON file
        shutil.copy(latest_ig_json, Path(cwd).joinpath('input/data/ig.json'))
        print(f"Copied {latest_ig_json} to {Path(cwd).joinpath('input/data/ig.json')}")
    else:
        print("No ImplementationGuide-*.json files found in fsh-generated/resources. Skipping copy to input/data/ig.json")

    # Build with CQF Tooling if CQL files are present, otherwise run standard IG build. This is to ensure we get the benefits of the latest tooling for CQL processing without forcing it on non-CQL IGs.   
    if os.path.isfile(f"../{CQF_TOOLING_JAR}"):
        print("Running CQF Tooling")
        shutil.copy('../' + CQF_TOOLING_JAR, './' + CQF_TOOLING_JAR)
        cqf_build_command = f"java \"-Dfile.encoding=UTF-8\" -jar {CQF_TOOLING_JAR} -RefreshIG -ini=\"./ig.ini\" -t -d -ss=false -timestamp=true"
        print(cqf_build_command)
        os.system(cqf_build_command)
    else:
        print("CQF Tooling DOES NOT Exist")

    # Run the standard IG Publisher build to generate the HTML output. This is necessary to get the full output including the HTML pages.
    print("Running individual IG build")
    ig_build_command = f"java \"-Dfile.encoding=UTF-8\" -jar ../publisher.jar -no-sushi -ig ."
    print(ig_build_command)
    os.system(ig_build_command)

    os.chdir('..')


def run_full_build(publish_path, ig_repo_path):
    """Run the full IG build process using the publisher and CQF tooling. This is needed to generate the full output including the HTML pages. The full build is run after the initial build and post-processing steps to ensure we have all the expected output files in place for post processing steps.
    This function runs the full IG build using the latest `publisher.jar` to generate the complete IG output, including HTML pages. It constructs the command with appropriate arguments for source, web output, registry, history, and templates based on the provided paths. 
    After running the build, it copies the generated version from the build output (located in `input/data/ig.json`) into the `webroot/ig` folder which will act as the default/canonical version of the IG.
    Args:
        publish_path: Path to the publish directory.
        ig_repo_path: Path to the cloned IG repository.
    """
    print("Running full versioned IG build")
    full_build_command = f"java \"-Dfile.encoding=UTF-8\" -jar publisher.jar -go-publish -source {str(Path(ig_repo_path).resolve())} -web {str(Path(publish_path + '/webroot').resolve())} -registry {str(Path(publish_path + '/ig-registry/fhir-ig-list.json').resolve())} -history {str(Path(publish_path + '/ig-history').resolve())} -templates {str(Path(publish_path + '/templates').resolve())}"
    print(full_build_command)
    os.system(full_build_command)
    # TODO After full build copy the generated version into the webroot/ig folder for post processing steps to work on the correct files.
    generated_version = str(Path(ig_repo_path).resolve().joinpath('input/data/ig.json'))
    if os.path.isfile(generated_version):
        with open(generated_version, 'r', encoding='utf-8', errors='ignore') as f:
            import json
            ig_data = json.load(f)
            version = ig_data.get('version', 'unknown')
            print(f"Copying generated version {version} into webroot/ig for post processing steps")
            print(f'Copying {str(Path(publish_path).resolve().joinpath('webroot/ig/' + version))} to {str(Path(publish_path).resolve().joinpath('webroot/ig/'))}')
            #shutil.copy(str(Path(publish_path).resolve().joinpath('webroot/ig/' + version)), str(Path(publish_path).resolve().joinpath('webroot/ig/')))
            shutil.copytree(str(Path(publish_path).resolve().joinpath('webroot/ig/' + version)), str(Path(publish_path).resolve().joinpath('webroot/ig/')), dirs_exist_ok=True)
    else:
        print("Generated version file not found, skipping copy to webroot/ig")


def initialize_output_folder(ig_repo_path, IG_PUBLISHER_URL):
    """Initialize the output folder by downloading the latest publisher.jar and running the initial IG build to generate the necessary JSON files for the full build. This function is a precursor to the full build and is needed to set up the output folder with the initial generated files from SUSHI and the IG Publisher. It first downloads the latest `publisher.jar` from the specified URL, then runs the initial IG build using the `run_ig_build()` function.
    It checks for the presence of CQL files in the IG repository. If CQL files are found, it also downloads the latest `tooling-cli.jar` to enable the CQF Tooling build during the IG build process. This ensures that if the IG contains CQL, we have the necessary tooling to process it correctly.
    Args:
        ig_repo_path: Path to the cloned IG repository.
        IG_PUBLISHER_URL: URL to download the latest publisher.jar.
    """
    print("Retrieving the latest build jar files (publisher.jar tooling-cli.jar).")
    os.system(f"curl -L {IG_PUBLISHER_URL} -o ./publisher.jar")

    dir = Path.cwd()
    files = dir.glob(f'{str(ig_repo_path)}/input/cql/*.cql')
    if len(list(files)) > 0:
        tooling_url = get_latest_cqf_tooling_url()
        print("CQL Files found. Retrieving the latest tooling-cli.jar IG Publisher file and will run tooling.")
        os.system(f"curl -L {tooling_url} -o ./tooling-cli.jar")
    else:
        print("No CQL Files found. Will not download and run CQF Tooling")

    config_data = load_configuration(str(ig_repo_path))

    initialize_webroot(config_data=config_data)