<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<xsl:if test="notification_data/languages/string">
			<xsl:attribute name="lang">
				<xsl:value-of select="notification_data/languages/string"/>
			</xsl:attribute>
		</xsl:if>

		<head>
			<title>
				<xsl:value-of select="notification_data/general_data/subject"/>
			</title>

			<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

			<xsl:call-template name="head" /> <!-- header.xsl -->

			<div class="messageArea">
				<div class="messageBody">
					 <table role='presentation' cellspacing="0" cellpadding="5" border="0">

						<tr>
							<td>@@greetings@@,
								<br/><br/><xsl:value-of select="notification_data/expiry_notice"/>.
								<br/><br/>@@recomendation@@ <a href="https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/090Integrations_with_External_Systems/060Authentication/020SAML-Based_Single_Sign-On_Sign-Off">@@linked_instructions@@</a>.
								<br/><br/>@@ADFS_recomendation@@.
								<br/><br/>@@further_questions@@.
								<br/><br/>@@sincerely@@,
								<br/>@@author@@
							</td>
						</tr>
					</table>
				</div>
			</div>
			<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
		</body>
	</html>


</xsl:template>

</xsl:stylesheet>