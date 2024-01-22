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
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<!-- AFN VERSION 1.6 changed some french text -->
													<!-- START AFN-VERSION 1.10 -->
												Le document suivant de [<xsl:call-template name="AFNOrgName"/>] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, que vous avez demandé le <xsl:value-of select="notification_data/request/create_date"/> peut être récupéré à <b>
														<xsl:value-of select="notification_data/request/assigned_unit_name"/>
													</b>
													<!-- END AFN-VERSION 1.10 -->
												</td>
											</tr>
											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
												<tr>
													<td>
														<br/>
														<!-- AFN VERSION 1.6 changed some french text -->
													Le document sera conservé pour vous jusqu'au <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
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
														<b>NOTES qui peuvent affecter le prêt:</b>
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
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<!-- START AFN-VERSION 1.10 -->
												The following item from [<xsl:call-template name="AFNOrgName"/>] - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>, which you requested on <xsl:value-of select="notification_data/request/create_date"/> can be picked up at <b>
														<xsl:value-of select="notification_data/request/assigned_unit_name"/>
													</b>
													<!-- END AFN-VERSION 1.10 -->
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
													<xsl:call-template name="recordTitle"/>
													<!-- recordTitle.xsl -->
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
													<td>
														<xsl:value-of select="notification_data/request/system_notes"/>
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br/>                                                
                                                Please check the <a href="https://library.carleton.ca/services/borrowing/requesting-items">website at the pickup library</a> indicated above for service hours and pickup information.
                                                <br/>
												</td>
											</tr>
										</table>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- Carleton letter -->
								<table role="presentation" cellspacing="0" cellpadding="5" border="0">
									<tr>
										<td>
											Hi,
										</td>
									</tr>
									<tr>
										<td>
											The materials that you have requested have been processed and are ready for you.
										</td>
									</tr>
									<tr>
										<td>
											<ul>
												<li>
                                                                                                         If you chose <b>MacOdrum Library</b>, items can be picked up at the Library Services Desk during opening hours.
											                 For current hours please visit the Library <a href="https://library.carleton.ca/hours">website</a>.
                                                                                                 </li>
											</ul>
											<ul>
												<li>
                                                                                                         If you chose <b>Curbside Pick-up</b>, items can be picked up either at the Library Services Desk or by calling <a href="tel:1-343-996-9167">(343) 996-9167</a>
                                                                                                         once you have arrived at the Curbside Location (exterior of the library building along Library Road (<em>canal side</em>)
                                                                                                         near the exterior book return) at the Library.<br/>
													<br/>
													<b>Hours for Curbside Pick-up</b> are daily, including weekends. Current opening hours are listed on the Library <a href="https://library.carleton.ca/hours">website</a>.
                                                                                                 </li>
											</ul>
											<ul>
												<li>
                                                                                                         If you chose <b>Mail Delivery</b>, the items are being processed and will be on route to you shortly.
                                                                                                 </li>
											</ul>
										</td>
									</tr>
									<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
										<tr>
											<td>
										@@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
										</td>
										</tr>
									</xsl:if>
									<tr>
										<td>
											<xsl:call-template name="recordTitle"/>
											<!-- recordTitle.xsl -->
										</td>
									</tr>
									<xsl:if test="notification_data/request/system_notes !='' ">
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
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>