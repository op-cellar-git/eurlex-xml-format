<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	
	<xsl:template match="TYPE[not(boolean(./@type)) and starts-with(.,'cdm:') and not(boolean(../../@type='link'))]">
		<xsl:element name="TYPE">
			<xsl:attribute name="type">type</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="TYPE[not(boolean(./@type)) and starts-with(.,'cdm:') and boolean(../../@type='link')]"/>
	
	<xsl:template match="ANNOTATION">
		<!--xsl:comment>XXX</xsl:comment-->
		<xsl:apply-templates select="*" mode="annotation"/>
	</xsl:template>
	

	<xsl:template match="WORK_IS_ABOUT_CONCEPT_EUROVOC[@type='concept_facet']">
		<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
			<xsl:attribute name="type">concept_hierarchy</xsl:attribute>
			<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
				<xsl:attribute name="type">concept_hierarchy_path</xsl:attribute>
				<xsl:apply-templates select="WORK_IS_ABOUT_CONCEPT_EUROVOC_DOM"/>
				<xsl:apply-templates select="WORK_IS_ABOUT_CONCEPT_EUROVOC_MTH"/>
				<xsl:apply-templates select="WORK_IS_ABOUT_CONCEPT_EUROVOC_TT"/>
				<xsl:apply-templates select="WORK_IS_ABOUT_CONCEPT_EUROVOC_CONCEPT"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	<xsl:template match="WORK_IS_ABOUT_CONCEPT_EUROVOC_DOM">
		<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
			<xsl:attribute name="type">concept_hierarchy_path_concept</xsl:attribute>
			<xsl:attribute name="level">1</xsl:attribute>
			<xsl:attribute name="leaf">false</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="WORK_IS_ABOUT_CONCEPT_EUROVOC_MTH">
		<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
			<xsl:attribute name="type">concept_hierarchy_path_concept</xsl:attribute>
			<xsl:attribute name="level">2</xsl:attribute>
			<xsl:attribute name="leaf">false</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="WORK_IS_ABOUT_CONCEPT_EUROVOC_TT">
		<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
			<xsl:attribute name="type">concept_hierarchy_path_concept</xsl:attribute>
			<xsl:attribute name="level">3</xsl:attribute>
			<xsl:attribute name="leaf">false</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="WORK_IS_ABOUT_CONCEPT_EUROVOC_CONCEPT">
		<xsl:element name="WORK_IS_ABOUT_CONCEPT_EUROVOC">
			<xsl:attribute name="type">concept_hierarchy_path_concept</xsl:attribute>
			<xsl:attribute name="level">4</xsl:attribute>
			<xsl:attribute name="leaf">true</xsl:attribute>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*[@type='concept_level']">
		<xsl:element name="{name()}">
			<xsl:attribute name="type">concept_hierarchy</xsl:attribute>
			<xsl:element name="{name()}">
				<xsl:attribute name="type">concept_hierarchy_path</xsl:attribute>
				<xsl:apply-templates select="*" mode="level_serialization"/>
			</xsl:element>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*" mode="level_serialization">
		<xsl:variable name="element_name" select="replace(local-name(), '_\d+$', '')"/>
		<xsl:variable name="suffix" select="replace(local-name(), '^.+_(\d+)$','$1')"/>
		<xsl:variable name="next_suffix" select="concat('_',number($suffix)+1, '$')"/>
		<xsl:variable name="isLeaf">
			<xsl:choose>
				<xsl:when test="../*[matches(local-name(), $next_suffix)]">no</xsl:when>
				<xsl:otherwise>yes</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:element name="{$element_name}">
			<xsl:attribute name="type">concept_hierarchy_path_concept</xsl:attribute>
			<xsl:attribute name="level" select="$suffix"/>
			<xsl:attribute name="leaf" select="$isLeaf"/>
			<xsl:apply-templates select="node()"/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="*" mode="annotation">
		<xsl:variable name="annotation_element" select="local-name()"/>
		<xsl:variable name="annotation_value" select="."/>
		<xsl:element name="{$annotation_element}">
			<xsl:attribute name="type">annotation</xsl:attribute>
			<xsl:element name="VALUE">
				<xsl:value-of select="$annotation_value"/>
			</xsl:element>
			<!--<xsl:apply-templates select="node()"/>-->
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
