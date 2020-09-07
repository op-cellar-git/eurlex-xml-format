<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
  
	<xsl:template match="*/*[@type ='date']">
		<p_name_date>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_date>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='link']">
		<p_name_rel>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_rel>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='data']">
		<p_name_literal>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_literal>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='annotation']">
		<annotation_property>
			<xsl:apply-templates select="@*|node()"/>
		</annotation_property>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='concept']">
		<p_name_concept>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_concept>
	</xsl:template>

	<xsl:template match="*/*[@type ='concept_hierarchy']">
		<p_name_concept_hierarchy>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_concept_hierarchy>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='concept_hierarchy_concept']">
		<p_name_concept_hierarchy_concept>
			<xsl:apply-templates select="@*|node()"/>
		</p_name_concept_hierarchy_concept>
	</xsl:template>
	
	<xsl:template match="*/*[@type ='memberlist']">
		<p_name.MEMBERLIST>
			<xsl:apply-templates select="@*|node()"/>
		</p_name.MEMBERLIST>
	</xsl:template>
	
</xsl:stylesheet>
