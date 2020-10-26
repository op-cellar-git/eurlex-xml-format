<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns:array="http://www.w3.org/2005/xpath-functions/array" xmlns:map="http://www.w3.org/2005/xpath-functions/map" xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="array fn map math xhtml xs err" version="3.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<!--xsl:comment>match="@*|node()</xsl:comment-->
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="MANIFESTATION[@manifestation-type]">
		<xsl:element name="MANIFESTATION">
			<xsl:comment>match="MANIFESTATION for attribute review"</xsl:comment>
			<!--  
			<xsl:element name="URI"> 
				<xsl:element name="VALUE">http://publications.europa.eu/resource/cellar/generic_id_manifestation</xsl:element>
				<xsl:element name="IDENTIFIER">generic_id_manifestation</xsl:element>
				<xsl:element name="TYPE">cellar</xsl:element>
			</xsl:element>
			<xsl:element name="SAMEAS"> 
				<xsl:element name="URI"> 
					<xsl:element name="VALUE">http://publications.europa.eu/resource/oj/oj_id_manifestation</xsl:element>
					<xsl:element name="IDENTIFIER">oj_id_manifestation</xsl:element>
					<xsl:element name="TYPE">oj</xsl:element>
				</xsl:element>
			</xsl:element>
            
            
			<xsl:element name="TYPE"> 
				<xsl:attribute name="type">type</xsl:attribute>
				cdm:manifestation
			</xsl:element>
			-->			
			<xsl:element name="MANIFESTATION_TYPE">
			    <xsl:attribute name="type">data</xsl:attribute>
				<xsl:element name="VALUE">
					<xsl:value-of select="@manifestation-type"/>
				</xsl:element>
			</xsl:element>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
		

	</xsl:template>
	
	
	
	
	
</xsl:stylesheet>
