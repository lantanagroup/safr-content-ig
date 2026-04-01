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

## Location

Script folder: `pub-scripts`

Primary scripts:
- `extract_cql_versions.sh` (shell helper to extract CQL versions from package or bundle)
- `PIpeline_doc.md` (pipeline documentation for CI/CD / publish flow in Lantana Azure - as of 3/31/2026)
- `go-publisher.py` (CLI entrypoint for full publish)
- `publisher/builder.py` (build step orchestration, run sushi + tools + publisher)
- `publisher/fix_accessibilities.py` (post-processing for accessibility style and NHSN-MS hover info)
- `publisher/config.py`* (configuration helper for environment and webroot setup)
- `publisher/downloader.py`* (download external tooling metadata/URLs)

* not shown here but part of the `pub-scripts/publisher` module dependency chain.
## Usage (user)

### Primary publish command

From repo root (or `pub-scripts` parent):

```bash
python pub-scripts/go-publisher.py <repo-url> <output_folder> -b <branch> -r -a
```

Arguments:
- `<repo-url>`: GitHub repo to clone or use
- `output_folder`: Publication output folder (must not exist)
- `-b <branch>`: branch to publish (optional; default may be `main`/`development`)
- `-r`: clean rebuild option (pre-run refresh)
- `-a`: run additional post-processing steps



Note: `fix_accessibilities.py` adds a meta tag to processed files:
- `<meta name="data-accessibility-fixed" content="2026-04-01T12:34:56.xxx" />`
- If a file already contains `meta[name='data-accessibility-fixed']`, it is skipped to prevent double-processing.

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
  - `java -Dfile.encoding=UTF-8 -jar publisher.jar -go-publish -source ... -web ... -registry ... -history ... -templates ...`
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
  - Parses HTML with `lxml` as UTF-8,
  - updates style attributes for opacity and colors,
  - updates differential table font weights, and
  - flags Must Support elements for NHSN-MS (optional by flag)
  - Adds `meta[name="data-accessibility-fixed"]` with a datetime value so repeated execution skips already-processed pages
  - Write back as UTF-8 HTML
- `replace_style(element, property_name, new_value, old_value=None, replace_only_if_exists=True)`
  - patch existing style string with property lookup/replacement
- `fix_zip_file_accessibilities(zip_path)`
  - extract ZIP to temp
  - run `fix_accessibilities_in_folder` on extracted content
  - rebuild ZIP

## Implementation details / hints

- For relative imports, ensure `pub-scripts` or `publisher` is a Python package with `__init__.py` and run with `python -m publisher.fix_accessibilities` from package root.
- IG Publisher steps depend on `JAVA_HOME` and correct jar artifacts in working directory.

## Troubleshooting

- `attempted relative import with no known parent package`: run as package with `python -m publisher.builder` or adjust imports to absolute paths.
- Encoding glitches in HTML: prefer `tree.write(file_path, encoding='utf-8', method='html')` and avoid `decode('utf-8')` from bytes.
- `ElementTree not initialized` in XPath: ensure using `root = tree.getroot()` and fallback to `root = html.fromstring(raw_bytes)` if None.

---

### Notes

This document should be reviewed for line-level behavior changes in all associated scripts as the project evolves. Include additional function docs in each module if you add/modify pipeline steps.