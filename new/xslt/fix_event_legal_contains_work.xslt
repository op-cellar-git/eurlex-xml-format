<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:math="http://exslt.org/math">
	<xsl:output method="xml" indent="yes"/>
	<!-- identity transformation -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/NOTICE/DOSSIER/EVENT/EVENT_LEGAL_CONTAINS_WORK/WORK/*[local-name()='WORK_IS_ABOUT_CONCEPT_EUROVOC' or local-name()='RESOURCE_LEGAL_IS_ABOUT_SUBJECT-MATTER' or local-name()='RESOURCE_LEGAL_IS_ABOUT_CONCEPT_DIRECTORY-CODE' or local-name()='RESOURCE_LEGAL_TYPE' or local-name()='RESOURCE_LEGAL_ID_CELEX' or local-name()='RESOURCE_LEGAL_YEAR']"/>
	<xsl:template match="/NOTICE/DOSSIER/EVENT/EVENT_LEGAL_CONTAINS_WORK/WORK/EXPRESSION/*[local-name()='EXPRESSION_USES_LANGUAGE' or local-name()='EXPRESSION_MANIFESTED_BY_MANIFESTATION' or local-name()='MANIFESTATION']"/>
</xsl:stylesheet>
