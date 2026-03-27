# CI Build process - Proposed #
Proposed as of 3/26/2026

1. Install Kubelogin latest

2. Bash Script - Java setup
```
    GIT_COMMIT=$(git rev-parse --short HEAD)
    echo "GIT_COMMIT: ${GIT_COMMIT}"
    echo "##vso[task.setvariable variable=GIT_COMMIT]${GIT_COMMIT}"
    echo "Setting JAVA_TOOL_OPTIONS='-Xms512m -Xmx6g'"
    echo "##vso[task.setvariable variable=JAVA_TOOL_OPTIONS]-Xms512m -Xmx6g"
    export JAVA_TOOL_OPTIONS="-Xms512m -Xmx6g"
    echo $JAVA_TOOL_OPTIONS
    echo 'Agent Details'
    echo "OS: $AGENT_OS"
    lscpu | egrep 'Model name|CPU\(s\)|Thread|Core'
    nproc
    free -h
    df -h /
```

3. Bash Script - Install Dependencies
```
    sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends ruby-full build-essential zlib1g-dev git python3 bash curl openjdk-17-jdk nodejs npm wget
    npm install -g fsh-sushi

    set -euxo pipefail
    # Set Gem PATH
    echo "##vso[task.prependpath]/home/vsts/.local/share/gem/ruby/3.2.0/bin"
    USER_GEM_HOME="$(gem env user_gemhome)"        # e.g. /home/vsts/.local/share/gem/ruby/3.2.0
    export PATH="$USER_GEM_HOME/bin:$PATH"
    gem install --no-document --user-install bundler jekyll
    jekyll -v
```

4. Bash Script - Update PATH
```
    echo "Path: $PATH"
    export PATH=$PATH:/home/vsts/.local/share/gem/ruby/3.2.0/bin
    echo "Path: $PATH"
```

5.  Bash Script - Update Publisher
```
    _updatePublisher.sh --yes
```

6. Bash Script - Update CQF Tooling
```
    _updateCQFTooling.sh --yes
```

7. Bash Script - Sushi (then copy IG file into data for liquid template)
```
    sushi .
    echo "Copying IG Data..."
    cp ./fsh-generated/resources/ImplementationGuide-gov.cdc.nhsn.safr.json ./input/data/ig.json
    ls ./input/data/
```

8. Bash Script - Refresh (build Measures/Libraries with CQF Tooling)
```
    bash _refresh.sh
```

9. Bash Script - GenOnce (run publisher no sushi)
```
    echo "Running _genonce.sh"
    JAVA_TOOL_OPTIONS="-Xms1g -Xmx6g" bash _genonce.sh -no-sushi
```
10. Bash Script - Python install Deps (dependencies for python scripts, Fix Accessibilities for Section 508)
```
    python -m pip install --upgrade pip
    pip install lxml
```

11. Python Run fix_accessibilities.py
```
    ./ci-scripts/fix_accessibilities.py
```

12. Bash Script - Prepare Release Files
```
    mkdir release
    cp output/package.tgz output/gov.cdc.nhsn.safr.r4.tgz
    cp output/gov.cdc.nhsn.safr.r4.tgz release/gov.cdc.nhsn.safr.r4.tgz
    cp output/full-ig.zip release/full-ig.zip
    zip -r release/measure-definitions.zip bundles/measure/*
```

13. Publish Pipeline Artifact (directory path: 'release/'; Artifact name: 'release'; Artifact publish location: 'Azure Pipelines')

14. File Creator
```
    FROM nginx:1.21.6-alpine

    COPY ./output/. /usr/share/nginx/html
    COPY nginx.default.conf /etc/nginx/conf.d/default.conf
```

15. Docker - Build and Push (execute on **/Dockerfile)

16. Kubectl - Deployment