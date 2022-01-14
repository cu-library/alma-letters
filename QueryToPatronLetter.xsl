<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
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
										<!-- handle AFN default language en -->
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
													<!-- Regarding your recent library request made on -->
													Concernant votre récente demande de bibliothèque effectuée le <xsl:value-of select="notification_data/request/create_date" />
												</td>
											</tr>
										</table>
										<br />
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<xsl:attribute name="style">
												<xsl:call-template name="listStyleCss" />
												<!-- style.xsl -->
											</xsl:attribute>
											<xsl:if test="notification_data/request/display/title !=''">
												<tr>
													<td>
														<strong> Titre: </strong>
														<xsl:value-of select="notification_data/request/display/title" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/journal_title !=''">
												<tr>
													<td>
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<!-- Journal Title -->
														<strong> Titre de revue: </strong>
														<xsl:value-of select="notification_data/request/display/journal_title" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/author !=''">
												<tr>
													<td>
														<strong> Auteur: </strong>
														<xsl:value-of select="notification_data/request/display/author" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/publication_date !=''">
												<tr>
													<td>
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<!-- Publication Date -->
														<strong> Date de publication: </strong>
														<xsl:value-of select="notification_data/request/display/publication_date" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/volume !=''">
												<tr>
													<td>
														<strong> Volume: </strong>
														<xsl:value-of select="notification_data/request/display/volume" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/issue !=''">
												<tr>
													<td>
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<!-- Issue -->
														<strong> Fascicule: </strong>
														<xsl:value-of select="notification_data/request/display/issue" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/chapter !=''">
												<tr>
													<td>
														<strong> Chapitre: </strong>
														<xsl:value-of select="notification_data/request/display/chapter" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/volume_bk !=''">
												<tr>
													<td>
														<strong> Volume: </strong>
														<xsl:value-of select="notification_data/request/display/volume_bk" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
										</table>
										<br />
										<table role='presentation' >
											<xsl:if test="notification_data/query_note !=''">
												<tr>
													<td>
														<strong> Note: </strong>
														<xsl:value-of select="notification_data/query_note" />
													</td>
												</tr>
											</xsl:if>
										</table>
										<br />
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													Regarding your recent library request made on <xsl:value-of select="notification_data/request/create_date" />
												</td>
											</tr>
										</table>
										<br />
										<table role='presentation' cellspacing="0" cellpadding="5" border="0">
											<xsl:attribute name="style">
												<xsl:call-template name="listStyleCss" />
												<!-- style.xsl -->
											</xsl:attribute>
											<xsl:if test="notification_data/request/display/title !=''">
												<tr>
													<td>
														<strong> Title: </strong>
														<xsl:value-of select="notification_data/request/display/title" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/journal_title !=''">
												<tr>
													<td>
														<strong> Journal Title: </strong>
														<xsl:value-of select="notification_data/request/display/journal_title" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/author !=''">
												<tr>
													<td>
														<strong> Author: </strong>
														<xsl:value-of select="notification_data/request/display/author" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/publication_date !=''">
												<tr>
													<td>
														<strong> Publication Date: </strong>
														<xsl:value-of select="notification_data/request/display/publication_date" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/volume !=''">
												<tr>
													<td>
														<strong> Volume: </strong>
														<xsl:value-of select="notification_data/request/display/volume" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/issue !=''">
												<tr>
													<td>
														<strong> Issue: </strong>
														<xsl:value-of select="notification_data/request/display/issue" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/chapter !=''">
												<tr>
													<td>
														<strong> Chapter: </strong>
														<xsl:value-of select="notification_data/request/display/chapter" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="notification_data/request/display/volume_bk !=''">
												<tr>
													<td>
														<strong> Volume: </strong>
														<xsl:value-of select="notification_data/request/display/volume_bk" />
														<!-- recordTitle.xsl -->
													</td>
												</tr>
											</xsl:if>
										</table>
										<br />
										<table role='presentation' >
											<xsl:if test="notification_data/query_note !=''">
												<tr>
													<td>
														<strong> Note: </strong>
														<xsl:value-of select="notification_data/query_note" />
													</td>
												</tr>
											</xsl:if>
										</table>
										<br />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- Carleton letter -->
								<table border="0" cellpadding="5" cellspacing="0" role="presentation">
									<tr>
										<td>
											Hi,
										</td>
									</tr>
									<tr>
										<td>
											We would like to provide some updates to your request:
										</td>
									</tr>
								</table>
								<br/>
								<table border="0" cellpadding="5" cellspacing="0" role="presentation">
									<xsl:attribute name="style">
										<xsl:call-template name="listStyleCss"/>
										<!-- style.xsl -->
									</xsl:attribute>
									<xsl:if test="notification_data/request/display/material_type !=''">
										<tr>
											<td>
												<strong>@@format@@:  </strong>
												<xsl:value-of select="notification_data/request/display/material_type"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/title !=''">
										<tr>
											<td>
												<strong>@@title@@: </strong>
												<xsl:value-of select="notification_data/request/display/title"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/journal_title !=''">
										<tr>
											<td>
												<strong>@@journal_title@@: </strong>
												<xsl:value-of select="notification_data/request/display/journal_title"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/author !=''">
										<tr>
											<td>
												<strong>@@author@@: </strong>
												<xsl:value-of select="notification_data/request/display/author"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/autho_initials !=''">
										<tr>
											<td>
												<strong>@@author_initials@@: </strong>
												<xsl:value-of select="notification_data/request/display/autho_initials"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/publisher !=''">
										<tr>
											<td>
												<strong>@@publisher@@: </strong>
												<xsl:value-of select="notification_data/request/display/publisher"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/place_of_publication !=''">
										<tr>
											<td>
												<strong>@@place_of_publication@@: </strong>
												<xsl:value-of select="notification_data/request/display/place_of_publication"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/publication_date !=''">
										<tr>
											<td>
												<strong>@@publication_date@@: </strong>
												<xsl:value-of select="notification_data/request/display/publication_date"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/year !=''">
										<tr>
											<td>
												<strong>@@year@@: </strong>
												<xsl:value-of select="notification_data/request/display/year"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/edition !=''">
										<tr>
											<td>
												<strong>@@edition@@: </strong>
												<xsl:value-of select="notification_data/request/display/edition"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/call_number !=''">
										<tr>
											<td>
												<strong>@@call_number@@: </strong>
												<xsl:value-of select="notification_data/request/display/call_number"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/volume !=''">
										<tr>
											<td>
												<strong>@@volume@@: </strong>
												<xsl:value-of select="notification_data/request/display/volume"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/issue !=''">
										<tr>
											<td>
												<strong>@@issue@@: </strong>
												<xsl:value-of select="notification_data/request/display/issue"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/additional_person_name !=''">
										<tr>
											<td>
												<strong>@@additional_person_name@@: </strong>
												<xsl:value-of select="notification_data/request/display/additional_person_name"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/source !=''">
										<tr>
											<td>
												<strong>@@source@@: </strong>
												<xsl:value-of select="notification_data/request/display/source"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/series_title_number !=''">
										<tr>
											<td>
												<strong>@@series_title_number@@: </strong>
												<xsl:value-of select="notification_data/request/display/series_title_number"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/isbn !=''">
										<tr>
											<td>
												<strong>@@isbn@@: </strong>
												<xsl:value-of select="notification_data/request/display/isbn"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/issn !=''">
										<tr>
											<td>
												<strong>@@issn@@: </strong>
												<xsl:value-of select="notification_data/request/display/issn"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/doi !=''">
										<tr>
											<td>
												<strong>@@doi@@: </strong>
												<xsl:value-of select="notification_data/request/display/doi"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/pmid !=''">
										<tr>
											<td>
												<strong>@@pmid@@: </strong>
												<xsl:value-of select="notification_data/request/display/pmid"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/note !=''">
										<tr>
											<td>
												<strong>@@note@@: </strong>
												<xsl:value-of select="notification_data/request/display/note"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/chapter !=''">
										<tr>
											<td>
												<strong>@@chapter@@: </strong>
												<xsl:value-of select="notification_data/request/display/chapter"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/volume_bk !=''">
										<tr>
											<td>
												<strong>@@volume@@: </strong>
												<xsl:value-of select="notification_data/request/display/volume_bk"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/part !=''">
										<tr>
											<td>
												<strong>@@part@@: </strong>
												<xsl:value-of select="notification_data/request/display/part"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/pages !=''">
										<tr>
											<td>
												<strong>@@pages@@: </strong>
												<xsl:value-of select="notification_data/request/display/pages"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/start_page !=''">
										<tr>
											<td>
												<strong>@@start_page@@: </strong>
												<xsl:value-of select="notification_data/request/display/start_page"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/display/end_page !=''">
										<tr>
											<td>
												<strong>@@end_page@@: </strong>
												<xsl:value-of select="notification_data/request/display/end_page"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/note !=''">
										<tr>
											<td>
												<strong>@@request_note@@: </strong>
												<xsl:value-of select="notification_data/request/note"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/general_data/current_date !=''">
										<tr>
											<td>
												<strong>@@date@@: </strong>
												<xsl:value-of select="notification_data/general_data/current_date"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/external_request_id !=''">
										<tr>
											<td>
												<strong>@@request_id@@: </strong>
												<xsl:value-of select="notification_data/request/external_request_id"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/format_display !=''">
										<tr>
											<td>
												<strong>@@request_format@@: </strong>
												<xsl:value-of select="notification_data/request/format_display"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/max_fee !=''">
										<tr>
											<td>
												<strong>@@maximum_fee@@: </strong>
												<xsl:value-of select="notification_data/request/max_fee"/>
											</td>
										</tr>
									</xsl:if>
								</table>
								<br/>
								<table border="0" cellpadding="5" cellspacing="0" role="presentation">
									<xsl:if test="notification_data/query_type !=''">
										<tr>
											<td>@@query_to_patron@@</td>
										</tr>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="notification_data/query_type = 'Type_1_query_name'">
											<tr>
												<td>@@Type_1_query_line_1@@</td>
											</tr>
											<tr>
												<td>@@Type_1_query_line_2@@</td>
											</tr>
											<tr>
												<td>@@Type_1_query_line_3@@</td>
											</tr>
										</xsl:when>
										<xsl:when test="notification_data/query_type = 'Type_2_query_name'">
											<tr>
												<td>@@Type_2_query_line_1@@</td>
											</tr>
											<tr>
												<td>@@Type_2_query_line_2@@</td>
											</tr>
											<tr>
												<td>@@Type_2_query_line_3@@</td>
											</tr>
										</xsl:when>
										<xsl:otherwise>
											<tr>
												<td>@@Type_1_query_line_1@@</td>
											</tr>
											<tr>
												<td>@@Type_1_query_line_2@@</td>
											</tr>
											<tr>
												<td>@@Type_1_query_line_3@@</td>
											</tr>
										</xsl:otherwise>
									</xsl:choose>
								</table>
								<br/>
								<table border="0" cellpadding="5" cellspacing="0" role="presentation">
									<xsl:if test="notification_data/query_note !=''">
										<tr>
											<td>
												<strong>@@query_note@@: </strong>
												<xsl:value-of select="notification_data/query_note"/>
											</td>
										</tr>
									</xsl:if>
								</table>
								<br/>
								<table border="0" cellpadding="5" cellspacing="0" role="presentation">
									<tr>
										<td>
											Sincerely,
										</td>
									</tr>
									<tr>
										<td>
											Access Services Department
											<br />
											Carleton University Library
										</td>
									</tr>
									<tr>
										<td>
											Looking for additional materials that were not in our library?
											Try requesting them through our <a href="https://library.carleton.ca/services/interlibrary-loans">Resource Sharing</a>!
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
