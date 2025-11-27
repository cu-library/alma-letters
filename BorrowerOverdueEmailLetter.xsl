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
				<div class="messageArea">
					<div class="messageBody">
						<table>
						    <tr>
						        <td>Hello,</td>
						    </tr>
						</table>
						<table>
							<tr>
								<td>
									We are reaching out about the following overdue item:
								</td>
							</tr>
						</table>
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
							</xsl:attribute>
							<tr>
								<td>
									<strong>Request ID: </strong>
									<xsl:value-of select="notification_data/request/external_request_id"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Title: </strong>
									<xsl:value-of select="notification_data/request/display/title"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Request date: </strong>
									<xsl:value-of select="notification_data/request/create_date"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Due date: </strong> <xsl:value-of select="notification_data/request/due_date"/>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>
									Please return the item as soon as possible.
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>Sincerely,</td>
							</tr>
						</table>
						<!-- footer.xsl -->
						<xsl:call-template name="ILLFooterPeerToPeer"/>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
