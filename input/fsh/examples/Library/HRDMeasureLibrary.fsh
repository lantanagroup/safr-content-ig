Instance: HRDMeasureLibrary
InstanceOf: CRMIComputableLibrary|1.0.0
Title: "Library - HRD Measure Example"
Description: "This library contains CQL logic for evaluating structural measures related to hospital respiratory disease reporting capabilities"
Usage: #example
* url = "http://hl7.org/fhir/us-safr/Library/HRDMeasureLibrary"
* version = "1.0.0"
* name = "HRDMeasureLibrary"
* title = "Library - HRD Measure Example"
* status = #active
* experimental = false
* type = $library-type#logic-library
* date = "2025-03-13"
* publisher = "Example Healthcare Organization"
* description = "This library contains CQL logic for evaluating structural measures related to hospital respiratory disease reporting capabilities"
* useContext.code = $usage-context-type#focus
* useContext.valueCodeableConcept = $sct#64572001 "Disease"
* jurisdiction = urn:iso:std:iso:3166#US
* content.contentType = #text/cql
* content.data = "bGlicmFyeSBIUkRNZWFzdXJlU3RydWN0dXJlTGlicmFyeSB2ZXJzaW9uICcxLjAuMCcKCnVzaW5nIEZISVIgdmVyc2lvbiAnNC4wLjEnCgppbmNsdWRlIEZISVJIZWxwZXJzIHZlcnNpb24gJzQuMC4xJyBjYWxsZWQgRkhJUkhlbHBlcnMKCi8vIFRlcm1pbm9sb2d5IGRlZmluaXRpb25zCmNvZGVzeXN0ZW0gIkxPSU5DIjogJ2h0dHA6Ly9sb2luYy5vcmcnCmNvZGVzeXN0ZW0gIlNOT01FRCBDVCI6ICdodHRwOi8vc25vbWVkLmluZm8vc2N0Jgpjb2Rlc3lzdGVtICJJQ0QtMTAtQ00iOiAnaHR0cDovL2hsNy5vcmcvZmhpci9zaWQvaWNkLTEwLWNtJwoKLy8gVmFsdWUgc2V0cwp2YWx1ZXNldCAiUmVzcGlyYXRvcnkgU3BlY2ltZW4gQ29sbGVjdGlvbiBEZXZpY2VzIjogJ2h0dHA6Ly9jdHMubmxtLm5paC5nb3YvZmhpci9WYWx1ZVNldC8yLjE2Ljg0MC4xLjExMzc2Mi4xLjQuMTE0Ni4xMTI1Jwp2YWx1ZXNldCAiQ09WSUQtMTkgVGVzdHMiOiAnaHR0cDovL2N0cy5ubG0ubmloLmdvdi9maGlyL1ZhbHVlU2V0LzIuMTYuODQwLjEuMTEzNzYyLjEuNC4xMTQ2LjExMjMnCnZhbHVlc2V0ICJJbmZsdWVuemEgVGVzdHMiOiAnaHR0cDovL2N0cy5ubG0ubmloLmdvdi9maGlyL1ZhbHVlU2V0LzIuMTYuODQwLjEuMTEzODgzLjMuNDY0LjEwMDMuMTAyLjEyLjEwMTInCnZhbHVlc2V0ICJSU1YgVGVzdHMiOiAnaHR0cDovL2N0cy5ubG0ubmloLmdvdi9maGlyL1ZhbHVlU2V0LzIuMTYuODQwLjEuMTEzNzYyLjEuNC4xMTQ2LjExMjQnCnZhbHVlc2V0ICJJQ1UgTG9jYXRpb24gVHlwZXMiOiAnaHR0cDovL2N0cy5ubG0ubmloLmdvdi9maGlyL1ZhbHVlU2V0LzIuMTYuODQwLjEuMTEzODgzLjMuMTE3LjEuNy4xLjg3Jwp2YWx1ZXNldCAiVmVudGlsYXRvciBEZXZpY2UgVHlwZXMiOiAnaHR0cDovL2N0cy5ubG0ubmloLmdvdi9maGlyL1ZhbHVlU2V0LzIuMTYuODQwLjEuMTEzODgzLjMuNS4xMDAxJwoKLy8gUGFyYW1ldGVyIGZvciBtZWFzdXJlbWVudCBwZXJpb2QKcGFyYW1ldGVyICJNZWFzdXJlbWVudCBQZXJpb2QiIEludGVydmFsPERhdGU+CiAgZGVmYXVsdCBJbnRlcnZhbFtAMjAyNS0wMy0wMSwgQDIwMjUtMDMtMDddCgpjb250ZXh0IFBhdGllbnQKCi8vIFNUUlVDVFVSRSBNRUFTVVJFIENPTVBPTkVOVFMKLy8gRm9yIGEgc3RydWN0dXJlIG1lYXN1cmUsIHdlIGFzc2VzcyBjYXBhYmlsaXRpZXMsIHJlc291cmNlcyBhbmQgb3JnYW5pemF0aW9uYWwgc3RydWN0dXJlcwoKLy8gMS4gVGVzdCBmb3IgdGhlIHByZXNlbmNlIG9mIHJlc3BpcmF0b3J5IHRlc3RpbmcgY2FwYWJpbGl0aWVzCmRlZmluZSAiSGFzIENPVklELTE5IFRlc3RpbmcgQ2FwYWJpbGl0eSI6CiAgZXhpc3RzICgKICAgIFtEZXZpY2VdIERldmljZQogICAgICB3aGVyZSBEZXZpY2UudHlwZS5jb2RpbmcgaW4gIkNPVklELTE5IFRlc3RzIgogICAgICAgIGFuZCBEZXZpY2Uuc3RhdHVzID0gJ2FjdGl2ZScKICApCgpkZWZpbmUgIkhhcyBJbmZsdWVuemEgVGVzdGluZyBDYXBhYmlsaXR5IjoKICBleGlzdHMgKAogICAgW0RldmljZV0gRGV2aWNlCiAgICAgIHdoZXJlIERldmljZS50eXBlLmNvZGluZyBpbiAiSW5mbHVlbnphIFRlc3RzIgogICAgICAgIGFuZCBEZXZpY2Uuc3RhdHVzID0gJ2FjdGl2ZScKICApCgpkZWZpbmUgIkhhcyBSU1YgVGVzdGluZyBDYXBhYmlsaXR5IjoKICBleGlzdHMgKAogICAgW0RldmljZV0gRGV2aWNlCiAgICAgIHdoZXJlIERldmljZS50eXBlLmNvZGluZyBpbiAiUlNWIFRlc3RzIgogICAgICAgIGFuZCBEZXZpY2Uuc3RhdHVzID0gJ2FjdGl2ZScKICApCgpkZWZpbmUgIkhhcyBTcGVjaW1lbiBDb2xsZWN0aW9uIENhcGFiaWxpdGllcyI6CiAgZXhpc3RzICgKICAgIFtEZXZpY2VdIERldmljZQogICAgICB3aGVyZSBEZXZpY2UudHlwZS5jb2RpbmcgaW4gIlJlc3BpcmF0b3J5IFNwZWNpbWVuIENvbGxlY3Rpb24gRGV2aWNlcyIKICAgICAgICBhbmQgRGV2aWNlLnN0YXR1cyA9ICdhY3RpdmUnCiAgKQoKZGVmaW5lICJIYXMgSUNVIExvY2F0aW9ucyI6CiAgZXhpc3RzICgKICAgIFtMb2NhdGlvbl0gTG9jYXRpb24KICAgICAgd2hlcmUgTG9jYXRpb24udHlwZS5jb2RpbmcgaW4gIklDVSBMb2NhdGlvbiBUeXBlcyIKICAgICAgICBhbmQgTG9jYXRpb24uc3RhdHVzID0gJ2FjdGl2ZScKICApCgpkZWZpbmUgIkhhcyBWZW50aWxhdG9yIFJlc291cmNlcyI6CiAgZXhpc3RzICgKICAgIFtEZXZpY2VdIERldmljZQogICAgICB3aGVyZSBEZXZpY2UudHlwZS5jb2RpbmcgaW4gIlZlbnRpbGF0b3IgRGV2aWNlIFR5cGVzIgogICAgICAgIGFuZCBEZXZpY2Uuc3RhdHVzID0gJ2FjdGl2ZScKICApCgpkZWZpbmUgIkhhcyBIUkQgUmVwb3J0aW5nIFByb3RvY29sIjoKICBleGlzdHMgKAogICAgW0RvY3VtZW50UmVmZXJlbmNlXSBECiAgICAgIHdoZXJlIEQudHlwZS5jb2RpbmcuY29kZSBpbiB7JzExNTE2LTInfSAvLyBMT0lOQyBmb3IgaW5mZWN0aW9uIGNvbnRyb2wgcHJvdG9jb2wKICAgICAgICBhbmQgRC5zdGF0dXMgPSAnY3VycmVudCcKICAgICAgICBhbmQgRC5kZXNjcmlwdGlvbiBjb250YWlucyAnTkhTTicKICAgICAgICBhbmQgRC5kZXNjcmlwdGlvbiBjb250YWlucyAnSFJEJwogICkKCi8vIENPTlRJTlVPVVMgVkFSSUFCTEUgQ0FMQ1VMQVRJT05TCgovLyBIb3NwaXRhbCBjYXBhY2l0eSBtZXRyaWNzCmRlZmluZSAiVG90YWwgQmVkIENhcGFjaXR5IjoKICBTdW0oCiAgICBbTG9jYXRpb25dIExvY2F0aW9uCiAgICAgIHdoZXJlIExvY2F0aW9uLnN0YXR1cyA9ICdhY3RpdmUnCiAgICAgICAgYW5kIExvY2F0aW9uLnBoeXNpY2FsVHlwZS5jb2RpbmcuY29kZSA9ICdiZCcKICAgICAgcmV0dXJuICgKICAgICAgICBMb2NhdGlvbi5leHRlbnNpb24gRQogICAgICAgICAgd2hlcmUgRS51cmwgPSAnaHR0cDovL2hsNy5vcmcvZmhpci9TdHJ1Y3R1cmVEZWZpbml0aW9uL2xvY2F0aW9uLWJlZC1jb3VudCcKICAgICAgICAgIHJldHVybiBFLnZhbHVlSW50ZWdlcgogICAgICApLnZhbHVlSW50ZWdlcgogICkKCmRlZmluZSAiSUNVIEJlZCBDYXBhY2l0eSI6CiAgU3VtKAogICAgW0xvY2F0aW9uXSBMb2NhdGlvbgogICAgICB3aGVyZSBMb2NhdGlvbi5zdGF0dXMgPSAnYWN0aXZlJwogICAgICAgIGFuZCBMb2NhdGlvbi50eXBlLmNvZGluZyBpbiAiSUNVIExvY2F0aW9uIFR5cGVzIgogICAgICAgIGFuZCBMb2NhdGlvbi5waHlzaWNhbFR5cGUuY29kaW5nLmNvZGUgPSAnYmQnCiAgICAgIHJldHVybiAoCiAgICAgICAgTG9jYXRpb24uZXh0ZW5zaW9uIEUKICAgICAgICAgIHdoZXJlIEUudXJsID0gJ2h0dHA6Ly9obDcub3JnL2ZoaXIvU3RydWN0dXJlRGVmaW5pdGlvbi9sb2NhdGlvbi1iZWQtY291bnQnCiAgICAgICAgICByZXR1cm4gRS52YWx1ZUludGVnZXIKICAgICAgKS52YWx1ZUludGVnZXIKICApCgpkZWZpbmUgIlZlbnRpbGF0b3IgQ291bnQiOgogIENvdW50KAogICAgW0RldmljZV0gRGV2aWNlCiAgICAgIHdoZXJlIERldmljZS50eXBlLmNvZGluZyBpbiAiVmVudGlsYXRvciBEZXZpY2UgVHlwZXMiCiAgICAgICAgYW5kIERldmljZS5zdGF0dXMgPSAnYWN0aXZlJwogICkKCi8vIFdlZWtseSByZXBvcnRpbmcgY29tcGxpYW5jZSBhbmQgbWV0cmljcwpkZWZpbmUgIlJlcG9ydGluZyBXZWVrcyBpbiBNZWFzdXJlbWVudCBQZXJpb2QiOgogIENvdW50KAogICAgZXhwYW5kezIwMjUtMDMtMDEsIEAyMDI1LTAzLTA3LCB3ZWVrfQogICkKCmRlZmluZSAiSFJEIFJlcG9ydHMgU3VibWl0dGVkIER1cmluZyBQZXJpb2QiOgogIENvdW50KAogICAgW0NvbW11bmljYXRpb25dIEMKICAgICAgd2hlcmUgQy5jYXRlZ29yeS5jb2RpbmcuY29kZSBpbiB7J25vdGlmaWNhdGlvbid9CiAgICAgICAgYW5kIEMudG9waWMudGV4dCBjb250YWlucyAnTkhTTicKICAgICAgICBhbmQgQy50b3BpYy50ZXh0IGNvbnRhaW5zICdIUkQnCiAgICAgICAgYW5kIEMuc2VudCBkdXJpbmcgIk1lYXN1cmVtZW50IFBlcmlvZCIKICApCgpkZWZpbmUgIldlZWtseSBSZXBvcnRpbmcgQ29tcGxpYW5jZSI6CiAgIkhSRCBSZXBvcnRzIFN1Ym1pdHRlZCBEdXJpbmcgUGVyaW9kIiAvICJSZXBvcnRpbmcgV2Vla3MgaW4gTWVhc3VyZW1lbnQgUGVyaW9kIgoKLy8gU3RydWN0dXJhbCByZWFkaW5lc3Mgc2NvcmVzCmRlZmluZSAiSGFzIEFsbCBUZXN0aW5nIENhcGFiaWxpdGllcyI6CiAgaWYgKCJIYXMgQ09WSUQtMTkgVGVzdGluZyBDYXBhYmlsaXR5IiBhbmQgIkhhcyBJbmZsdWVuemEgVGVzdGluZyBDYXBhYmlsaXR5IiBhbmQgIkhhcyBSU1YgVGVzdGluZyBDYXBhYmlsaXR5IikKICAgIHRoZW4gMQogICAgZWxzZSAwCgpkZWZpbmUgIkhhcyBSZXF1aXJlZCBSZXBvcnRpbmcgU3RydWN0dXJlIjoKICBpZiAoIkhhcyBIUkQgUmVwb3J0aW5nIFByb3RvY29sIikgCiAgICB0aGVuIDEKICAgIGVsc2UgMAoKLy8gQ29udGludW91cyB2YXJpYWJsZSBmb3Igc3RydWN0dXJhbCBtZWFzdXJlIGFzc2Vzc21lbnQKZGVmaW5lICJTdHJ1Y3R1cmFsIFJlYWRpbmVzcyBTY29yZSI6CiAgKCJIYXMgQ09WSUQtMTkgVGVzdGluZyBDYXBhYmlsaXR5IiBhcyBJbnRlZ2VyICsKICAgIkhhcyBJbmZsdWVuemEgVGVzdGluZyBDYXBhYmlsaXR5IiBhcyBJbnRlZ2VyICsKICAgIkhhcyBSU1YgVGVzdGluZyBDYXBhYmlsaXR5IiBhcyBJbnRlZ2VyICsKICAgIkhhcyBTcGVjaW1lbiBDb2xsZWN0aW9uIENhcGFiaWxpdGllcyIgYXMgSW50ZWdlciArCiAgICJIYXMgSUNVIExvY2F0aW9ucyIgYXMgSW50ZWdlciArCiAgICJIYXMgVmVudGlsYXRvciBSZXNvdXJjZXMiIGFzIEludGVnZXIgKwogICAgIkhhcyBIUkQgUmVwb3J0aW5nIFByb3RvY29sIiBhcyBJbnRlZ2VyKSAvIDcuMCAqIDEwMC4wCgovLyBNYWluIG1lYXN1cmUgY2FsY3VsYXRpb24gLSBub3cgZm9jdXNpbmcgb24gc3RydWN0dXJhbCBjb21wb25lbnRzIGFuZCB0aGVpciByYXRpbmdzCmRlZmluZSAiTWVhc3VyZSBQb3B1bGF0aW9uIjoKICB0cnVlCgpkZWZpbmUgIk1lYXN1cmUgT2JzZXJ2YXRpb24iOgogICJTdHJ1Y3R1cmFsIFJlYWRpbmVzcyBTY29yZSI="
* dataRequirement[0].type = #Device
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Device"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1123"
* dataRequirement[+].type = #Device
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Device"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1012"
* dataRequirement[+].type = #Device
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Device"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124|20240123"
* dataRequirement[+].type = #Device
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Device"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1125"
* dataRequirement[+].type = #Device
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Device"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.5.1001"
* dataRequirement[+].type = #Location
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Location"
* dataRequirement[=].codeFilter.path = "type"
* dataRequirement[=].codeFilter.valueSet = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87"
* dataRequirement[+].type = #Location
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Location"
* dataRequirement[=].codeFilter.path = "physicalType.coding.code"
* dataRequirement[=].codeFilter.code = $location-physical-type#bd
* dataRequirement[+].type = #DocumentReference
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/DocumentReference"
* dataRequirement[=].codeFilter.path = "type.coding.code"
* dataRequirement[=].codeFilter.code = $loinc#11516-2
* dataRequirement[+].type = #Communication
* dataRequirement[=].profile = "http://hl7.org/fhir/StructureDefinition/Communication"
* dataRequirement[=].codeFilter.path = "category.coding.code"
* dataRequirement[=].codeFilter.code = $communication-category#notification
//* dataRequirement[=].dateFilter.path = "sent"
* dataRequirement[=].dateFilter.searchParam = "date"
//* dataRequirement[=].dateFilter.valuePeriod.extension.url = "http://hl7.org/fhir/StructureDefinition/cqf-measurementPeriod"
//* dataRequirement[=].dateFilter.valuePeriod.extension.valuePeriod.start = "{{%Measurement Period.start%}}"
//* dataRequirement[=].dateFilter.valuePeriod.extension.valuePeriod.end = "{{%Measurement Period.end%}}"
* parameter.name = #"Measurement Period"
* parameter.use = #in
* parameter.min = 1
* parameter.max = "1"
* parameter.type = #Period
//* parameter.defaultValue.period.start = "2025-03-01"
//* parameter.defaultValue.period.end = "2025-03-07"
* relatedArtifact[0].type = #depends-on
* relatedArtifact[=].display = "FHIR Helpers"
* relatedArtifact[=].resource = "http://fhir.org/guides/cqf/common/Library/FHIRHelpers" //"http://hl7.org/fhir/Library/FHIRHelpers|4.0.1"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "COVID-19 Tests ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1123"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "Influenza Tests ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.464.1003.102.12.1012"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "RSV Tests ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1124|20240123"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "Respiratory Specimen Collection Devices ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1146.1125"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "ICU Location Types ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.87"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "Ventilator Device Types ValueSet"
* relatedArtifact[=].resource = "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.5.1001"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "DocumentReference Type ValueSet"
* relatedArtifact[=].resource = "http://loinc.org|11516-2"
* relatedArtifact[+].type = #depends-on
* relatedArtifact[=].display = "Notification Communication Category"
* relatedArtifact[=].resource = "http://hl7.org/fhir/ValueSet/communication-category" //|notification"