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
										<!-- AFN VERSION 1.8 -->
										<p>
											<b>Le(s) document(s) suivant(s) de <xsl:value-of select="notification_data/organization_unit/name"/> est (sont) à rendre aujourd'hui. Veuillez retourner le(s) document(s) à votre bibliothèque, ou pour un renouvellement:</b>
										</p>
										<ol class="afn_steps_list">
											<li>
												<!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
												<xsl:call-template name="AFNVisitLoansLink"/>
											</li>
											<li>                                        
												Cliquez sur <xsl:call-template name="AFNOrgName"/> à la gauche et renouvelez le(s) document(s)
											</li>
										</ol>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
												<!-- style.xsl -->
											</xsl:attribute>
											<tr>
												<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE 
												<th>Title</th>
												<th>Author</th>
												<th>Due Date</th>
												<th>Library</th>
												-->
												<th>Titre</th>
												<th>Auteur</th>
												<th>Date de retour</th>
												<th>Bibliothèque</th>
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
													<td>
														<xsl:value-of select="library_name"/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
										<!-- END OF AFN VERSION 1.8 -->
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<!-- AFN VERSION 1.8 -->
										<p>
											<b>The following item(s) from <xsl:value-of select="notification_data/organization_unit/name"/> are due today. Please return the item(s) to your library, or, to renew them:</b>
										</p>
										<ol class="afn_steps_list">
											<li>
												<!-- use a template from footer.xml with AFN conditional link logic. displays as 1. LINK  -->
												<xsl:call-template name="AFNVisitLoansLink"/>
											</li>
											<li>
												Click the <xsl:call-template name="AFNOrgName"/> option along the left and renew items                                        
											</li>
										</ol>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
												<!-- style.xsl -->
											</xsl:attribute>
											<tr>
												<th>Title</th>
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
										<!-- END OF AFN VERSION 1.8 -->
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
											The following library items are due today.
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
													<th>@@description@@</th>
													<th>@@due_date@@</th>
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
															<xsl:value-of select="due_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											If you still need them, please <xsl:call-template name="accountLogin"/> to renew them, or reach out to us and we'll see what we can do.
										</td>
									</tr>
									<tr>
										<td>
											<xsl:call-template name="ILLreturnLibrary"/>
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
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>