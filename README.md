# Schemas for the new Eurlex serialization
In this repository, there are all the artifacts for specifying and validating the new notices of Eurlex.
## notices

 - Object notice In this kind of notice, there is either 1 WORK, either
   1 EXPRESSION, either 1 MANIFESTATION, or 1 ITEM
  
  - Branch notice In this kind of notice, there are: 1 WORK, 1 EXPRESSION
   (display), 0 or more EXPRESSIONs (non-display), 0 or more
   MANIFESTATIONs, 0 or more ITEMs
   
   - Tree notice In this kind of notice, there are: 1 WORK, 1 or more
   EXPRESSIONs, 0 or more MANIFESTATIONs, 0 or more ITEMs
   
   - Index notice In this kind of notice, there are: 1 WORK, 0 or
   more EXPRESSIONs, 0 or more MANIFESTATIONs, 0 or more ITEMs
   
Combinations that can occur for DOSSIERs and EVENTs:
- tree notice of Dossier (one dossier, multiple events)
- object notice of either one Dossier or one Event
- index notice Dossier (one dossier all event) or Event (one event and its dossier)
## validation
In order to validate properly the notices we have to perform thi: XSLT trasformation https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/xslt/notice_to_schema_template.xslt and then the XSD validation using the right schema. Each schema depends on common.xsd that is a collection of elements.
| notice | XSDs | XSLT to apply before valdating |
|--|--|--|
| index | common.xsd + index.xsd | notice_to_schema_template.xslt
| branch | common.xsd + branch.xsd | notice_to_schema_template.xslt
| tree | common.xsd + tree.xsd | notice_to_schema_template.xslt
| object | common.xsd + object.xsd | notice_to_schema_template.xslt
## xproc
An XProc procedure is available to facilitate the validation of a notice. The notice must call "notice.xml" and must be in the same directory of "proc.xpl". This procedure:
 - applies the XSLT transformation   
 - detects automatically the type of notice
 - performs the XSD validation


 


