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
			<!-- AFN-VERSION 1.0 START -->
			<xsl:variable name="letter_lang" select="notification_data/languages/string"/>
			<!-- AFN-VERSION 1.0 END -->
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
			    <xsl:call-template name="toWhomIsPartners" />
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<tr>
								<td>
									We regret to inform you that we cannot fill your Resource Sharing request.
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
									<strong>Author: </strong>
									<xsl:value-of select="notification_data/request/display/author"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Request date: </strong>
									<xsl:value-of select="notification_data/request/create_date_str"/>
								</td>
							</tr>
							<!-- AFN-VERSION 1.0 START -->
							<!-- Add due date, no label for it so we must check language code -->
							<xsl:if test="notification_data/request/due_date !=''">
								<tr>
									<td>
										<xsl:if test="$letter_lang = 'fr'">
											<!-- due date label if lang is 'fr' -->
											<strong>Date d'échéance: </strong>
										</xsl:if>
										<xsl:if test="$letter_lang = 'en'">
											<strong>Due date: </strong>
										</xsl:if>
										<xsl:value-of select="notification_data/request/due_date"/>
									</td>
								</tr>
							</xsl:if>
							<!-- Add Shipping Cost -->
							<xsl:if test="notification_data/request/shipping_cost/sum > 0">
								<tr>
									<td>
										<xsl:if test="$letter_lang = 'fr'">
											<!-- Shipping cost label if lang is 'fr' -->
											<strong>Frais de port: </strong>
										</xsl:if>
										<xsl:if test="$letter_lang = 'en'">
											<strong>Shipping cost: </strong>
										</xsl:if>
										<xsl:value-of select="notification_data/request/shipping_cost/sum"/>&#160;<xsl:value-of select="notification_data/request/shipping_cost/currency"/>
									</td>
								</tr>
							</xsl:if>
							<!-- AFN-VERSION 1.0 END -->
							<tr>
								<td>
									<br/>
									<strong>Rejection reason: </strong>
									<xsl:value-of select="notification_data/reason_unfilled"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Note: </strong>
									<xsl:value-of select="notification_data/note_to_partner"/>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>Sincerely,</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="ILLFooterPeerToPeer" />
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>

