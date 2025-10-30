Invariant: bundle-contain-all-references
Description: "All referenced resources SHALL be contained within the Bundle."
Expression: "Bundle.entry.resource.descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"
Severity: #error