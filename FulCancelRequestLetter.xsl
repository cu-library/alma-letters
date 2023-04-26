<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="recordTitle.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string" />
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/letter_name" />
				</title>
				<xsl:call-template name="generalStyle" />
				<!-- style.xsl -->
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>Hi,</td>
							</tr>
							<tr>
								<td>
									@@on@@ <xsl:value-of select="notification_data/general_data/current_date" /> @@we_cancel_y_req_of@@.
								</td>
							</tr>
							<tr>
								<td>
									<xsl:call-template name="recordTitle" />
									<!-- recordTitle.xsl -->
								</td>
							</tr>
							<xsl:if test="notification_data/request/cancel_reason != ''">
								<tr>
									<td>
										<b>@@request_cancellation_note@@:</b>&#160;
										<xsl:value-of select="notification_data/request/cancel_reason" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/start_time != ''">
								<tr>
									<td>
										<b>@@start_time@@:</b>&#160;
										<xsl:value-of select="notification_data/booking_start_time_str" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/end_time != ''">
								<tr>
									<td>
										<b>@@end_time@@:</b>&#160;
										<xsl:value-of select="notification_data/booking_end_time_str" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<b>@@request_note@@:</b>&#160;
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>
							
							<!-- START stop emails for converted to resource sharing -->
								<xsl:if test="notification_data/request/status_note">                        
									<xsl:if test="contains(notification_data/request/status_note, 'ConvertedToResourceSharingRequest')">
										<xsl:message terminate="yes">A converted to resource sharing cancellation, don't send email</xsl:message>
									</xsl:if>
								</xsl:if>
							<!-- END stop emails for converted to resource sharing -->

							<tr>
								<td>
									<b>@@reason_deleting_request@@:</b>&#160;
									<xsl:value-of select="notification_data/request/status_note_display" />
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
							<tr>
								<td>
									@@sincerely@@
								</td>
							</tr>
							<tr>
								<td>
									@@department@@
									<br />
									Carleton University Library
								</td>
							</tr>
							<tr>
								<td>
									Need research help or assistance with your account? We're here to help!
									<a href="https://library.carleton.ca/help">Ask a Librarian</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>