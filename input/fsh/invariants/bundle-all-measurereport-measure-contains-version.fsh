Invariant: bundle-all-measurereport-measure-contains-version
Description: "MeasureReport Bundle: All MeasureReport entry's measure Canonical must contain version"
Severity: #error
Expression: "Bundle.entry.resource.where($this.is(MeasureReport)).all(measure.matches('(\\\\|)..*$'))"