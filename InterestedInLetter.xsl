<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
					<table>
					    <tr>
					        <td>The Acquisitions team is processing a title you requested.
					        Electronic material will be accessible in Omni within 3 hours of receiving this message. 
					        Print material will take 3-5 days to process. If you have questions about your order, 
					        please contact <xsl:call-template name="bookOrderRequests"/>.</td>
					    </tr>
					</table>
				<table class="acq-orders">
					<tr>
						<th>
				            Order number:
						</th>
						<td>
							<xsl:value-of select="notification_data/line_number"/>
						</td>
					</tr>
					<tr>
						<th>
				            Title:
						</th>
						<td>
							<xsl:value-of select="notification_data/title"/>
						</td>
					</tr>
					<tr>
						<th>
				            MMS ID:
						</th>
						<td>
							<xsl:value-of select="notification_data/mms_id"/>
						</td>
					</tr>
					<tr>
						<th>
						    Call number:
						</th>
						<td>
							<xsl:value-of select="notification_data/poline_inventory/call_number"/>
						</td>
					</tr>
					<tr>
						<th>
						    Receiving note:
						</th>
						<td>
							<xsl:value-of select="notification_data/receiving_note"/>
						</td>
					</tr>
					<tr>
						<th>
						    Message:
						</th>
						<td>
							<xsl:value-of select="notification_data/message"/>
						</td>
					</tr>
				</table>
				<table>
					<tr>
						<td>Sincerely,</td>
					</tr>
					<tr>
						<td>The Acquisitions Team (ERA)</td>
					</tr>
				</table>
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>