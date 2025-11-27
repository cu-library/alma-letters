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
				<table>
					<tr>
						<td>
							Hello,
						</td>
					</tr>
				</table>
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<tr>
								<td>
									 We would like to inform you that we have received the item you supplied to us.
							    </td>
							</tr>
						</table>
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<strong>Request date: </strong>
									<xsl:value-of select="notification_data/request/create_date_str"/>
								</td>
							</tr>
							<tr>
							    <td>
							        <strong>Date received: </strong><xsl:value-of select="notification_data/item_arrival_date"/>
							    </td>
							</tr>
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
							<xsl:if test="notification_data/request/display/author != ''">
    							<tr>
    								<td>
    									<strong>Author: </strong>
    									<xsl:value-of select="notification_data/request/display/author"/>
    								</td>
    							</tr>
    						</xsl:if>
                            <xsl:if test="notification_data/note_to_partner != ''">
    							<tr>
    							    <td>
    							        <br/>
    							        <strong>Note: </strong>
    									<xsl:value-of select="notification_data/note_to_partner"/>
    							    </td>
    							</tr>
    						</xsl:if>
						</table>
						<table>
							<tr>
								<td>Sincerely,</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="ILLFooterPeerToPeer"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>