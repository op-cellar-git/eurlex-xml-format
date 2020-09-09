
# XSDs and XSLTs for new Eurlex serialization

 - Object notice In this kind of notice, there is either 1 WORK, either
   1 EXPRESSION, either 1 MANIFESTATION, or 1 ITEM
  
  - Branch notice In this kind of notice, there are: 1 WORK, 1 EXPRESSION
   (display), 0 or more EXPRESSIONs (non-display), 0 or more
   MANIFESTATIONs, 0 or more ITEMs
   
   - Tree notice In this kind of notice, there are: 1 WORK, 1 or more
   EXPRESSIONs, 0 or more MANIFESTATIONs, 0 or more ITEMs
   
   - Indexation notice In this kind of notice, there are: 1 WORK, 0 or
   more EXPRESSIONs, 0 or more MANIFESTATIONs, 0 or more ITEMs
   
Combinations that can occur for DOSSIERs and EVENTs:
- tree notice of Dossier (one dossier, multiple events)
- object notice of either one Dossier or one Event
- indexing notice Dossier (one dossier all event) or Event (one event and its dossier)

| notice | XSDs | XSLT to apply before valdating |
|--|--|--|
| index | common.xsd + index.xsd | notice_to_schema_template.xslt
| branch | common.xsd + branch.xsd | notice_to_schema_template.xslt
| tree | common.xsd + tree.xsd | notice_to_schema_template.xslt
| object | common.xsd + object.xsd | notice_to_schema_template.xslt

