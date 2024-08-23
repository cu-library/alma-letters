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
						    <!-- LOAN_STATUS_NOTICE_DUE_DATE_ERROR Notification -->
						    <!-- this is a letter meant specifically to notify users affected by an August 19 error in Loan Status Notice letters -->
							<xsl:when test="notification_data/notification_type = 'LOAN_STATUS_NOTICE_DUE_DATE_ERROR'">
								<table>
									<tr>
										<td>
											<p>On August 19th, 2024, we notified you about due date changes as a result of adjusted library hours in the fall. <strong>Unfortunately, due to an internal glitch, some of the dates provided were incorrect.</strong></p>
											<p>Please <xsl:call-template name="accountLogin"/> to see accurate due dates for your items.</p>
										</td>
									</tr>
								</table>
							</xsl:when>
							<!-- LOAN_STATUS_NOTICE_DUE_DATE_ERROR Notification end -->
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
