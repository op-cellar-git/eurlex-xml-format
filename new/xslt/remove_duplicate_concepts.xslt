<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math">
	<xsl:output method="xml" indent="yes"/>
	<!-- identity transformation -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<!-- drop duplicate -->
	<xsl:template match="*[@type='concept_hierarchy_path_concept' and ./URI/VALUE = preceding-sibling::*/URI/VALUE]"/>

	<!-- set @leaf correctly -->
	<xsl:template match="*[@type='concept_hierarchy_path_concept' and ./URI/VALUE = following-sibling::*/URI/VALUE]">
		<xsl:element name="{name()}">
			<xsl:attribute name="level" select="@level"/>
			<xsl:attribute name="type" select="@type"/>
			<xsl:attribute name="leaf">true</xsl:attribute>
			<xsl:apply-templates select="node()"/>	
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>
