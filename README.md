# NHSN Measures
#### Builder 
[![Build status](https://dev.azure.com/lantanagroup/nhsnlink/_apis/build/status/Measure%20Dev/NHSN%20Measures%20Builder)](https://dev.azure.com/lantanagroup/nhsnlink/_build/latest?definitionId=122)
#### Continuous Integration
[![Build status](https://dev.azure.com/lantanagroup/nhsnlink/_apis/build/status/Measure%20Dev/Measures%20-%20CI)](https://dev.azure.com/lantanagroup/nhsnlink/_build/latest?definitionId=71)

### Updates
Updates needed to reflect new publisher & tooling files

- Dockerfile
-- Updated base image and location
-- Output artifacts for DevOps publishing (directories: output/ input-cache/ bundles/)
-- Added `_refresh.sh` to execute within build
- _updateCQFTooling.sh
-- Line 24 to 3.1.0
-- Line 31 to include the variables for jar file name (reflecting 3.1.0 release)
- _refresh.sh
-- including `sed` function to remove the text `-bundle` from all files in bundles/ directory
---
#### Manual Run Process (w/o Docker)
We are running this with Azure DevOps automation and outputing the artifacts from the build for each of the steps. This process runs directly on Ubuntu and each step just runs `bash`

Build Steps:
1. Update Publisher
a. Bash inline to run the update for publsiher
2. Update CQF Tooling
a. Bash inline to run the update for tooling
3. Sushi
a. Bash run sushi in the working directory
4. GenOnce
a. Bash run `_genonce.sh -no-shushi`
5. Refresh
a. Added functionality to the bottom of the script to remove `-bundle` text from any `*-bundle.json` file in the `bundle/` directory

---
#### Sushi Documenation:
-https://fshschool.org/docs/sushi/running/#running-the-ig-publisher
