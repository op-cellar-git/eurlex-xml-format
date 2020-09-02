# first draft of the new XSD schemas for Eurlex

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

#### OPEN POINTS
0) the architecture will be:

| XSDs | depends on | depends on |
|--|--|--|
| indexation.xsd | commonConcrete.xsd | commonTemplate.xsd
| branch.xsd | commonConcrete.xsd | commonTemplate.xsd
| tree.xsd | commonConcrete.xsd | commonTemplate.xsd
| object.xsd | commonConcrete.xsd | commonTemplate.xsd

a script will compute the commonConcrete.xsd making use of the current version of the CDM and the commonTemplate.xsd

 - commonTemplate.xsd will be used for the specification 
 - commonConcrete.xsd will be used for the XSD validation
