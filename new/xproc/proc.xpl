<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
  
  <p:input port="source">
    <p:document href="./notice.xml"/>
  </p:input>
  
  <p:xslt name="xslt-transformation">
    <p:input port="stylesheet">
      <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/xslt/notice_to_schema_template.xslt"/>
    </p:input>
    <p:input port="parameters">
      <p:empty/>
    </p:input>
  </p:xslt>

  <p:choose name="choose-kind-of-schema">

    <p:when test="/NOTICE[@type='index']">
      <p:validate-with-xml-schema name="xsd-validation">
        <p:input port="schema">
          <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/index.xsd"/>
        </p:input>
      </p:validate-with-xml-schema>
    </p:when>

    <p:when test="/NOTICE[@type='object']">
      <p:validate-with-xml-schema name="xsd-validation">
        <p:input port="schema">
          <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/object.xsd"/>
        </p:input>
      </p:validate-with-xml-schema>
    </p:when>

    <p:when test="/NOTICE[@type='branch']">
      <p:validate-with-xml-schema name="xsd-validation">
        <p:input port="schema">
          <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/branch.xsd"/>
        </p:input>
      </p:validate-with-xml-schema>
    </p:when>
    
    <p:when test="/NOTICE[@type='tree']">
      <p:validate-with-xml-schema name="xsd-validation">
        <p:input port="schema">
          <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/new/tree.xsd"/>
        </p:input>
      </p:validate-with-xml-schema>
    </p:when>
    
    <p:otherwise>
      <p:error name="bad-type-of-notice" code="bad-type-of-notice">
        <p:input port="source">
          <p:inline>
            <message>This notice does not contain the right type value</message>
          </p:inline>
        </p:input>
      </p:error>
    </p:otherwise>
  </p:choose>
  
  <p:store href="./validated-notice.xml"/>
  
</p:declare-step>
