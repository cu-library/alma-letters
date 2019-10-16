<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="senderReceiver">
		<xsl:choose>
			<xsl:when test="notification_data/user_for_printing">
				<xsl:for-each select="notification_data/user_for_printing">
					<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
								<xsl:value-of select="name"/>
							</td>
						</tr>
					</table>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="notification_data/receivers/receiver/user">
				<xsl:for-each select="notification_data/receivers/receiver/user">
					<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td>
								<xsl:value-of select="last_name"/>, <xsl:value-of select="first_name"/>
							</td>
						</tr>
					</table>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
