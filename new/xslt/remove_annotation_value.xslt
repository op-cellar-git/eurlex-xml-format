<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math">
	<xsl:output method="xml" indent="yes"/>
	<!-- identity transformation -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="*[./@type='annotation' and ./VALUE]">
		<!-- keep element name -->
		<xsl:element name="{name()}">
			<!-- keep attributes -->
			<xsl:apply-templates select="@*"/>
			<!-- eliminate VALUE element -->
			<xsl:value-of select="./VALUE"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
