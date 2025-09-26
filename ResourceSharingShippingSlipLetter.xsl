<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="counter" select="0"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template name="id-info">
		<xsl:param name="line"/>
		<xsl:variable name="first" select="substring-before($line,'//')"/>
		<xsl:variable name="rest" select="substring-after($line,'//')"/>
		<xsl:if test="$first = '' and $rest = '' ">
			<!--br/-->
		</xsl:if>
		<xsl:if test="$rest != ''">
			<xsl:value-of select="$rest"/>
			<br/>
		</xsl:if>
		<xsl:if test="$rest = ''">
			<xsl:value-of select="$line"/>
			<br/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="id-info-hdr">
		<xsl:call-template name="id-info">
			<xsl:if test="notification_data/incoming_request/rapidr_external_request_id!=''">
				<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
			</xsl:if>
			<xsl:if test="notification_data/incoming_request/rapidr_external_request_id=''">
				<xsl:with-param name="line" select="notification_data/incoming_request/external_request_id"/>
			</xsl:if>
			<xsl:with-param name="label" select="'Bibliographic Information:'"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="/">
		<html>
			<head>
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
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<strong>@@supplied_to@@: </strong>
									<xsl:value-of select="notification_data/partner_name"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@shipping_address@@: </strong>
								</td>
							</tr>
							<xsl:if test="notification_data/incoming_request/borrowing_institution!=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/incoming_request/borrowing_institution"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/incoming_request/borrowing_library!=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/incoming_request/borrowing_library"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="notification_data/partner_shipping_info_list/partner_shipping_info">
								<br/>
								<tr>
									<td>
										<table>
											<xsl:attribute name="style">
												<xsl:call-template name="listStyleCss"/>
												<!-- style.xsl -->
											</xsl:attribute>
											<tr>
												<td>
													<xsl:value-of select="address1"/>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:value-of select="address2"/>
												</td>
											</tr>
											<xsl:if test="address3!=''">
												<tr>
													<td>
														<xsl:value-of select="address3"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="address4!=''">
												<tr>
													<td>
														<xsl:value-of select="address4"/>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="address5!=''">
												<tr>
													<td>
														<xsl:value-of select="address5"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<xsl:value-of select="city"/>&#160;<xsl:value-of select="state"/>
												</td>
											</tr>
											<tr>
												<td>
													<xsl:value-of select="postal_code"/>&#160;<xsl:value-of select="country"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<strong>@@email@@: </strong>
									<xsl:value-of select="notification_data/email"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@phone@@: </strong>
									<xsl:value-of select="notification_data/phone"/>
								</td>
							</tr>
							<tr/>
							<tr/>
							<tr>
								<td>
									<strong>@@borrower_reference@@: </strong>
									<xsl:call-template name="id-info-hdr"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@my_id@@: </strong>
									<img src="externalId.png" alt="externalId"/>
								</td>
							</tr>
							<xsl:if test="notification_data/qualifier != ''">
								<tr>
									<td>
										<strong>@@qualifier@@: </strong>
										<img src="qualifier.png" alt="qualifier"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/group_qualifier != ''">
								<tr>
									<td>
										<strong>@@group_qualifier@@: </strong>
										<img src="group_qualifier.png" alt="group_qualifier"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong>@@format@@: </strong>
									<xsl:value-of select="notification_data/incoming_request/format"/>
								</td>
							</tr>
							<xsl:if test="notification_data/incoming_request/needed_by_dummy/full_date">
								<tr>
									<td>
										<strong>@@date_needed_by@@: </strong>
										<xsl:value-of select="notification_data/incoming_request/needed_by"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/incoming_request/note">
								<tr>
									<td>
										<strong>@@request_note@@: </strong>
										<xsl:value-of select="notification_data/incoming_request/note"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/incoming_request/requester_email">
								<tr>
									<td>
										<strong>@@requester_email@@: </strong>
										<xsl:value-of select="notification_data/incoming_request/requester_email"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/assignee != ''">
								<tr>
									<td>
										<strong>@@assignee@@: </strong>
										<xsl:value-of select="notification_data/assignee"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/item">
								<br/>
								<tr>
									<td>
										<strong>@@item_barcode@@: </strong>
										<img src="Barcode1.png" alt="Barcode1"/>
									</td>
								</tr>
								<!-- NOT SURE WHY THIS RANDOM TITLE IS HERE WHEN TITLE IS ALREADY BELOW. COMMENTING IT OUT FOR NOW. - AL
								<tr>
									<td>
										<xsl:value-of select="notification_data/item/title"/>
									</td>
								</tr>
								-->
								<tr>
									<td>
										<strong>@@library@@: </strong>
										<xsl:value-of select="notification_data/item/library_name"/>
									</td>
								</tr>
								<tr>
									<td>
										<strong>@@location@@: </strong>
										<xsl:value-of select="notification_data/item/location_name"/>
									</td>
								</tr>
								<xsl:if test="call_number">
									<tr>
										<td>
											<strong>@@call_number@@: </strong>
											<xsl:value-of select="notification_data/item/call_number"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="shelving_location/string">
									<tr>
										<td>
											<strong>@@shelving_location_for_item@@: </strong>
											<xsl:for-each select="shelving_location/string">
												<xsl:value-of select="."/>
									 &#160;
									 </xsl:for-each>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<tr>
								<td>
									<strong>@@title@@: </strong>
									<xsl:value-of select="notification_data/metadata/title"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@author@@: </strong>
									<xsl:value-of select="notification_data/metadata/author"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@volume@@: </strong>
									<xsl:value-of select="notification_data/metadata/volume"/>
			                      &#160;
			                    <strong>@@issue@@: </strong>
									<xsl:value-of select="notification_data/metadata/issue"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>