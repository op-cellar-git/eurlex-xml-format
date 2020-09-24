<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<!--xsl:comment>match="@*|node()</xsl:comment-->
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="WORK">
		<xsl:element name="WORK">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="WORK"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="EXPRESSION[not(@type)]"/>
			<xsl:apply-templates select="WORK_HAS_EXPRESSION[not(@type)]"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="EXPRESSION">
		<xsl:element name="EXPRESSION">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="EXPRESSION"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="MANIFESTATION[not(@type)]"/>
			<xsl:apply-templates select="EXPRESSION_BELONGS_TO_WORK[not(@type)]"/>
			<xsl:apply-templates select="EXPRESSION_MANIFESTED_BY_MANIFESTATION[not(@type)]"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="MANIFESTATION">
		<xsl:element name="MANIFESTATION">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="MANIFESTATION"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="ITEM[not(@type)]"/>
			<xsl:apply-templates select="MANIFESTATION_MANIFESTS_EXPRESSION[not(@type)]"/>
			<xsl:apply-templates select="MANIFESTATION_HAS_ITEM[not(@type)]"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="ITEM">
		<xsl:element name="ITEM">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="ITEM"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="TECHMD[not(@type)]"/>
			<xsl:apply-templates select="ITEM_BELONGS_TO_MANIFESTATION[not(@type)]"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="WORK_HAS_EXPRESSION">
		<xsl:element name="WORK_HAS_EXPRESSION">
			<xsl:comment>match="WORK_HAS_EXPRESSION"</xsl:comment>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='date']">
		<xsl:element name="p_name_date">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='date']"</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='link']">
		<xsl:element name="p_name_rel">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='link']"</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='embedded_link']">
		<xsl:element name="p_name_embedded_rel">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='embedded_link']"</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='data']">
		<xsl:element name="p_name_literal">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='data']"</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='annotation']">
		<xsl:element name="annotation_property">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='annotation']"</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='concept']">
		<xsl:element name="p_name_concept">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='concept']"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="IDENTIFIER"/>
			<xsl:apply-templates select="PREFLABEL"/>
			<xsl:apply-templates select="FALLBACK"/>
			<xsl:apply-templates select="ALTLABEL"/>
			<xsl:apply-templates select="OP-CODE"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='concept_hierarchy']">
		<xsl:element name="p_name_concept_hierarchy">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='concept_hierarchy']"</xsl:comment>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='concept_hierarchy_concept']">
		<xsl:element name="p_name_concept_hierarchy_concept">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='concept_hierarchy_concept']</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="IDENTIFIER"/>
			<xsl:apply-templates select="PREFLABEL"/>
			<xsl:apply-templates select="FALLBACK"/>
			<xsl:apply-templates select="ALTLABEL"/>
			<xsl:apply-templates select="OP-CODE"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='memberlist']">
		<xsl:element name="p_name.MEMBERLIST">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='memberlist']</xsl:comment>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
