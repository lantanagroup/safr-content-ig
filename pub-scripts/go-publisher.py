"""CLI entrypoint kept for backward compatibility.

This script delegates to the modular `publisher` package.
The `publisher` package provides a modular refactor of the legacy `go-publisher.py` script. Import `main` from `publisher.cli` to run the command-line workflow.

The `publisher` package is organized into several modules:
- `cli.py`: Contains the main command-line interface logic, including argument parsing and workflow orchestration.
- `builder.py`: Contains functions related to building the IG using the publisher and CQF tooling.
- `gitops.py`: Contains helper functions for cloning the IG repository and related repositories.
- `postprocess.py`: Contains functions for post-processing the generated output, such as reducing file size, fixing accessibility issues, and writing web.config files.
- `config.py`: Contains configuration constants and helper functions for loading configuration from the IG repository.
The `main()` function in `cli.py` orchestrates the overall workflow, including cloning the repository, initializing the output folder, running the build, and performing post-processing steps based on command-line arguments.

Parameters:
- `ig_repo`: Path to the FHIR IG repository (positional argument).
- `output_path`: Path to the output folder where the generated IG will be placed (positional argument).
- `--branch`: Optional argument to specify the branch of the repository to clone.
- `--pauses`: Optional flag to enable pauses (wait for key press) between steps.
- `--reduce`: Optional flag to enable reduction of output size by removing unneeded files.
- `--access`: Optional flag to enable modifications for Section 508 accessibility compliance.
Usage:
- Run the script with the required positional arguments for the IG repository and output path, and include any optional flags as needed. For example:
```python go-publisher.py path/to/ig-repo path/to/output --branch main --reduce --access```

Example:
```python go_publisher.py https://github.com/lantanagroup/nhsn-measures publish -b development -r -a```

This will clone the specified IG repository, build it using the publisher, and then perform post-processing steps to reduce file size and fix accessibility issues in the generated output.

The following files, in the root repository folder, need to be modified to publish a specific version of the IG:
- sushi-config.yaml (to set the version in the generated IG)
- publication-registry.json (to add an entry for the new version in the registry)
- package.json (to set the version of the publisher package)
- package-lock.json (to set the version of the publisher package)


TODO Pauses seems to have been dropped during refactoring, need to add back in if we want to keep that functionality. Could be added as a simple `input("Press Enter to continue...")` after each major step in the workflow if the `--pauses` flag is set.
"""

from publisher.cli import main


if __name__ == '__main__':
    main()
