Invariant: patient-full-name
Description: "name.given and name.family are present in at least one name."
Severity: #error
Expression: "name.where(family.exists() and given.exists()).exists()"