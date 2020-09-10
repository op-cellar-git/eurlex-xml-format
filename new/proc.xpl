<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
  
  <p:input port="source">
    <p:document href="./source.xml"/>
  </p:input>
  
  
  <p:xslt name="trasforma">
    <p:input port="stylesheet">
      <p:document href="https://raw.githubusercontent.com/op-cellar-git/eurlex-xml-format/master/xslt/notice_to_schema_template.xslt"/>
    </p:input>
    <p:input port="parameters">
      <p:empty/>
    </p:input>
  </p:xslt>

  <p:validate-with-xml-schema name="valida">
    <p:input port="schema">
      <p:document href="./branch.xsd"/>
    </p:input>
  </p:validate-with-xml-schema>
  
  <p:store href="./reportl.xml"/>
  
</p:declare-step>
