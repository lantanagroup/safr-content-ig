Invariant: bundle-no-modifier-extensions
Description: "MeasureReport Bundle:  must not contain any modifierExensions"
Severity: #error
Expression: "(descendants().select(modifierExtension)).exists().not()"