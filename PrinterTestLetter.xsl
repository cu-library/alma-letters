<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- 
INTERNAL NAME: PrinterTestLetter
LETTER EDITOR NAME: Test Letter
-->
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
				<xsl:call-template name="bodyStyleCss" /> <!-- From style.xsl -->
			</xsl:attribute>

			<xsl:call-template name="head" /> <!-- From header.xsl -->

			<div class="messageArea">
				<div class="messageBody">
					 <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
						Label with code letterName: @@letterName@@
					</table>
				</div>
			</div>
			<xsl:call-template name="lastFooter" /> <!-- From footer.xsl -->
		</body>
	</html>


</xsl:template>

</xsl:stylesheet>