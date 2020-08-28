<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									We would like to remind you that you have library materials currently checked out which are due shortly or now overdue. Late fees are currently suspended and will not be applied to your account. Please login to your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a> to review items on loan and verify due dates.
								</td>
							</tr>
							<tr>
								<td>
									If you are able to return items, please bring them to one of our book drop locations at the Library. Returns will not be accepted at the Library Services Desk at this time. Items will be removed from your account 4-5 business days after return due to new book handling protocols.
								</td>
							</tr>
							<tr>
								<td>
									If you are unable to return items currently checked out, or you have already returned them to another academic library in Ontario, please email a staff member from Access Services at <a href="mailto:libcirc@library.carleton.ca">libcirc@library.carleton.ca</a> for assistance or call 613-520-2600 x2734.
								</td>
							</tr>
							<tr>
								<td>
									For more information on the changes to library services this Fall see <a href="https://library.carleton.ca/covid-19">https://library.carleton.ca/covid-19</a>.
								</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
