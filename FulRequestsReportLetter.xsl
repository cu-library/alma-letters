<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
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
					<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<br />
				<div class="messageArea">
					<div class="messageBody">
						<!-- AFN CODE -->
						<xsl:choose>
							<!-- AFN test (is_afn_patron) defined in footer.xsl -->
							<xsl:when test="(string-length($is_afn_patron) > 0)">
								<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
								<xsl:choose>
									<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
										<!-- handle AFN default language fr -->
										<br />
										<table role='presentation' cellspacing="0" cellpadding="5" border="0" style="float:left">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
											<!-- for AFN we're ONLY going to show when on hold shelf -->
											<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
												<tr>
													<h>Le(s)document(s) que vous avez demandé(s) de <xsl:value-of select="notification_data/organization_unit/name"/> est(sont) maintenant prêt(s) à être récupéré(s) au lieu de ramassage indiqué:</h>
												</tr>
												<tr>
													<td>
														<table role='presentation' >
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
																<!-- style.xsl -->
															</xsl:attribute>
															<tr>
																<xsl:attribute name="style">
																	<xsl:call-template name="headerTableStyleCss" />
																	<!-- style.xsl -->
																</xsl:attribute>
																<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
																<!--
																	<th>Type</th>
																	<th>Title</th>
																	<th>Author</th>
																	<th>Status</th>
																	<th>Pickup location</th>
																-->
																<th>Type</th>
																<th>Titre</th>
																<th>Auteur</th>
																<th>Statut</th>
																<th>Lieu de ramassage</th>
															</tr>
															<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
																<tr>
																	<td>
																		<xsl:value-of select="request_type_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="title_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="author_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="request_status_display"/>
																	</td>
																	<td>
																		<!-- pickup_location_displayjust contains a numerical code..potential ticket -->
																		<!-- just show a inst. name -->
																		<!-- <xsl:value-of select="pickup_location_display"/> -->
																		<xsl:value-of select="from_another_inst"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
														<hr/>
														<br />
													</td>
												</tr>
											</xsl:if>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<br />
										<table role='presentation' cellspacing="0" cellpadding="5" border="0" style="float:left">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
											<!-- for AFN we're ONLY going to show when on hold shelf -->
											<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
												<tr>
													<h>The item(s) you requested from <xsl:value-of select="notification_data/organization_unit/name"/> are now available at the indicated pickup location(s):</h>
												</tr>
												<tr>
													<td>
														<table role='presentation' >
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
															</xsl:attribute>
															<tr>
																<xsl:attribute name="style">
																	<xsl:call-template name="headerTableStyleCss" /> <!-- style.xsl -->
																</xsl:attribute>
																<th>Type</th>
																<th>Title</th>
																<th>Author</th>
																<th>Status</th>
																<th>Pickup location</th>
															</tr>
															<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
																<tr>
																	<td>
																		<xsl:value-of select="request_type_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="title_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="author_display"/>
																	</td>
																	<td>
																		<xsl:value-of select="request_status_display"/>
																	</td>
																	<td>
																		<!-- pickup_location_displayjust contains a numerical code..potential ticket -->
																		<!-- just show a inst. name -->
																		<!-- <xsl:value-of select="pickup_location_display"/> -->
																		<xsl:value-of select="from_another_inst"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
														<hr/>
														<br />
													</td>
												</tr>
											</xsl:if>
										</table>

									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- Carleton letter -->
								<table role='presentation' cellspacing="0" cellpadding="5" border="0" style="float:left">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
									</xsl:attribute>
									<tr>
										<td>
											<h>@@dear@@</h>
											<br />
											<h>@@please_find_below@@</h>
											<br />
											<br />
										</td>
									</tr>
									<xsl:if test="notification_data/non_active_requests/ful_request_interpated">
										<tr>
											<h3>@@not_active@@</h3>
										</tr>
										<tr>
											<h>@@not_active_description@@</h>
										</tr>
										<tr>
											<td>
												<table>
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
														<!-- style.xsl -->
													</xsl:attribute>
													<tr>
														<xsl:attribute name="style">
															<xsl:call-template name="headerTableStyleCss" />
															<!-- style.xsl -->
														</xsl:attribute>
														<th>@@type@@</th>
														<th>@@title@@</th>
														<th>@@author@@</th>
														<th>@@place_in_queue@@</th>
														<th>@@pickup_location@@</th>
													</tr>
													<xsl:for-each select="notification_data/non_active_requests/ful_request_interpated">
														<tr>
															<td>
																<xsl:value-of select="request_type_display"/>
															</td>
															<td>
																<xsl:value-of select="title_display"/>
															</td>
															<td>
																<xsl:value-of select="author_display"/>
															</td>
															<td>
																<xsl:value-of select="place_in_queue"/>
															</td>
															<td>
																<xsl:value-of select="pickup_location_display"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
												<hr/>
												<br />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/process_requests/ful_request_interpated">
										<tr>
											<h3>@@in_process@@</h3>
										</tr>
										<tr>
											<h>@@in_process_description@@</h>
										</tr>
										<tr>
											<td>
												<table role='presentation' >
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
														<!-- style.xsl -->
													</xsl:attribute>
													<tr>
														<xsl:attribute name="style">
															<xsl:call-template name="headerTableStyleCss" />
															<!-- style.xsl -->
														</xsl:attribute>
														<th>@@type@@</th>
														<th>@@title@@</th>
														<th>@@author@@</th>
														<th>@@status@@</th>
														<th>@@pickup_location@@</th>
													</tr>
													<xsl:for-each select="notification_data/process_requests/ful_request_interpated">
														<tr>
															<td>
																<xsl:value-of select="request_type_display"/>
															</td>
															<td>
																<xsl:value-of select="title_display"/>
															</td>
															<td>
																<xsl:value-of select="author_display"/>
															</td>
															<td>
																<xsl:value-of select="request_status_display"/>
															</td>
															<td>
																<xsl:value-of select="pickup_location_display"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
												<hr/>
												<br />
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/hold_shelf_requests/ful_request_interpated">
										<tr>
											<h3>@@on_hold_shelf@@</h3>
										</tr>
										<tr>
											<h>@@on_hold_shelf_description@@</h>
										</tr>
										<tr>
											<td>
												<table role='presentation' >
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
														<!-- style.xsl -->
													</xsl:attribute>
													<tr>
														<xsl:attribute name="style">
															<xsl:call-template name="headerTableStyleCss" />
															<!-- style.xsl -->
														</xsl:attribute>
														<th >@@type@@</th>
														<th>@@title@@</th>
														<th>@@author@@</th>
														<th>@@status@@</th>
														<th>@@pickup_location@@</th>
													</tr>
													<xsl:for-each select="notification_data/hold_shelf_requests/ful_request_interpated">
														<tr>
															<td>
																<xsl:value-of select="request_type_display"/>
															</td>
															<td>
																<xsl:value-of select="title_display"/>
															</td>
															<td>
																<xsl:value-of select="author_display"/>
															</td>
															<td>
																<xsl:value-of select="request_status_display"/>
															</td>
															<td>
																<xsl:value-of select="pickup_location_display"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
												<hr/>
												<br />
											</td>
										</tr>
									</xsl:if>
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
