<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math">
	<xsl:output method="xml" indent="yes"/>
	<!-- identity transformation -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="WORK">
		<xsl:element name="WORK">
			<xsl:apply-templates select="@*|node()"/>
			<xsl:apply-templates select="../EXPRESSION" mode="nesting"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="EXPRESSION" mode="nesting">
		<xsl:element name="EXPRESSION">
			<xsl:apply-templates select="@*|node()"/>
			<xsl:apply-templates select="../MANIFESTATION" mode="nesting"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="MANIFESTATION" mode="nesting">
		<xsl:element name="MANIFESTATION">
			<xsl:apply-templates select="@*|node()"/>
		</xsl:element>
	</xsl:template>
		
	<xsl:template match="EXPRESSION"/>
	
	<xsl:template match="MANIFESTATION"/>
	
</xsl:stylesheet>
