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
						<!-- AFN CODE -->
						<xsl:choose>
							<!-- AFN test (is_afn_patron) defined in footer.xsl -->
							<xsl:when test="(string-length($is_afn_patron) > 0)">
								<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
								<xsl:choose>
									<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
										<!-- handle AFN language fr -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													L'élément suivant de <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, que vous avez demandé sur <xsl:value-of select="notification_data/request						/create_date"/> peut être récupéré à <b><xsl:value-of select="notification_data/request/delivery_address"/></b>
												</td>
											</tr>

											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
												<tr>
													<td>
														<br/>
														L'article sera conservé pour vous jusqu'au <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br/>
													<xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
												</td>
											</tr>

											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br/>
														<b>NOTES qui peuvent affecter le prêt:</b>
													</td>
												</tr>

												<tr>
													<td><xsl:value-of select="notification_data/request/system_notes"/></td>
												</tr>

												<tr>
													<td>
														<br/>
														<!-- AFN-VERSION 1.1 -->
														Pour connaitre les heures de service et les informations sur le ramassage, veuillez consulter la page web de la bibliothèque sur le ramassage, donnée ci-dessus.
														<br/>
													</td>
												</tr>

											</xsl:if>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN language default english 'en' -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													The following item from <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, which you requested on <xsl:value-of select="notification_data/request						/create_date"/> can be picked up at <b><xsl:value-of select="notification_data/request/delivery_address"/></b>
												</td>
											</tr>

											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">

												<tr>
													<td>
														<br/>
														The item will be held for you until <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
													</td>
												</tr>
											</xsl:if>

											<tr>
												<td>
													<br/>
													<xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl -->
												</td>
											</tr>

											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br/>
														<b>NOTES that may affect loan:</b>
													</td>
												</tr>

												<tr>
													<td><xsl:value-of select="notification_data/request/system_notes"/></td>
												</tr>
											</xsl:if>

											<tr>
												<td>
													<br/>
													Please check the website at the pickup library indicated above for service hours and pickup information.
													<br/>
												</td>
											</tr>

										</table>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- Carleton letter -->
								<table>
									<tr>
										<td>
											The item(s) you have requested are ready for curbside pick-up or are being prepared for mail delivery.
										</td>
									</tr>
									<tr>
										<td>
											If you have chosen curbside pick-up: Upon arrival please remain in your vehicle, have your Banner ID/Student Number readily available, and call <a href="tel:1-343-996-9167">(343) 996-9167</a>. Pick-up your items at MacOdrum Library Curbside Pickup. Our curbside pick-up location is on the exterior of the library building along Library Road (canal side). A book return is also located here.
										</td>
									</tr>
									<tr>
										<td>
											Visit <a href="https://library.carleton.ca/services/curbside-pick-and-mail-delivery-library-print-collection">
											https://library.carleton.ca/services/curbside-pick-and-mail-delivery-library-print-collection</a> for additional information on how to pick-up items from the library. <strong>Curbside pickup is open Monday to Friday, 9:00 am - 12:00pm and 1:00pm-4:00pm.</strong>
										</td>
									</tr>
									<tr>
										<td>
											If you have chosen the mail delivery option a staff member will be in touch to confirm your mailing details. If you did not include your mailing address at the time of submission, please email your mailing address to <a href="mailto:library.services@carleton.ca">library.services@carleton.ca</a> as soon as possible to proceed with delivery.
										</td>
									</tr>
								</table>
								<table border="0" cellpadding="5" cellspacing="0">
									<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
										<tr>
											<td>@@note_item_held_until@@
												<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
												.</td>
										</tr>
									</xsl:if>
									<tr>
										<td>
											<xsl:call-template name="recordTitle"/> <!-- recordTitle.xsl -->
										</td>
									</tr>
									<xsl:if test="notification_data/request/system_notes">
										<tr>
											<td>
												<b>@@notes_affect_loan@@:</b>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/system_notes"/>
											</td>
										</tr>
									</xsl:if>
								</table>
								<br/>
								<table>
									<tr>
										<td>For more information please login to your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.</td>
									</tr>
									<tr>
										<td>If you have any questions please contact a staff member from Access Services at <a href="mailto:library.services@carleton.ca">library.services@carleton.ca</a> or 613-520-2600 x2734.</td>
									</tr>
								</table>
							</xsl:otherwise>
						</xsl:choose>
						<!-- END OF AFN CODE -->
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
