#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-cli-2.5.0-SNAPSHOT.jar
input_cache_path=./input-cache
resources_path=$PWD/input/resources
ig_resource_path=./input/anc-cds.xml

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption=""
#"-fs http://cds-sandbox.alphora.com/cqf-ruler-r4/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	java -jar $tooling -RefreshIG -root-dir="$PWD" -ip="$ig_resource_path" -t -d -p $fsoption
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		java -jar $tooling -RefreshIG -root-dir="$PWD" -ip="$ig_resource_path" -t -d -p $fsoption
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi

#sh input/pagecontent/quick-start-bundles/_refreshQuickStart.sh
