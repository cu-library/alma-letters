<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" /> <!-- header.xsl -->
				<xsl:call-template name="senderReceiver" /> <!-- SenderReceiver.xsl -->
				<br/>
				<xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->
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
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													Veuillez noter que les éléments suivants que vous avez demandés <b>
													<xsl:value-of select="notification_data/organization_unit/name"/>
													</b> attendent d'être récupérés au lieu de prise en charge indiqué:
												</td>
											</tr>
											<xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<h3>
																		<xsl:value-of select="organization_unit/name" />
																	</h3>
																</td>
															</tr>
															<tr>
																<th>Titre</th>
																<th>Auteur</th>
																<th>Peut être retiré auprès de :</th>
																<th>L''exemplaire sera réservé à votre nom jusqu''au</th>
															</tr>
															<xsl:for-each select="requests/request_for_display">
																<tr>
																	<td>
																		<xsl:value-of select="phys_item_display/title"/>
																	</td>
																	<td>
																		<xsl:value-of select="phys_item_display/author"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/assigned_unit_name"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/work_flow_entity/expiration_date"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
											<br/>
											</xsl:for-each>
											<xsl:if test="notification_data/out_of_institution_requests/request_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
																	<h3>Exemplaires à retirer auprès d''autres institutions</h3>
																</td>
															</tr>
															<tr>
																<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE
																	<th>Title</th>
																	<th>Author</th>
																	<th>Can be picked up at</th>
																	<th>The item will be held for you until</th>
																-->
																<th>Titre</th>
																<th>Auteur</th>
																<th>Peut être retiré auprès de :</th>
																<th>L''exemplaire sera réservé à votre nom jusqu''au</th>
															</tr>
															<xsl:for-each select="notification_data/out_of_institution_requests/request_for_display">
																<tr>
																	<td>
																		<xsl:value-of select="phys_item_display/title"/>
																	</td>
																	<td>
																		<xsl:value-of select="phys_item_display/author"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/assigned_unit_name"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/work_flow_entity/expiration_date"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
												<br/>
											</xsl:if>
											<xsl:if test="notification_data/user_for_printing/blocks != ''">
												<tr>
													<td>
														<b>Notes pouvant affecter le prêt:</b>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:value-of select="notification_data/user_for_printing/blocks"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br/>
													<!-- AFN-VERSION 1.1 -->
													Pour connaitre les heures de service et les informations sur le ramassage, veuillez consulter la page web de la bibliothèque sur le ramassage, donnée ci-dessus.
													<br/>
												</td>
											</tr>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN language default english 'en' -->
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													Please note that the following item(s) you requested from <b>
													<xsl:value-of select="notification_data/organization_unit/name"/>
													</b> are waiting to be picked up at the indicated pickup location:
												</td>
											</tr>
											<!-- Unsure if these requests_by_library could ever be populated for an AFN request-->
											<!-- maybe for an AFN request, put pickup at OWNING institution? leave in -->
											<xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<h3>
																		<xsl:value-of select="organization_unit/name" />
																	</h3>
																</td>
															</tr>
															<tr>
																<th>Title</th>
																<th>Author</th>
																<th>Can be picked up at</th>
																<th>The item will be held for you until</th>
															</tr>
															<xsl:for-each select="requests/request_for_display">
																<tr>
																	<td>
																		<xsl:value-of select="phys_item_display/title"/>
																	</td>
																	<td>
																		<xsl:value-of select="phys_item_display/author"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/assigned_unit_name"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/work_flow_entity/expiration_date"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
												<br/>
											</xsl:for-each>
											<!-- Most AFN requests in out_of_institution_requests, hold shelf NOT IN OWNING institution -->
											<xsl:if test="notification_data/out_of_institution_requests/request_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<h3>Items to be picked up in other institutions</h3>
																</td>
															</tr>
															<tr>
																<th>Title</th>
																<th>Author</th>
																<th>Can be picked up at</th>
																<th>The item will be held for you until</th>
															</tr>
															<xsl:for-each select="notification_data/out_of_institution_requests/request_for_display">
																<tr>
																	<td>
																		<xsl:value-of select="phys_item_display/title"/>
																	</td>
																	<td>
																		<xsl:value-of select="phys_item_display/author"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/assigned_unit_name"/>
																	</td>
																	<td>
																		<xsl:value-of select="request/work_flow_entity/expiration_date"/>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
												<br/>
											</xsl:if>
											<xsl:if test="notification_data/user_for_printing/blocks != ''">
												<tr>
													<td>
														<b>Notes that may affect loan:</b>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:value-of select="notification_data/user_for_printing/blocks"/>
													</td>
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
								<table role='presentation' cellspacing="0" cellpadding="5" border="0">
									<tr>
										<td>
											<h>@@message@@</h>
										</td>
									</tr>
									<tr>
										<td>
											<h>@@following_items_awaiting_pickup@@</h>
										</td>
									</tr>
									<xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
										<tr>
											<td>
												<table cellpadding="5" class="listing">
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
													</xsl:attribute>
													<tr align="center" bgcolor="#f5f5f5">
														<td colspan="4">
															<h3>
																<xsl:value-of select="organization_unit/name" />
															</h3>
														</td>
													</tr>
													<tr>
														<th>@@title@@</th>
														<th>@@author@@</th>
														<th>@@can_picked_at@@</th>
														<th>@@note_item_held_until@@</th>
													</tr>
													<xsl:for-each select="requests/request_for_display">
														<tr>
															<td>
																<xsl:value-of select="phys_item_display/title"/>
															</td>
															<td>
																<xsl:value-of select="phys_item_display/author"/>
															</td>
															<td>
																<xsl:value-of select="request/assigned_unit_name"/>
															</td>
															<td>
																<xsl:value-of select="request/work_flow_entity/expiration_date"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
										<br/>
									</xsl:for-each>
									<xsl:if test="notification_data/out_of_institution_requests/request_for_display">
										<tr>
											<td>
												<table cellpadding="5" class="listing">
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
													</xsl:attribute>
													<tr align="center" bgcolor="#f5f5f5">
														<td colspan="4">
															<h3>@@other_institutions@@</h3>
														</td>
													</tr>
													<tr>
														<th>@@title@@</th>
														<th>@@author@@</th>
														<th>@@can_picked_at@@</th>
														<th>@@note_item_held_until@@</th>
													</tr>
													<xsl:for-each select="notification_data/out_of_institution_requests/request_for_display">
														<tr>
															<td>
																<xsl:value-of select="phys_item_display/title"/>
															</td>
															<td>
																<xsl:value-of select="phys_item_display/author"/>
															</td>
															<td>
																<xsl:value-of select="request/assigned_unit_name"/>
															</td>
															<td>
																<xsl:value-of select="request/work_flow_entity/expiration_date"/>
															</td>
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
										<br/>
									</xsl:if>
									<xsl:if test="notification_data/user_for_printing/blocks != ''">
										<tr>
											<td>
												<b>@@notes_affect_loan@@:</b>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="notification_data/user_for_printing/blocks"/>
											</td>
										</tr>
									</xsl:if>
								</table>
								<br />
								<table role='presentation' >
									<tr>
										<td>@@sincerely@@</td>
									</tr>
									<tr>
										<td>@@department@@</td>
									</tr>
								</table>
								<!-- END OF AFN TODO -->
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
