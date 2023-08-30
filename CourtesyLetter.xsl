<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="footer.xsl"/>
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
							<!-- AFN test (is_afn_patron) defined in footer.xsl -->
							<xsl:when test="(string-length($is_afn_patron) > 0)">
								<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
								<xsl:choose>
									<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
										<!-- handle AFN default language fr -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<!-- AFN VERSION 1.6 changed some french text -->
										Le(s) document(s) suivant(s) de <xsl:value-of select="notification_data/item_loans/item_loan/library_name"/> arrive(nt) à échéance. Veuillez retourner le(s) document(s) à votre bibliothèque, ou pour un renouvellement:
												</td>
											</tr>
											<tr>
												<td>
													<!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
													<xsl:call-template name="AFNVisitLoansLink"/>
												</td>
											</tr>
											<tr>
												<td>
													<!-- AFN VERSION 1.6 changed some french text -->
                                        2. Cliquez sur <xsl:value-of select="notification_data/item_loans/item_loan/library_name"/> à la gauche et renouvelez le(s).
												</td>
											</tr>
											<tr>
												<td>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<tr>
															<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
															<!--
																<th>Title</th>
																<th>Description</th>
																<th>Author</th>
																<th>Due Date</th>
																<th>Library</th>
															-->
															<th>Titre</th>
															<!-- AFN VERSION 1.6 changed some french text -->
															<th>Description</th>
															<th>Auteur</th>
															<!-- AFN VERSION 1.6 changed some french text -->
															<th>Date de retour</th>
															<th>Bibliothèque</th>
														</tr>
														<xsl:for-each select="notification_data/item_loans/item_loan">
															<tr>
																<td>
																	<xsl:value-of select="title"/>
																</td>
																<td>
																	<xsl:value-of select="description"/>
																</td>
																<td>
																	<xsl:value-of select="author"/>
																</td>
																<td>
																	<xsl:value-of select="due_date"/>
																</td>
																<td>
																	<xsl:value-of select="library_name"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</td>
											</tr>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>										
													The following item(s) from <xsl:value-of select="notification_data/item_loans/item_loan/library_name"/> are coming due. Please return the item(s) to your library, or, to renew them:										
												</td>
											</tr>
											<tr>
												<td>
													<!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
													<xsl:call-template name="AFNVisitLoansLink"/>
												</td>
											</tr>
											<tr>
												<td>
													2. Click the <xsl:value-of select="notification_data/item_loans/item_loan/library_name"/> option along the left and renew items
												</td>
											</tr>
											<tr>
												<td>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<tr>
															<th>Title</th>
															<th>Description</th>
															<th>Author</th>
															<th>Due Date</th>
															<th>Library</th>
														</tr>
														<xsl:for-each select="notification_data/item_loans/item_loan">
															<tr>
																<td>
																	<xsl:value-of select="title"/>
																</td>
																<td>
																	<xsl:value-of select="description"/>
																</td>
																<td>
																	<xsl:value-of select="author"/>
																</td>
																<td>
																	<xsl:value-of select="due_date"/>
																</td>
																<td>
																	<xsl:value-of select="library_name"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
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
											It looks like your items are due soon. If you still need them, please login to your
											<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>
											to renew them or reach out to us and we’ll see what we can do.
										</td>
									</tr>
									<tr>
										<td>
											Otherwise, items can be returned at MacOdrum Library or at any university in Ontario.
										</td>
									</tr>
									<tr>
										<td>
											<table cellpadding="5" class="listing">
												<xsl:attribute name="style">
													<xsl:call-template name="mainTableStyleCss"/>
													<!-- style.xsl -->
												</xsl:attribute>
												<tr>
													<th>@@title@@</th>
													<th>@@author@@</th>
													<th>@@due_date@@</th>
												</tr>
												<xsl:for-each select="notification_data/item_loans/item_loan">
													<tr>
														<td>
															<xsl:value-of select="title"/>
														</td>
														<td>
															<xsl:value-of select="author"/>
														</td>
														<td>
															<xsl:value-of select="due_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
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
									<tr>
										<td>
											Need research help or assistance with your account? We're here to help!
											<a href="https://library.carleton.ca/help">Ask a Librarian</a>
										</td>
									</tr>
								</table>
								<xsl:variable name="additional_info_1">@@additional_info_1@@</xsl:variable>
								<xsl:if test="$additional_info_1 != ''">
									@@additional_info_1@@
									<br/>
								</xsl:if>
								<xsl:variable name="additional_info_2">@@additional_info_2@@</xsl:variable>
								<xsl:if test="$additional_info_2 != ''">
									@@additional_info_2@@
									<br/>
								</xsl:if>
								<!-- END OF Carleton Letter -->
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
