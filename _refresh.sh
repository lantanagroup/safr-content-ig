#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-3.6.0.jar
input_cache_path=./input-cache
resources_path=$PWD/input/resources
ig_ini_path=ig.ini

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	java -jar $tooling -RefreshIG -root-dir="$PWD" -ini="$ig_ini_path" -t -d -ss=false -timestamp=true
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -RefreshIG -root-dir="$PWD" -ini="$ig_ini_path" -t -d -ss=false -timestamp=true
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi

#sh input/pagecontent/quick-start-bundles/_refreshQuickStart.sh

# Must be run in main directory!
find bundles/ -type f -name "*-bundle.json" -exec sed -i -e "s/-bundle//g" {} \;
