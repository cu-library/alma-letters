<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/letter_name"/>
				</title>
				<xsl:call-template name="generalStyle"/>
				<!-- style.xsl -->
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<xsl:call-template name="salutation"/>
						<xsl:choose>
							<!-- USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO Notification -->
							<xsl:when test="notification_data/notification_type='USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO'">
								<table>
									<tr>
										<td>
											<p>Your library account has been updated, and you must now log in using your MyCarletonOne credentials. These are the same credentials you use for other university services, such as your Carleton email and Brightspace. You can no longer sign in with your barcode and PIN.</p>
											<xsl:for-each select="notification_data/user_for_printing/identifiers/code_value">
												<xsl:if test="(code='OTHER_ID_1') and (value!='')">
													<p>MyCarletonOne username: <strong>
															<xsl:value-of select="value"/>
														</strong>
													</p>
												</xsl:if>
											</xsl:for-each>
											<p>For questions about your MyCarletonOne account, please <a href="https://carleton.ca/its/help-centre/accounts-and-passwords/">consult the ITS help page</a> or <a href="https://carleton.ca/its/contact/">contact the ITS Service Desk</a>. The library does not manage MyCarletonOne accounts and cannot assist with password changes.</p>
										</td>
									</tr>
								</table>
							</xsl:when>
							<!-- USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO notification end -->
							<!-- Failsafe: STOPS LETTER FROM SENDING FOR ANY NOTICES THAT IT HAS NOT BEEN CONFIGURED FOR -->
							<xsl:otherwise>
								<xsl:message terminate="yes">this notice is not configured in the letter</xsl:message>
							</xsl:otherwise>
							<!-- END OF failsafe -->
						</xsl:choose>
						<table>
							<tr>
								<td>
									<p>@@Sincerely@@</p>
								</td>
							</tr>
							<xsl:call-template name="accessSignature"/>
						</table>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
