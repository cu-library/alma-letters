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

							<!-- Opening statement -->
							<tr>
								<td>
									@@user_ requested_accessible_file.statment@@
								</td>
							</tr>

							<tr><td><br /></td></tr>
							<tr><td><br /></td></tr>

							<!-- Item details section -->
							<tr>
								<td style="font-weight:bold;">
									@@Item_details_header@@
								</td>
							</tr>
							<tr>
								<td>
									@@Item_title@@ <xsl:value-of select="notification_data/item_title" />
								</td>
							</tr>
							<tr>
								<td>
									@@Item_author@@ <xsl:value-of select="notification_data/item_author" />
								</td>
							</tr>

							<tr><td><br /></td></tr>

							<xsl:if test="notification_data/user_feedback !=''">
								<tr>
									<td>
										@@Request_comment@@ <xsl:value-of select="notification_data/user_feedback" />
									</td>
								</tr>
							</xsl:if>

							<tr><td><br /></td></tr>

							<xsl:if test="notification_data/item_url !=''">
								<tr>
									<td>
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="notification_data/item_url" />
											</xsl:attribute>
											@@View_in_leganto@@
										</xsl:element>
									</td>
								</tr>
							</xsl:if>

							<tr><td><br /></td></tr>
							<tr><td><br /></td></tr>

							<!-- Course details section -->
							<tr>
								<td style="font-weight:bold;">
									@@Course_details_header@@
								</td>
							</tr>
							<tr>
								<td>
									@@Course_name@@ <xsl:value-of select="notification_data/course_name" />
								</td>
							</tr>
							<tr>
								<td>
									@@Course_code@@ <xsl:value-of select="notification_data/course_code" />
								</td>
							</tr>
							<xsl:if test="notification_data/course_instructors !=''">
								<tr>
									<td>
										@@Course_instructor@@ <xsl:value-of select="notification_data/course_instructors" />
									</td>
								</tr>
							</xsl:if>

							<tr><td><br /></td></tr>
							<tr><td><br /></td></tr>

							<!-- Requester details section -->
							<tr>
								<td style="font-weight:bold;">
									@@User_details_header@@
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/user_full_name" />
								</td>
							</tr>
							<tr>
								<td>
									@@User_email@@ <xsl:value-of select="notification_data/user_email_address" />
								</td>
							</tr>
							<xsl:if test="notification_data/additional_email_addresses/string">
								<tr>
									<td>
										@@Additional_email_address@@ <xsl:for-each select="notification_data/additional_email_addresses/string"><xsl:value-of select="." /><xsl:if test="position() != last()">, </xsl:if></xsl:for-each>
									</td>
								</tr>
							</xsl:if>

							<tr><td><br /></td></tr>
							<tr><td><br /></td></tr>

							<!-- Signature -->
							<tr>
								<td>
									@@Signature@@
								</td>
							</tr>

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
