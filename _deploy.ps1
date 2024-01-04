$measure=$args[0]
$fileLoc = ("@bundles/measure/" + $measure.toString() + "/" + $measure.toString() + "-bundle.json")
$ehrTest = ("https://ehr-test.nhsnlink.org/fhir/Bundle/" + $measure.toString())

curl.exe -X PUT $ehrTest -H "Content-Type: application/fhir+json" --data-binary $fileLoc

curl.exe -X POST https://cqf-ruler.nhsnlink.org/fhir/ -H "Content-Type: application/fhir+json" --data-binary $fileLoc

curl.exe -X POST https://cqf-dev.nhsnlink.org/fhir/ -H "Content-Type: application/fhir+json" --data-binary $fileLoc