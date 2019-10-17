<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html"/>
	<xsl:template match="/">There are new items in your saved search:
		<xsl:value-of select="/notification_data/total_number_of_results/node()"/>
		<br/>
		<br/>
		Note that
		<xsl:value-of select="/notification_data/number_of_results_in_mail/node()"/>
		items are included in this email. All new records can be found via the follow link:

		<br/>
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of disable-output-escaping="yes" select="/notification_data/link/node()"/></xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="/notification_data/link/node()"/>
		</xsl:element>
		<br/>
		<br/>
		<xsl:for-each select="/notification_data/items/saved_searches_letter_item">
			<xsl:element name="a">
				<xsl:attribute name="href">
					<xsl:value-of disable-output-escaping="yes" select="url"/>
				</xsl:attribute>
				<xsl:value-of disable-output-escaping="yes" select="title"/>
			</xsl:element>
			<br/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
