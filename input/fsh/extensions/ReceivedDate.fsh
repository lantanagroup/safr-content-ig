Extension: ReceivedDate
Id: link-received-date-extension
Title: "Received Date"
Description: "This extension stores the date and time a Resource was received by the processing system (e.g. NHSNLink)."
* ^version = "2.0.0"
* ^date = "2023-05-23T16:49:19-07:00"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^context.type = #element
* ^context.expression = "Resource.meta"
* . ^short = "Received Date"
  * ^definition = "This extension stores the date and time a Resource was received by the processing system (e.g. NHSNLink)."
* value[x] 1..
* value[x] only dateTime