# Publisher Script Documentation

This document provides both developer and user documentation for the `pub-scripts/publisher` script set in the NHSN Measures repository.

# TODO Address publication-feed and package-feed files for multiple IGs (Manual process?)
# TODO Add all publications across all versions to the package-feed and publication-feed (How to manage this across IGs?), Perhaps pull from suite url if present? Or pull from package-list in the github repo of each IG? Would need a way to identify those and the correct branch.

#TODO Add a parameter to commit changes to the repo with a commit message (this would include the updated package-list.json file as well as a zip of the version, which will need to be created by default in the repo folder at the end of processing)

# Table of Contents
- [Overview](#overview)
- [Script Information](#script-information)
- [Set Up](#set-up)
  - [For Every New Version Published](#for-every-new-version-published)
  - [For New IGs or to Change Structure or Defaults](#for-new-igs-or-to-change-structure-or-defaults)
  - [For Fixing/Updating Multiple Version Publications](#for-fixingupdating-multiple-version-publications)
- [Building](#usage)
- [Installation](#installation)
- [Verification](#verification)
- [Developer Documentation](#developer-documentation)
- [Implementation Details](#implementation-details--hints)
- [Troubleshooting](#troubleshooting)
- [Additional Documentation](#additional-documentation)


## Overview

These scripts automate the IG build, publishing, and post-processing workflow for FHIR Implementation Guides (IGs). The pipeline includes:

- Cloning or checking out a specific repo branch (if provided)
- Generating SUSHI-built JSON and IG artifacts
- Running CQF Tooling (`tooling-cli.jar`) if CQL exists
- Running standard IG Publisher build with `-go-publish`
- Copying generated `ImplementationGuide.json` and related files to `input/data/ig.json`
- Applying post-processing: `web.config` for redirects, 508 accessibility fixes, and NHSN-MS hover metadata
- Robust execution tracking: Every major step logs commands and outputs locally to both console and `publish.log`.

After the IG version is built, some additional steps will be required to publish the new version of the IG. These steps are not currently handled through scripting and may differ somewhat based on the web server needs. This readme provides some documentation on the [installation](#installation) and [verification](#verification) of a web server installation including some details specific to the NHSN IGs and Web Server.

## Script Information

Script folder: `pub-scripts`

Primary scripts:
- `extract_cql_versions.sh` (shell helper to extract CQL versions from package or bundle)
- `PIpeline_doc.md` (pipeline documentation for CI/CD / publish flow in Lantana Azure - as of 3/31/2026)
- `go-publisher.py` (CLI entrypoint for full publish)
- `publisher/builder.py` (build step orchestration, run sushi + tools + publisher)
- `publisher/fix_accessibilities.py` (post-processing for accessibility style and NHSN-MS hover info)
- `publisher/config.py` (configuration helper for environment and webroot setup)
- `publisher/downloader.py` (download external tooling metadata/URLs)
- `publisher/utils.py` (helpers for colored console output, path validation, and logging)


## Set Up
The following details the requirements for setup. These files need to be modified appropriately and checked in to the default or specific build branch (accordingly).

### For Every New Version Published
#### Update publication-request.json
The file contains the information required to release a new implementation guide to a web site. One of those must be created for each new publication

  - `package-id` (string): Unique identifier for the package. Should be the same value as found in the `sushi-config.yaml` in the `id` property.
  - `version` (string): Semver version of the new publication being built.
  - `path` (string): Semver versioned path of published version. Must be  {canonical}/{semver} (e.g. `http://www.cdc.gov/nhsn/fhirportal/safr/ig/1.0.0`).
  - `mode` (string): Publication mode. For latest version publications (to the CDC website) this will always be `milestone`. the IG will also be published to {canonical} as the 'current' approved version. 
  - `status` (string): the status of this release. For a CDC Website publication, this will always be `release`.
  - `sequence` (string): Sequence or milestone grouping for the version (e.g., `R 1`, for Release 1 sequence). Sequence numbers will be generally contain the single major version portion of the semver version number.
  - `desc` (string): Text description of the release
  - `category` (string): For CDC, this will likely be `Public Health`
  - `registry-description` (string): The short description for the IG - goes in the registry 
  - `first` (boolean): if this is the very first time that IG has been published, set this to true, and provide values for title, ci-build, category, and introduction. Otherwise, set this to false, and the values for those other properties will be ignored (the existing values are preserved, and can only be changed manually by the publication manager)
    - `title` (string): Only on first publication - The human readable name for the IG.
    - `ci-build` (string): Only on first publication - The URL to the CI build (most likely an NHSNlink sub-domain, eg. `https://safr-ci.nhsnlink.org/`)
    - `introduction` (string):  Only on first publication - A human readable description of the intent of the IG (shown on the history page). 
  - `changes` (string, optional): Link to the change log or detailed change notes. Likely the unversioned url to the change log with an anchor to the version specific changes. 
  - [Additional Documentation](https://confluence.hl7.org/spaces/FHIR/pages/144970227/IG+Publication+Request+Documentation)

### For New IGs or to Change Structure or Defaults
URL Forwarding (specifically useful for canonical uri forwarding to artifact web page) is currently configured to support Microsoft IIS 10.0 using web.config files. Earlier versions of IIS or different types of web servers (e.g. Apache) will require additional configuration or script updates. See [Maintaining a FHIR IG Publication](https://confluence.hl7.org/spaces/FHIR/pages/81027536/Maintaining+a+FHIR+IG+Publication#:~:text=the%20kind%20of%20server%20that%20hosts%20the%20web%20root) for more details on server configuration parameters for the `publish-setup.json` file. Additional template and setup will be required to enable to scripts to work with other web servers.

Update the `pud-scripts/config.py` files ig_suite_package_list variable to include the package ids and their respective package list files. This will be necessary to update feed files (package-feed.xml and publication-feed.xml) used by an IG registries.

### For Fixing/Updating Multiple Version Publications

The steps below should not be necessary if the set up steps above are followed with a version of these set up scripts after time of this documentation and the scripts and installation was performed as expected. However, in the event there is an issue the following can be reviewed if corrections are necessary. These corrections do not deal with the structure or location of the files directly, but can enable to documentation of the structure for the feed files (package-feed.xml and publication-feed.xml) used by an IG registries. See [IG Registry Registration](#ig-registry-registration) for more information.

TODO Slated for removal. 
#### Review and Update package-list.json

This file should be managed automatically by the `go-publisher.py` script, but if there is an issue, the contents of this file need to be verified.
The FHIR Package List format is a JSON file structure designed to document and manage different versions and metadata for a FHIR implementation guide or package. This format standardizes the representation of package metadata, making it easier to track changes, maintain compatibility, and navigate the history of FHIR specifications. THis is important for updating the package feed data which is used by FHIR package registries. This will be used for tracking multiple versions of the IG and is critical for systems using registries to use the packages (such as any other IG wishing to use the target IG).
  - Verify the root metadata are are accurate for the IG, including:
    - `package-id`: Unique identifier for the package. Should be the same value as found in the `sushi-config.yaml` in the `id` property.
    - `title`: Human-readable title of the package. Should be the same value as found in the `sushi-config.yaml` in the `title` property.
    - `canonical` - Canonical URL that serves as the default root for package artifacts. This is the canonical url, which is also found in the `sushi-config.yaml` in the `canonical` property.
    - `introduction`: Descriptive overview or introduction to the package or IG.
    - `category`: For CDC, this will likely be `Public Health`
  - Verify all older version objects in the `list` array are correct including the following properties (older versions should be populated and correct if published through the `go-publisher.py` script and then checked in to the code repo):
    - __Required Properties__
      - `version` (string): publication version number (of one that can be found in the final publication that is currently published on the CDC website)
        - `current` (string): the `go-publisher.py` script will automatically verify the `current` (CI) build information is populated correctly based on the latest information found in the `publication-request.json` file
        - This current publication being created - the current version being published by running `go-publisher.py` will automatically be populated.
      - `path` (string): URL pointing to the hosted version. This is the versioned URL in the hosted location. This is usually the canonical followed by the full semver (e.g. `1.0.0`). Must be {canonical}/{semver}.
      - `status` (string): Should be `release` for all CDC published versions (`current` version will be `ci-build`)
      - `sequence` (string): Sequence or milestone grouping for the version (e.g., `R 1`, for Release 1 sequence). Sequence numbers will be generally contain the single major version portion of the semver version number.
      - `date`  (string): Date of the publication run. Should be the same date as indicated in the IG pages footed following "Generated". The format is `YYYY-MM-DD` (ISO 8601 format)
      - `desc` (string): Short description of the version.
    - __Optional Properties__
      - `fhirversion` - FHIR version that all artifacts in this package adhere to. Currently this is `4.0.1` and will remain so until CDC is ready to support FHIR R6.
      - `sequenceNote` (string): Additional notes about the sequence.
      - `changes` (string, optional): Link to the change log or detailed change notes. Likely the unversioned url to the change log with an anchor to the version specific changes.
      - `current` (boolean, optional): Indicates whether this version is the current published version. Must not be present or set to false for older versions and ci-build

  - [Additional Documentation](https://confluence.hl7.org/spaces/FHIR/pages/288399849/FHIR+Package+List+Documentation)




## Building

### Primary publish command

From repo root (or `pub-scripts` parent):

```bash
python pub-scripts/go-publisher.py <repo-url> <output_folder> -b <branch> -r -a -v
```

example:
```bash
python .\pub-scripts\go-publisher.py https://github.com/lantanagroup/safr-content-ig ./publish -b development -v -r -a
```

Arguments:
- `<repo-url>`: GitHub repo to clone or use
- `output_folder`: Publication output folder (must not exist)
- `-b <branch>`: branch to publish (optional; default may be `main`/`development`)
- `-r`, `--reduce`: clean rebuild option (post-process file reduction)
- `-a`, `--access`: run additional post-processing accessibility steps
- `-p`, `--pauses`: wait for user key presses between major steps
- `-v`, `--verbose`: enable DEBUG level log output to the console
- `--dry-run`: simulate processing without heavy executions or mutating files

### Logging Output

When running `go-publisher.py`, a `publish.log` file is automatically generated in your working directory. It contains detailed timestamped information, executed commands (`> Executing: ...`), and visually distinct milestone separators (`=======`) to make tracing the -go-publish pipeline execution simple.

### Testing Sandbox

If you are modifying these scripts and wish to test them, a minimal FHIR IG sandbox repo is available here:
**https://github.com/caspears/fhir_sandbox**

*(Note: This repository may be modified in the future to be a more robust dry run tester. It will likely require adding some base files like `publication-request.json` and `ig.ini` in order to fully process through a standard `-go-publish` successfully without hitting file not found errors).*

### Fix accessibility manually

```bash
python pub-scripts/publisher/fix_accessibilities.py ./output/
```

This reads all matched HTML and ZIP in output and updates styling according to Section 508 and NHSN-MS rules.

## Developer Documentation

### `run_ig_build(ig_repo_path)`

In `builder.py`:
- Runs `sushi .` in `ig_repo_path`
- Copies latest `ImplementationGuide-*.json` from `fsh-generated/resources` to `input/data/ig.json`
- If `CQF_TOOLING_JAR` exists, runs CQF Tooling with:
  - `java -Dfile.encoding=UTF-8 -jar tooling-cli.jar -RefreshIG -ini ./ig.ini -t -d -ss=false -timestamp=true`
- Runs standard IG Publisher:
  - `java -Dfile.encoding=UTF-8 -jar ../publisher.jar -no-sushi -ig .`

### `run_full_build(publish_path, ig_repo_path)`

In `builder.py`:
- Builds published site with:
  - `java -Dfile.encoding=UTF-8 -jar publisher.jar -go-publish -source ... -web ... -registry ... -history ... -templates ... -temp ...`
- Copies generated `input/data/ig.json` versioned output into `webroot/ig/` for post-processing.

### `initialize_output_folder(ig_repo_path, IG_PUBLISHER_URL)`

In `builder.py`:
- Downloads `publisher.jar` from `IG_PUBLISHER_URL`
- Detects CQL files and downloads tooling jar if present
- Loads configuration from `config.py` and initializes webroot

### `fix_accessibilities.py`

In `publisher/fix_accessibilities.py`:
- `fix_accessibilities_in_folder(folder_path=../output)`
  - Applies `fix_accessibility_in_file` to matched HTML and XML
  - Applies `fix_zip_file_accessibilities` to `full-ig.zip`
- `fix_accessibility_in_file(file_path)`
  - Parses HTML and XML files with `lxml` as UTF-8, updates style attributes for opacity and colors. Add meta tag.
- updates differential table font weights, and
  - flags Must Support elements for NHSN-MS (optional by flag)
  - Adds `meta[name="data-accessibility-fixed"]` with a datetime value so repeated execution skips already-processed pages
  - Write back as UTF-8 HTML
- `replace_style(element, property_name, new_value, old_value=None, replace_only_if_exists=True)`
  - patch existing style string with property lookup/replacement
- `fix_zip_file_accessibilities(zip_path)`
  - extract ZIP to temp, run folder fix, zip again.


## Installation

After the IG and version is built, it will be necessary to publish to a web server. The go-publisher script only builds a single version of the IG (the latest version indicated in the `publication-request.json` file) and using the default or provided branch in the command line parameters. This means that **older versions must not be overwritten on the web server** or will need to be manually re-instated by an out of band process (either building that version specifically (perhaps using a branch tag) and copying to the right semver web folder or copying an archived version, perhaps stored in the IG repo). **Do not copy the entire build folder over the web server as is or you will overwrite the previous versions**.


### General Installation
General steps for installing a single built version (using the go-publisher scripts):
- If this is a new web server (i.e. this is a new IG that has not previously been published)
  - Copy the full webroot/ig folder to the correct url based on the IG canonical.
- If this is to add a version of the IG to an existing IG publication (has a previously published version):
  - Delete the base canonical folder of all non version folders (e.g. Delete all canonical folder files and delete all folders that do not include version numbers, as those are previous build versions)
  - Copy over all files and folders in the base webroot/ig folder into the canonical folder
- Copy the webroot `package-feed.xml` and `publication-feed.xml` files to the base suite url (e.g. http://www.cdc.gov/nhsn/fhirportal/)

### CDC NHSN Installation
 TODO add folder and process information for NHSN website folders

## Verification
Once the IG files have been installed. There should be a verification that the installation was full and correct.
- TODO Consider adding a script that can verify all of these things.

### General Verification
Check the following:
- `package-feed.xml` and `publication-feed.xml` files are in the base suite folder and all versions and urls are correct (for all IGs in the suite).
- Review the IG canonical url history.html page. Ensure that all links work (to all versions)
- Test web forwarding by testing several canonical urls to see if they resolve to the proper artifact web page.



feed files and history.html files. canonical verification

### CDC NHSN Verification


### IG Registry Registration

FHIR Implementation Guides (IGs) can be logged in a registry (a centralized catalog) primarily to promote discoverability, ensure interoperability, and provide a standardized, shareable source of truth for healthcare data exchanges. The [FHIR Foundation Community Registry](https://www.fhir.org/guides/registry) allows developers and organizations to locate specific rules, profiles, and terminologies needed to align systems.

Key purposes of registering a FHIR IG include:
- Discoverability & Reusability: It allows users to find existing, community-vetted solutions to specific interoperability problems, reducing redundant work.
- Validator & Tooling Support: IGs define profiles, extensions, and terminology bindings. A registry entry helps tools validate data against these rules, ensuring compliance before data is ingested into a system.
- Lifecycle and Version Control: Registries allow for managing the development, ballot, and publication phases of an IG, providing a stable reference to versioned specifications.

IGs should be registered in an IG registry once they are published. THis is a one time effort for any new "suite" of Implementation Guides. For the purpose of the CDC NHSN guides, all of the guides for reporting are considered part of the same suite and therefore only need to be registered once. The full list of registered IGs can be found in the [ig registry package feeds](https://github.com/FHIR/ig-registry/blob/master/package-feeds.json). This can be used to verify that the suite has been registered and done so correctly. This file points the registry to the `package-feed.xml` file located in the IG suite web folder (for CDC NHSN, this is http://www.cdc.gov/nhsn/fhirportal) and is used by the registry to detect all IGs (e.g. NHSN dQM Measures and NHSN SAFR) and their published versions. This file must be in place and correct before registration in the IG registry and for continual proper functioning. See [CDC NHSN Installation](#cdc-nhsn-installation) and [CDC NHSN Verification](#cdc-nhsn-verification) for more information.

Registration can be done through:
- Creating a PR on the [package feeds]([ig registry package feeds](https://github.com/FHIR/ig-registry/blob/master/package-feeds.json)) file would be helpful.
  - Contact Grahame Grieve (The FHIR Product Director) on at (fhir-director@hl7.org) [Zulip](http://chat.fhir.org) with information about the request.
- Registering in the [FHIR Foundation Registry Submission Form](https://www.fhir.org/guides/registry/submit.html).
- [Additional Documentation](https://www.fhir.org/guides/registry/submit.html)

## Implementation details / hints

- For relative imports, ensure `pub-scripts` or `publisher` is a Python package with `__init__.py` and run with `python -m publisher.fix_accessibilities` from package root.
- IG Publisher steps depend on `JAVA_HOME` and correct jar artifacts in working directory.

## Troubleshooting

- `attempted relative import with no known parent package`: run as package with `python -m publisher.builder` or adjust imports to absolute paths.
- Encoding glitches in HTML: prefer `tree.write(file_path, encoding='utf-8', method='html')` and avoid `decode('utf-8')` from bytes.
- `ElementTree not initialized` in XPath: ensure using `root = tree.getroot()` and fallback to `root = html.fromstring(raw_bytes)` if None.

## Additional Documentation
- Confluence
  - [Maintaining a FHIR IG Publication](https://confluence.hl7.org/spaces/FHIR/pages/81027536/Maintaining+a+FHIR+IG+Publication)
  - [IG Publication Request Documentation](https://confluence.hl7.org/spaces/FHIR/pages/144970227/IG+Publication+Request+Documentation)
  - [Process for Publishing a FHIR Implementation Guide (for non-HL7 IGs)](https://confluence.hl7.org/spaces/FHIR/pages/104580055/Process+for+Publishing+a+FHIR+Implementation+Guide+for+non-HL7+IGs)
  - [FHIR Package Registry User Documentation](https://confluence.hl7.org/spaces/FHIR/pages/97454344/FHIR+Package+Registry+User+Documentation)

- [How to Publish IG](https://github.com/ElliotSilver/how-to-publish) - Can be built locally in order to read.


- Additional documentation consulted in the creation of the scripts
  - [HL7 IG Publication - HL7 Process for Publishing a FHIR IG](https://confluence.hl7.org/spaces/FHIR/pages/66930641/HL7+Process+for+Publishing+a+FHIR+IG)
  - [FHIR IG PackageList doco](https://confluence.hl7.org/spaces/FHIR/pages/66928420/FHIR+IG+PackageList+doco)
  - [AU Publication Steps](https://confluence.hl7.org/spaces/HAFWG/pages/307300428/Publication+Steps)
  - [AU Step By Step: running publisher -go-publish](https://confluence.hl7.org/spaces/HAFWG/pages/218825999/Step+By+Step+running+publisher+-go-publish)
