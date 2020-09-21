
# XPROC 

To enable the validation we have to perform a waterfall of different operations:

 1. XSLT transformations
 2. Selecting the right XMLS for a given notice
 3. performing the XSD validation

The XPROC procedure in the current directory is useful in order to automate the entire process. The only requirement is downloading Calabash XML from [here](https://github.com/ndw/xmlcalabash1/releases/download/1.2.1-99/xmlcalabash-1.2.1-99.zip).
Calabash XML is the interpreter of XPROC compatible withe the W3C Recommendation.

## how to execute the XPROC procedure

 - Place our [proc.xpl](https://github.com/op-cellar-git/eurlex-xml-format/blob/master/new/xproc/proc.xpl) file at the following directory in Calabash XML: `xmlcalabash-1.2.1-99\xpl`
 - Place the notice to validate at the following directory in Calabash XML: `xmlcalabash-1.2.1-99\xpl`
 - Rename the notice in: `notice.xml`
 - Execute the following cmd in the directory `xmlcalabash-1.2.1-99`:  
 > *java -cp "xmlcalabash-1.2.1-99.jar" com.xmlcalabash.drivers.Main -a xpl/proc.xpl*
 - in case the procedure does not meet any error it produces a file `xpl/validated-notice.xml`. This file is the translation of the `xpl/notice.xml` to the "template model" suitable for validating with the schemes defined [here](https://github.com/op-cellar-git/eurlex-xml-format/tree/master/new)
 - otherwise Calabash XML lists the errors encountered
