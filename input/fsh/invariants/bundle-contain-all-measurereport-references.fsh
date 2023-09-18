Invariant: bundle-contain-all-measurereport-references
Description: "MeasureReport Bundle: must contain all Resources that are references by MeasureReport references"
Severity: #error
Expression: "Bundle.entry.resource.where($this.is(MeasureReport)).descendants().reference.where($this.startsWith('#').not()).all((%resource.entry.fullUrl.join('|')&'|').contains(($this&'|')))"