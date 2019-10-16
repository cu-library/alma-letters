<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="senderReceiver">
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tr>
				<td width="50%">
					<xsl:choose>
						<xsl:when test="notification_data/user_for_printing">
							<table border="0" cellpadding="5" cellspacing="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss"/>
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<td>
										<xsl:value-of select="first_name"/> <xsl:value-of select="last_name"/>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="notification_data/receivers/receiver/user">
							<xsl:for-each select="notification_data/receivers/receiver/user">
								<table>
									<xsl:attribute name="style">
										<xsl:call-template name="listStyleCss"/>
										<!-- style.xsl -->
									</xsl:attribute>
									<tr>
										<td>
											<xsl:value-of select="first_name"/> <xsl:value-of select="last_name"/>
										</td>
									</tr>
								</table>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
