<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="recordTitle.xsl" />
	<xsl:include href="footer.xsl" />
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
													L'élément suivant de
													<xsl:value-of select="notification_data/phys_item_display/owning_library_name" />
													, que vous avez demandé sur
													<xsl:value-of select="notification_data/request/create_date" />
													peut être récupéré à
													<b>
														<xsl:value-of select="notification_data/request/delivery_address" />
													</b>
												</td>
											</tr>

											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
												<tr>
													<td>
														<br />
														L'article sera conservé pour vous jusqu'au
														<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" />
													</td>
												</tr>
											</xsl:if>
											<tr>
												<td>
													<br />
													<xsl:call-template name="recordTitle" />
													<!-- recordTitle.xsl -->
												</td>
											</tr>

											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br />
														<b>NOTES qui peuvent affecter le prêt:</b>
													</td>
												</tr>
												<tr>
													<td>
														<xsl:value-of select="notification_data/request/system_notes" />
													</td>
												</tr>
											</xsl:if>

											<tr>
												<td>
													<br />
													<!-- AFN-VERSION 1.1 -->
													Pour connaitre les heures de service et les informations sur le ramassage, veuillez consulter la page web de la bibliothèque sur le ramassage, donnée ci-dessus.
													<br />
												</td>
											</tr>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN language default english 'en' -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													The following item from
													<xsl:value-of select="notification_data/phys_item_display/owning_library_name" />
													, which you requested on
													<xsl:value-of select="notification_data/request						/create_date" />
													can be picked up at
													<b>
														<xsl:value-of select="notification_data/request/delivery_address" />
													</b>
												</td>
											</tr>

											<xsl:if test="notification_data/request/work_flow_entity/expiration_date">

												<tr>
													<td>
														<br />
														The item will be held for you until
														<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" />
													</td>
												</tr>
											</xsl:if>

											<tr>
												<td>
													<br />
													<xsl:call-template name="recordTitle" />
													<!-- recordTitle.xsl -->
												</td>
											</tr>

											<!-- If notes exist, then we'll display the notes lable and the note -->
											<xsl:if test="notification_data/request/system_notes !='' ">
												<tr>
													<td>
														<br />
														<b>NOTES that may affect loan:</b>
													</td>
												</tr>

												<tr>
													<td>
														<xsl:value-of select="notification_data/request/system_notes" />
													</td>
												</tr>
											</xsl:if>

											<tr>
												<td>
													<br />
													Please check the website at the pickup library indicated above for service hours and pickup information.
													<br />
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
											If you chose <b>MacOdrum Library</b>, items can be picked up at the Library Services Desk during opening hours.
											For current hours please visit the Library <a href="https://library.carleton.ca/hours">website</a>.
										</td>
									</tr>
									<tr>
										<td>
											If you chose <b>Curbside Pick-up</b>, items can be picked up either at the Library Services Desk or by calling <a href="tel:1-343-996-9167">(343) 996-9167</a>
											once you have arrived at the Curbside Location (exterior of the library building along Library Road (<em>canal side</em>)
											near the exterior book return) at the Library.
										</td>
									</tr>
									<tr>
										<td>
											<b>Hours for Curbside Pick-up</b> are daily, including weekends, from 9 am-4 pm.
										</td>
									</tr>
									<tr>
										<td>
											If you chose <b>Mail Delivery</b>, the items are being processed and will be on route to you shortly.
										</td>
									</tr>
								</table>
								<table border="0" cellpadding="5" cellspacing="0">
									<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
										<tr>
											<td>
												@@note_item_held_until@@
												<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date" />
												.
											</td>
										</tr>
									</xsl:if>
									<tr>
										<td>
											<xsl:call-template name="recordTitle" />
											<!-- recordTitle.xsl -->
										</td>
									</tr>
									<xsl:if test="notification_data/request/system_notes != ''">
										<tr>
											<td>
												<b>@@notes_affect_loan@@:</b>
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/system_notes" />
											</td>
										</tr>
									</xsl:if>
								</table>
								<table>
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