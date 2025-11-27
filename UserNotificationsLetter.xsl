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
						<xsl:choose>
							<!-- USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO Notification -->
							<xsl:when test="notification_data/notification_type='USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO'">
								<table>
								    <tr><td>Dear 
								    <xsl:choose>
								        <xsl:when test="notification_data/user_for_printing/preferred_first_name!=''">
								            <xsl:value-of select="notification_data/user_for_printing/preferred_first_name"/>
								        </xsl:when>
								        <xsl:otherwise>
								            <xsl:value-of select="notification_data/user_for_printing/first_name"/>
								        </xsl:otherwise>
								    </xsl:choose>
								    <xsl:text> </xsl:text><xsl:value-of select="notification_data/user_for_printing/last_name"/>,</td></tr></table>
<table>									<tr>
										<td>
											<p>Your library account has been updated, and you must now log in using your MyCarletonOne credentials. These are the same credentials you use for other university services, such as your Carleton email and Brightspace. You can no longer sign in with a barcode and PIN.</p>
											</td>
											</tr>
											<tr>
											<td>
											<xsl:for-each select="notification_data/user_for_printing/identifiers/code_value">
												<xsl:if test="(code='OTHER_ID_1') and (value!='')">
													<p>Your MyCarletonOne username is: <strong>
															<xsl:value-of select="value"/>
														</strong>
													</p>
												</xsl:if>
											</xsl:for-each>
											</td>
											</tr>
											<tr>
											    <td><p>If you are already using this username to access library services, you can disregard this message.</p></td>
											</tr>
											<tr>
											    <td>
											<p>For questions about your MyCarletonOne account, please <xsl:call-template name="ITSAccountHelp" /> or <xsl:call-template name="ITSServiceDesk" />. The library does not manage MyCarletonOne accounts and cannot assist with password changes.</p>
										</td>
									</tr>
								</table>
							</xsl:when>
							<!-- USER_TOGGLED_TO_EXTERNAL_LOGIN_INFO notification end -->
							<!-- RESTORED_ACCOUNT_PASSWORD_CHANGE notification start -->
							<xsl:when test="notification_data/notification_type='RESTORED_ACCOUNT_PASSWORD_CHANGE'">
							    <xsl:variable name="primaryID" select="/notification_data/receivers/receiver/user/user_name" />
																<table>
								    <tr><td>Dear 
								    <xsl:choose>
								        <xsl:when test="notification_data/user_for_printing/preferred_first_name!=''">
								            <xsl:value-of select="notification_data/user_for_printing/preferred_first_name"/>
								        </xsl:when>
								        <xsl:otherwise>
								            <xsl:value-of select="notification_data/user_for_printing/first_name"/>
								        </xsl:otherwise>
								    </xsl:choose>
								    <xsl:text> </xsl:text><xsl:value-of select="notification_data/user_for_printing/last_name"/>,</td></tr></table>
								    <table>
									<tr>
										<td>
											<p>Due to a system issue, your MacOdrum Library login credentials have been reset. 
											Your login barcode is: <strong><xsl:value-of select="/notification_data/receivers/receiver/user/user_name"/></strong></p>
											<p>Please <xsl:call-template name="resetPW" />, using this barcode as your User ID. The barcode and new password will be your Omni credentials going forward.</p>
											<p>We apologize for the inconvenience.</p>
										</td>
									</tr>
								</table>
							</xsl:when>
							<!-- RESTORED_ACCOUNT_PASSWORD_CHANGE notification end -->
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
