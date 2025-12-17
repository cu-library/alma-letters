<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:variable name="conta1">0</xsl:variable>
	<xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type"/>
	<xsl:variable name="externalRequestId" select="/notification_data/external_request_id"/>
	<xsl:variable name="externalSystem" select="/notification_data/external_system"/>
	<xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator"/>
	<xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery"/>
	<xsl:variable name="fileUploaded" select="/notification_data/file_uploaded"/>
	<xsl:template match="/">
		<!-- 
        INTERNAL CODE: FulDigitizationDocumentDeliveryNotificationLetter
        LETTER EDITOR NAME: Document Delivery Notification Letter
        -->
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
						<xsl:call-template name="toWhomIsConcerned"/>
						<table>
							<tr>
								<td>
									<p>Attached is a digital copy of the material you requested.</p>
									<p>As a reminder, please see our copyright statement:</p>
									<p>
										<em>
								            <xsl:call-template name="copyrightStatement"/>
								        </em>
									</p>
									<p>
										<strong>Title: </strong>
										<xsl:value-of select="notification_data/phys_item_display/title"/>
									</p>
								</td>
							</tr>
							<!-- WE HAVE THIS LABEL DISABLED AND THIS CELL ISN'T CONFIGURED TO DISPLAY ANYTHING. COMMENTING OUT FOR NOW. -AL 
							<xsl:if test="((notification_data/download_url_local != '' ) or (notification_data/download_url_saml != '') or (notification_data/download_url_cas != ''))">
								<tr>
									<td><p><strong>@@to_see_the_resource@@</td></strong></p>
								</tr>
							</xsl:if>
							-->
							<xsl:if test="notification_data/download_url_saml != ''">
								<tr>
									<td>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="notification_data/download_url_saml"/>
											</xsl:attribute>
											Access with MyCarletonOne login
										</a>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/download_url_local != ''">
								<tr>
									<td>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="notification_data/download_url_local"/>
											</xsl:attribute>
											Access with barcode/password</a> (enter barcode in User Name field)
									</td>
								</tr>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="notification_data/borrowing_document_delivery_max_num_of_views != ''">
									<tr>
										<td>
											<p>
												<!-- repeated text, keep as label -->
											    @@max_num_of_views@@ 
											    <strong>
													<xsl:value-of select="notification_data/borrowing_document_delivery_max_num_of_views"/>
											        views</strong>.
										    </p>
										</td>
									</tr>
								</xsl:when>
								<!-- not sure when this condition would flip -->
								<xsl:when test="(notification_data/request/document_delivery_max_num_of_views != '') and ((notification_data/download_url_local != '' ) or (notification_data/download_url_saml != '') or (notification_data/download_url_cas != ''))">
									<tr>
										<td>
											<p>
												<!-- repeated text, keep as label -->
										        @@max_num_of_views@@
										        <strong>
													<xsl:value-of select="notification_data/request/document_delivery_max_num_of_views"/>
										            views</strong>.
										    </p>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<!-- not sure when this condition would flip either -->
							<xsl:if test="/notification_data/url_list/string !=''">
								<tr>
									<td>Here are the resource URLs:</td>
								</tr>
								<xsl:for-each select="/notification_data/url_list/string">
									<tr>
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="."/>
												</xsl:attribute>
												<xsl:value-of select="."/>
											</a>
										</td>
									</tr>
								</xsl:for-each>
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