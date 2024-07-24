# NHSN Measures
#### Builder 
[![Build status](https://dev.azure.com/lantanagroup/nhsnlink/_apis/build/status/Measure%20Dev/NHSN%20Measures%20Builder)](https://dev.azure.com/lantanagroup/nhsnlink/_build/latest?definitionId=122)
#### Continuous Integration
[![Build status](https://dev.azure.com/lantanagroup/nhsnlink/_apis/build/status/Measure%20Dev/Measures%20-%20CI)](https://dev.azure.com/lantanagroup/nhsnlink/_build/latest?definitionId=71)

## Updates
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
