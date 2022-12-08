@ECHO OFF
SET tooling_jar=tooling-1.4.0-jar-with-dependencies.jar
SET input_cache_path=%~dp0input-cache
SET mat_bundle=bundles\mat\TestingAgain-v0-0-004-FHIR-4-0-1\TestAgain-v0-0-004-FHIR-4-0-1.json

SET JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

IF EXIST "%input_cache_path%\%tooling_jar%" (
	ECHO running: JAVA -jar "%input_cache_path%\%tooling_jar%" -ExtractMatBundle %mat_bundle%
	JAVA -jar "%input_cache_path%\%tooling_jar%" -ExtractMatBundle %mat_bundle%
) ELSE If exist "..\%tooling_jar%" (
	ECHO running: JAVA -jar "..\%tooling_jar%" -ExtractMatBundle %mat_bundle%
	JAVA -jar "..\%tooling_jar%" -ExtractMatBundle %mat_bundle%
) ELSE (
	ECHO Tooling JAR NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
)

PAUSE
