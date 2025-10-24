
Invariant: not-done-extension-present
Description: "qicore-notDoneValueSet extension does not exist"
Severity: #error
Expression: "extension.where(url='http://hl7.org/fhir/us/qicore/StructureDefinition/qicore-notDoneValueSet').exists().not()"