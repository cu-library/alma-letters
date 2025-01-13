<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
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
										<table>
											<tr>
												<td>
													<!-- AFN VERSION 1.6 changed some french text -->
													<!-- START AFN-VERSION 1.10 -->
												Le document suivant de [<xsl:call-template name="AFNOrgName"/>] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, que vous avez demandé le <xsl:value-of select="notification_data/request/create_date"/> peut être récupéré à <strong>
														<xsl:value-of select="notification_data/request/assigned_unit_name"/>
													</strong>
													<!-- END AFN-VERSION 1.10 -->
												</td>
											</tr>
											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
												<tr>
													<td>
														<br/>
														<!-- AFN VERSION 1.11 changed some french text -->
													La date d'expiration de l'exemplaire a été mise à jour. Ce dernier vous sera réservé jusqu'au <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br/>
													<xsl:call-template name="recordTitle"/>
													<!-- recordTitle.xsl -->
												</td>
											</tr>
											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br/>
														<strong>NOTES qui peuvent affecter le prêt:</strong>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:value-of select="notification_data/request/system_notes"/>
													</td>
												</tr>
												<!-- AFN-VERSION 1.2 moved /xsl:if closing tag below system_notes tr -->
											</xsl:if>
											<tr>
												<td>
													<br/>
													<!-- AFN-VERSION 1.1 -->
													<!-- AFN VERSION 1.6 changed some french text -->
                                                Pour connaitre les heures de service et des informations liées à la récupération de documents veuillez consulter ci-dessus la page web de la bibliothèque.
                                                <br/>
												</td>
											</tr>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN language default english 'en' -->
										<table>
											<tr>
												<td>
													<!-- START AFN-VERSION 1.10 -->
												The following item from [<xsl:call-template name="AFNOrgName"/>] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, which you requested on <xsl:value-of select="notification_data/request/create_date"/> can be picked up at <strong>
														<xsl:value-of select="notification_data/request/assigned_unit_name"/>
													</strong>
													<!-- END AFN-VERSION 1.10 -->
												</td>
											</tr>
											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
												<tr>
													<td>
														<br/>
														<!-- AFN VERSION 1.11  -->
													The item expiry date has been updated and will be held for you until <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br/>
													<xsl:call-template name="recordTitle"/>
													<!-- recordTitle.xsl -->
												</td>
											</tr>
											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br/>
														<strong>NOTES that may affect loan:</strong>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:value-of select="notification_data/request/system_notes"/>
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
								<!-- AFN TODO -->
								<!-- handle local institution on hold (ie. PUT YOUR EXISTING HOLD LETTER INFO HERE between the xsl:otherwise tag)-->
								<!-- Carleton letter -->
								<table>
									<xsl:call-template name="salutation2"/>
									<tr>
										<td>
											<p>We have updated the expiry date for the following item:</p>
										</td>
									</tr>
									<tr>
										<td>
											<strong>
												<xsl:call-template name="recordTitle"/>
											</strong>
											<!-- recordTitle.xsl -->
										</td>
									</tr>
									<tr>
										<td>
											<p>
												<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
													We will now hold the item until <strong>
														<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
													</strong>.
												</xsl:if> 
												You can pick it up at the <strong>
													<xsl:value-of select="notification_data/request/assigned_unit_name"/>
												</strong> or through our <xsl:call-template name="curbsideLink"/>. Please visit the library website for <xsl:call-template name="openingHours"/>.</p>
										</td>
									</tr>
									<xsl:if test="notification_data/request/system_notes !='' ">
										<tr>
											<td>
												<strong>@@notes_affect_loan@@:</strong>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/system_notes"/>
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td>
											<p>@@sincerely@@</p>
										</td>
									</tr>
									<xsl:call-template name="accessSignature"/>
								</table>
								<!-- END OF AFN TODO -->
								<!-- END OF Carleton letter -->
							</xsl:otherwise>
						</xsl:choose>
						<!-- END OF AFN CODE -->
					</div>
				</div>
				<!-- AFN TODO -->
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
				<!-- END OF AFN TODO -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>