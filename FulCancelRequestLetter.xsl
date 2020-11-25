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
				<xsl:call-template name="head"/> <!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>@@on@@

									<xsl:value-of select="notification_data/general_data/current_date"/>
									@@we_cancel_y_req_of@@

									<xsl:value-of select="notification_data/request/create_date"/>
									@@detailed_below@@ :</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="recordTitle"/> <!-- recordTitle.xsl -->
								</td>
							</tr>
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td style="font-size: 110%;">
										<b>@@request_cancellation_note@@: </b>
										<xsl:value-of select="notification_data/request/cancel_reason"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<b>@@start_time@@: </b>
										<xsl:value-of select="notification_data/booking_start_time_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<b>@@end_time@@: </b>
										<xsl:value-of select="notification_data/booking_end_time_str"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<b>@@request_note@@: </b>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<b>@@reason_deleting_request@@: </b>
									<xsl:value-of select="notification_data/request/status_note_display"/>
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
