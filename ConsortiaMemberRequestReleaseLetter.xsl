<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>

	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>

			<head>
				<title>
					<xsl:value-of select="notification_data/dynamic_subject"/>
				</title>

				<xsl:call-template name="generalStyle"/>
			</head>

			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/> <!-- style.xsl -->
				</xsl:attribute>

				<xsl:call-template name="head"/> <!-- header.xsl -->

				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation' cellspacing="0" cellpadding="5" border="0">

							<tr>
								<td>@@greetings@@,
									<br/>
									<xsl:choose>
										<xsl:when test="not(normalize-space(notification_data/table_name) = normalize-space(notification_data/target_code))">
											<xsl:value-of select="notification_data/main_notice"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="notification_data/main_notice_table"/>
										</xsl:otherwise>
									</xsl:choose>
									<br/>
									<br/>@@sincerely@@,
									<br/>
									<xsl:value-of select="notification_data/dynamic_author"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/> <!-- footer.xsl -->
			</body>
		</html>


	</xsl:template>

</xsl:stylesheet>
