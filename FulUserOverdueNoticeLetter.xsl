<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
	    <!-- 
        INTERNAL CODE: FulUserOverdueNoticeLetter
        LETTER EDITOR NAME: Overdue Notice Letter
        -->
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
											<strong>Le(s) document(s) suivant(s) de 
											<xsl:value-of select="notification_data/organization_unit/name"/> 
											est (sont) à rendre aujourd'hui. 
											Veuillez retourner le(s) document(s) à votre bibliothèque,
											ou pour un renouvellement:</strong>
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
										<table class="listing">
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
											<strong>The following item(s) from 
											<xsl:value-of select="notification_data/organization_unit/name"/> 
											are due today. 
											Please return the item(s) to your library, or, to renew them:</strong>
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
										<table class="listing">
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
							    <div class="down-with-unnecessary-tables">
								<!-- Carleton letter -->
								    <xsl:call-template name="toWhomIsConcerned2"/>
									<p>The following library items are due today.</p>
									<table class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>Title</th>
											<xsl:call-template name="descriptionTH"/>
											<!-- 
											Generates a "Description" table header if any of the items have 
											description info attached.
										    -->
											<th>Due date</th>
										</tr>
										<xsl:for-each select="notification_data/item_loans/item_loan">
											<tr>
												<td>
													<xsl:value-of select="title"/>
												</td>
												<xsl:call-template name="descriptionValues"/>
												<!-- 
											    Generates a "Description" cell if any of the items have 
											    description info attached.
										        -->
												<td>
													<xsl:value-of select="due_date"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
									<p>
									    If you still need them, 
									    please <xsl:call-template name="accountLogin"/> to renew them, 
									    or reach out to us and we'll see what we can do.
									</p>
									<!-- 
									If none of the items are ILL, tell patrons they can return them at any ON university. 
									If any of them are ILL, tell them they have to return to Carleton, but also to not
									freak out if they've already requested a renewal. 
									-->
									<xsl:call-template name="ILLreturnLibrary"/>
									<!-- Access Services signature -->
									<xsl:call-template name="accessSignatureWT"/>
								</div>
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