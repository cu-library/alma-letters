<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="mailReason.xsl"/>
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
						<xsl:call-template name="toWhomIsConcerned" />
						<table>
							<tr>
								<td>
									<p>
									    On <xsl:value-of select="notification_data/general_data/current_date"/>, 
									    we updated your request for the following item:
									</p>
									<p>
									    <xsl:call-template name="recordTitle"/>
									    <!-- recordTitle.xsl -->
									</p>
								</td>
							</tr>
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<p>
										    <strong>Cancellation note:</strong><br/>
										    <xsl:value-of select="notification_data/request/cancel_reason"/>
									    </p>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<strong>Start time:</strong>&#160;
										<xsl:value-of select="notification_data/booking_start_time_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<strong>End time:</strong>&#160;
										<xsl:value-of select="notification_data/booking_end_time_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<strong>Request note:</strong>&#160;
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
							<!-- BEGINNING OF stop emails for items converted to resource sharing -->
							<xsl:if test="notification_data/request/status_note">
								<xsl:if test="contains(notification_data/request/status_note, 'ConvertedToResourceSharingRequest')">
									<xsl:message terminate="yes">A converted to resource sharing cancellation, don't send email</xsl:message>
								</xsl:if>
							</xsl:if>
							<!-- END stop emails for items converted to resource sharing -->
							<tr>
								<td>
									<strong>Reason for change:</strong>&#160;
									<xsl:value-of select="notification_data/request/status_note_display"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/external_request_id !=''">
								<tr>
									<td>
										<strong>Request ID: </strong>
										<xsl:value-of select="notification_data/request/external_request_id"/>
									</td>
								</tr>
							</xsl:if>
						</table>
						<table>
							<tr>
								<td>
									Sincerely,
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