<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="counter" select="0"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/> <!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<tr>
								<td>The following charges and/or payments have been posted to your Library Account in the last 7 days.</td>
							</tr>
						</table>
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									<xsl:value-of select="notification_data/message"/>
								</td>
							</tr>
						</table>
						<br/>
						<table>
							<tr>
								<td>For more information please visit your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.</td>
							</tr>
							<tr>
								<td>If you have any questions please contact a staff member from Access Services at <a href="mailto:LibCirc@cunet.carleton.ca">LibCirc@cunet.carleton.ca</a> or 613-520-2600 x2734.</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
