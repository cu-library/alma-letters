<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

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
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->

		<br />
		<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

        <div class="messageArea">
          <div class="messageBody">

			<table role='presentation'  cellspacing="0" cellpadding="5" border="0">

				<tr>
					<td>
					<xsl:variable name="link"><xsl:value-of select="/notification_data/download_file_job/link"/></xsl:variable>
						@@c.pa.email_body1@@<a href="{$link}">
							@@link@@</a>
						<br/>
					</td>
				</tr>
				<tr>
					<td>@@c.pa.email_size@@<xsl:value-of select="notification_data/download_file_job/size"/></td>
				</tr>
				<tr>
					<td>@@c.pa.email_body2@@</td>
				</tr>
			</table>
			<br />
			<table role='presentation' >
				<tr><td>@@sincerely@@</td></tr>
				<tr><td>@@department@@</td></tr>
			</table>

          </div>
        </div>

        <!-- footer.xsl -->
        <xsl:call-template name="lastFooter" />
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
