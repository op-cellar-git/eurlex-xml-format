<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<!--xsl:comment>match="@*|node()</xsl:comment-->
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="DOSSIER">
		<xsl:element name="DOSSIER">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="DOSSIER"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="EVENT[not(@type)]"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(@type) and not(local-name()='EVENT' and not(@type))]" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="EVENT">
		<xsl:element name="EVENT">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="EVENT"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- everything except rdf:type -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(@type)]" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="WORK">
		<xsl:element name="WORK">
			<!-- attributes -->
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="WORK"</xsl:comment>
			<!-- cellar id -->
			<xsl:apply-templates select="URI"/>
			<!-- psis -->
			<xsl:apply-templates select="SAMEAS"/>
			<!-- rdf:type -->
			<xsl:apply-templates select="*[@type[.='type']]"/>
			<!-- remaining typed elements  -->
			<xsl:apply-templates select="*[@type[.!='type']]"/>
			<!-- maps in case of tree|branch|index notice -->
			<xsl:apply-templates select="EXPRESSION[not(@type)]"/>
			<!-- maps in case of object notice -->
			<xsl:apply-templates select="WORK_HAS_EXPRESSION[not(@type)]"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(local-name()='EXPRESSION' and not(@type)) and not(local-name()='WORK_HAS_EXPRESSION' and not(@type)) and not(@type)]" mode="non_treated"/>
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
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(@type) and not(local-name()='MANIFESTATION' and not(@type)) and not(local-name()='EXPRESSION_BELONGS_TO_WORK' and not(@type)) and not(local-name()='EXPRESSION_MANIFESTED_BY_MANIFESTATION' and not(@type))]" mode="non_treated"/>
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
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(@type) and not(local-name()='ITEM' and not(@type)) and not(local-name()='MANIFESTATION_MANIFESTS_EXPRESSION' and not(@type)) and not(local-name()='MANIFESTATION_HAS_ITEM' and not(@type))]" mode="non_treated"/>
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
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and not(@type) and not(local-name()='TECHMD' and not(@type)) and not(local-name()='ITEM_BELONGS_TO_MANIFESTATION' and not(@type))]" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="WORK_HAS_EXPRESSION">
		<xsl:element name="WORK_HAS_EXPRESSION">
			<xsl:comment>match="WORK_HAS_EXPRESSION"</xsl:comment>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS']" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='date' or @type ='embedded_link' or @type ='data' or @type ='annotation' or @type ='concept_hierarchy' or @type ='concept_hierarchy_path' or @type ='memberlist']">
		<xsl:variable name="type_value" select="@type"/>
		<xsl:variable name="element_name">
			<xsl:choose>
				<xsl:when test="$type_value = 'date'">
				  p_name_date
				</xsl:when>
				<xsl:when test="$type_value = 'embedded_link'">
				  p_name_embedded_rel
				</xsl:when>
				<xsl:when test="$type_value = 'data'">
				  p_name_literal
				</xsl:when>
				<xsl:when test="$type_value = 'annotation'">
				  annotation_property
				</xsl:when>
				<xsl:when test="$type_value = 'concept_hierarchy'">
				  p_name_concept_hierarchy
				</xsl:when>
				<xsl:when test="$type_value = 'concept_hierarchy_path'">
				  p_name_concept_hierarchy_path
				</xsl:when>
				<xsl:when test="$type_value = 'memberlist'">
				  p_name.MEMBERLIST
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="{$element_name}">
			<xsl:apply-templates select="@*"/>
			<!--xsl:comment>match="*[@type ='date']"</xsl:comment-->
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='link']">
		<xsl:element name="p_name_rel">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='link']"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="SAMEAS"/>
			<xsl:apply-templates select="WORK"/>
			<xsl:apply-templates select="DOSSIER"/>
			<xsl:apply-templates select="EVENT"/>
			<xsl:apply-templates select="AGENT"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='SAMEAS' and local-name()!='WORK' and local-name()!='DOSSIER' and local-name()!='EVENT' and local-name()!='AGENT']" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type ='concept' or @type ='concept_hierarchy_path_concept']">
		<xsl:variable name="type_value" select="@type"/>
		<xsl:variable name="element_name">
			<xsl:choose>
				<xsl:when test="$type_value = 'concept'">
				  p_name_concept
				</xsl:when>
				<xsl:when test="$type_value = 'concept_hierarchy_path_concept'">
				  p_name_concept_hierarchy_path_concept
				</xsl:when>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="{$element_name}">
			<xsl:apply-templates select="@*"/>
			<xsl:comment>match="*[@type ='concept']"</xsl:comment>
			<xsl:apply-templates select="URI"/>
			<xsl:apply-templates select="IDENTIFIER"/>
			<xsl:apply-templates select="PREFLABEL"/>
			<xsl:apply-templates select="FALLBACK"/>
			<xsl:apply-templates select="ALTLABEL"/>
			<xsl:apply-templates select="OP-CODE"/>
			<xsl:apply-templates select="*[local-name()!='URI' and local-name()!='IDENTIFIER' and local-name()!='PREFLABEL' and local-name()!='FALLBACK' and local-name()!='ALTLABEL' and local-name()!='OP-CODE']" mode="non_treated"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*" mode="non_treated">
		<xsl:element name="NON_TREATED_ELEMENT">
			<xsl:value-of select="name()"/>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
