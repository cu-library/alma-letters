<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<!-- START AFN-VERSION 1.8 START Test if it's an EMAIL partner, if so terminate letter -->
	<xsl:variable name="is_email_partner">
		<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER') or (notification_data/request/user_group = 'NZILLUSER')">	
		TRUE		
	</xsl:if>
	</xsl:variable>
	<!-- END AFN-VERSION 1.8 Test if it's an EMAIL partner, if so terminate letter -->
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
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<!-- AFN CODE -->
						<xsl:choose>
							<!-- START AFN-VERSION 1.8 Test if it's an EMAIL partner, if so terminate letter -->
							<xsl:when test="(string-length($is_email_partner) > 0)">
								<xsl:message terminate="yes">user group is an EMAIL ILL PARTNER - TERMINATE </xsl:message>
							</xsl:when>
							<!-- END AFN-VERSION 1.8 Test if it's an EMAIL partner, if so terminate letter -->
							<!-- AFN test (is_afn_patron) defined in footer.xsl -->
							<xsl:when test="(string-length($is_afn_patron) > 0)">
								<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
								<xsl:choose>
									<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
										<!-- handle AFN language fr -->
										<table role="presentation" cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>                                            
                                            Veuillez noter que le(s) document(s) suivant(s) que vous avez demandé(s) de <b>
														<xsl:value-of select="notification_data/organization_unit/name"/>
													</b> est (sont) en attente d’être récupéré(s) au lieu de ramassage indiqué:
                                        </td>
											</tr>
											<xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss"/>
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<h3>
																		<xsl:value-of select="organization_unit/name"/>
																	</h3>
																</td>
															</tr>
															<tr>
																<th>Titre</th>
																<th>Auteur</th>
																<th>Peut être retiré auprès de :</th>
																<th>L'exemplaire sera réservé à votre nom jusqu'au</th>
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
																<xsl:call-template name="mainTableStyleCss"/>
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
																	<h3>Exemplaires à retirer auprès d'autres institutions</h3>
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
																<th>L'exemplaire sera réservé à votre nom jusqu'au</th>
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
										<table role="presentation" cellspacing="0" cellpadding="5" border="0">
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
																<xsl:call-template name="mainTableStyleCss"/>
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="4">
																	<h3>
																		<xsl:value-of select="organization_unit/name"/>
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
																<xsl:call-template name="mainTableStyleCss"/>
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
								<xsl:call-template name="toWhomIsConcerned"/>
								<!-- mailReason.xsl -->
								<table role="presentation" cellspacing="0" cellpadding="5" border="0">
									<tr>
										<td>
											The following hold shelf items are still waiting for you:
										</td>
									</tr>
									<xsl:for-each select="notification_data/requests_by_library/library_requests_for_display">
										<tr>
											<td>
												<table cellpadding="5" class="listing">
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss"/>
													</xsl:attribute>
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
														<xsl:call-template name="mainTableStyleCss"/>
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
									<tr>
										<td>
											If you need a few extra days for pickup, or would like to change your delivery preference, please reach out and we will see what we can do.
										</td>
									</tr>
									<tr>
										<td>
											@@sincerely@@
										</td>
									</tr>
									<tr>
										<td>
											@@department@@
											<br/>
											Carleton University Library
										</td>
									</tr>
								</table>
							</xsl:otherwise>
						</xsl:choose>
						<!-- END OF AFN CODE -->
					</div>
				</div>
				<!-- AFN footer options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>