# Publisher Script Documentation

This document provides both developer and user documentation for the `pub-scripts/publisher` script set in the NHSN Measures repository.

## Overview

These scripts automate the IG build, publishing, and post-processing workflow for FHIR Implementation Guides (IGs). The pipeline includes:

- Cloning or checking out a specific repo branch (if provided)
- Generating SUSHI-built JSON and IG artifacts
- Running CQF Tooling (`tooling-cli.jar`) if CQL exists
- Running standard IG Publisher build with `-go-publish`
- Copying generated `ImplementationGuide.json` and related files to `input/data/ig.json`
- Applying post-processing: `web.config` for redirects, 508 accessibility fixes, and NHSN-MS hover metadata
- Robust execution tracking: Every major step logs commands and outputs locally to both console and `publish.log`.

## Location

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

## Usage (user)

### Primary publish command

From repo root (or `pub-scripts` parent):

```bash
python pub-scripts/go-publisher.py <repo-url> <output_folder> -b <branch> -r -a -v
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

## Function matrix (developer)

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

## Implementation details / hints

- For relative imports, ensure `pub-scripts` or `publisher` is a Python package with `__init__.py` and run with `python -m publisher.fix_accessibilities` from package root.
- IG Publisher steps depend on `JAVA_HOME` and correct jar artifacts in working directory.

## Troubleshooting

- `attempted relative import with no known parent package`: run as package with `python -m publisher.builder` or adjust imports to absolute paths.
- Encoding glitches in HTML: prefer `tree.write(file_path, encoding='utf-8', method='html')` and avoid `decode('utf-8')` from bytes.
- `ElementTree not initialized` in XPath: ensure using `root = tree.getroot()` and fallback to `root = html.fromstring(raw_bytes)` if None.
