<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:variable name="conta1">0</xsl:variable>
	<xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type" />
	<xsl:variable name="externalRequestId" select="/notification_data/external_request_id" />
	<xsl:variable name="externalSystem" select="/notification_data/external_system" />
	<xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator" />
	<xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery" />
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
								<td>@@your_request@@</td>
							</tr>
							<xsl:if test="$isDeposit='true'">
								<tr>
									<td>@@material@@:</td>
								</tr>
								<tr>
									<td>
										<a>
											<xsl:attribute name="href">
												<xsl:value-of select="notification_data/item_url" />
											</xsl:attribute>
											<xsl:value-of select="notification_data/phys_item_display/title" />
										</a>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="$isDigitalDocDelivery='true' or $isDeposit='false'">
								<!-- DOCUMENT DELIVERY -->
								<tr>
									<td>@@material@@:</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/phys_item_display/title" />
									</td>
								</tr>
								<xsl:if test="$externalRequestId != ''">
									<tr>
										<td>
											@@the_request_relates@@
											<xsl:value-of select="$externalRequestId" />
											@@of@@
											<xsl:value-of select="$externalSystem" />
											.
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="/notification_data/url_list[string]">
									<tr>
										<td>@@attached_are_the_urls@@:</td>
									</tr>
									<xsl:for-each select="/notification_data/attachments_list/attachments">
										<xsl:if test="url">
											<tr>
												<td>
													<a>
														<xsl:attribute name="href">
															<xsl:value-of select="url" />
														</xsl:attribute>
														<xsl:value-of select="url" />
													</a>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<tr>
								<td>@@request_type_digitization@@</td>
							</tr>
							<xsl:if test="/notification_data/request/citation_upload_file_status">
								<xsl:choose>
									<xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_FILE_EXISTS'">
										<tr>
											<td>@@file_not_uploaded_file_exists@@.</td>
										</tr>
									</xsl:when>
									<xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_MULTIPLE_FILES'">
										<tr>
											<td>@@file_not_uploaded_multiple_files@@.</td>
										</tr>
									</xsl:when>
									<xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_NOT_UPLOADED_GENERAL_ERROR'">
										<tr>
											<td>@@file_not_uploaded_general_error@@.</td>
										</tr>
									</xsl:when>
									<xsl:when test="/notification_data/request/citation_upload_file_status = 'FILE_UPLOADED_SUCCESS'">
										<tr>
											<td>@@file_uploaded@@.</td>
										</tr>
									</xsl:when>
								</xsl:choose>
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