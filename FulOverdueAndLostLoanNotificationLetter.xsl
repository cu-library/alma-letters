<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:include href="mailReason.xsl"/>
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
					<!-- AFN CODE -->
					<xsl:choose>
						<!-- AFN test (is_afn_patron) defined in footer.xsl -->
						<xsl:when test="(string-length($is_afn_patron) > 0)">
							<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
							<xsl:choose>
								<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
									<!-- handle AFN French fr -->
									<br/>
									<table cellspacing="0" cellpadding="5" border="0">
										<tr>
											<td>
												<h>Pour éviter les frais indiqués, veuillez retourner le document (ou les documents) suivant(s) à votre bibliothèque. Une fois le(s) document(s) retourné(s), les frais correspondants seront supprimés de votre compte.</h>
											</td>
										</tr>
									</table>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
											<tr>
												<td>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
														</xsl:attribute>
														<tr align="center" bgcolor="#f5f5f5">
															<td colspan="6">
																<h3>
																	<xsl:value-of select="organization_unit/name"/>
																</h3>
															</td>
														</tr>
														<tr>
															<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
															<!-- 
                                                            <th>Title</th>
                                                            <th>Library</th>
                                                            <th>Loan date</th>
                                                            <th>Due date</th>
                                                            <th>Call Number</th>
                                                            <th>Related Fees</th>
                                                         -->
															<th>Titre</th>
															<th>Bibliothèque</th>
															<th>Date de prêt</th>
															<th>Date de retour</th>
															<!-- AFN VERSION 1.6 changed some french text -->
															<th>Cote</th>
															<th>Frais</th>
															<!-- END OF AFN VERSION 1.6 changed some french text -->
														</tr>
														<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
															<tr>
																<td>
																	<xsl:value-of select="item_loan/title"/>
																</td>
																<td>
																	<xsl:value-of select="physical_item_display_for_printing/library_name"/>
																</td>
																<td>
																	<xsl:value-of select="item_loan/loan_date"/>
																</td>
																<td>
																	<xsl:value-of select="item_loan/due_date"/>
																</td>
																<td>
																	<xsl:value-of select="physical_item_display_for_printing/call_number"/>
																</td>
																<td>
																	<xsl:for-each select="fines_fees_list/user_fines_fees">
																		<!-- AFN VERSION 1.6 changed some french text -->
																		<xsl:choose>
																			<xsl:when test="fine_fee_type_display = 'Lost item process fee' ">
																				<b>Frais de traitement - document perdu: </b>
																				<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
																			</xsl:when>
																			<xsl:when test="fine_fee_type_display = 'Lost item replacement fee' ">
																				<b>Frais de remplacements - document perdu: </b>
																				<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
																			</xsl:when>
																			<xsl:otherwise>
																				<b>
																					<xsl:value-of select="fine_fee_type_display"/>: </b>
																				<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
																			</xsl:otherwise>
																		</xsl:choose>
																		<!-- END OF AFN VERSION 1.6 changed some french text -->
																		<br/>
																	</xsl:for-each>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</td>
											</tr>
											<hr/>
											<br/>
										</xsl:for-each>
										<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
											<tr>
												<td>
													<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
													<!-- Overdue Notification Fee: -->
													<b>Frais d'avis de retard:</b>
													<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
												</td>
											</tr>
										</xsl:if>
									</table>
									<br/>
								</xsl:when>
								<xsl:otherwise>
									<!-- handle AFN default language en -->
									<br/>
									<table cellspacing="0" cellpadding="5" border="0">
										<tr>
											<td>
												<h>To avoid incurring the indicated fees, please return the following item(s) to your library. When an item is returned, associated fees will be removed from your account.</h>
											</td>
										</tr>
									</table>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
											<tr>
												<td>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
														</xsl:attribute>
														<tr align="center" bgcolor="#f5f5f5">
															<td colspan="6">
																<h3>
																	<xsl:value-of select="organization_unit/name"/>
																</h3>
															</td>
														</tr>
														<tr>
															<th>Title</th>
															<th>Library</th>
															<th>Loan date</th>
															<th>Due date</th>
															<th>Call Number</th>
															<th>Related Fees</th>
														</tr>
														<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
															<tr>
																<td>
																	<xsl:value-of select="item_loan/title"/>
																</td>
																<td>
																	<xsl:value-of select="physical_item_display_for_printing/library_name"/>
																</td>
																<td>
																	<xsl:value-of select="item_loan/loan_date"/>
																</td>
																<td>
																	<xsl:value-of select="item_loan/due_date"/>
																</td>
																<td>
																	<xsl:value-of select="physical_item_display_for_printing/call_number"/>
																</td>
																<td>
																	<xsl:for-each select="fines_fees_list/user_fines_fees">
																		<b>
																			<xsl:value-of select="fine_fee_type_display"/>: </b>
																		<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
																		<br/>
																	</xsl:for-each>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</td>
											</tr>
											<hr/>
											<br/>
										</xsl:for-each>
										<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
											<tr>
												<td>
													<b>Overdue Notification Fee:</b>
													<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
												</td>
											</tr>
										</xsl:if>
									</table>
									<br/>
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
										Some of the materials you have checked out are now overdue.
									</td>
								</tr>
								<tr>
									<td>
										If you still need them, please <xsl:call-template name="accountLogin"/> to renew them, or reach out to us and we'll see what we can do. We will not be able to renew the item if another library user has requested it.
									</td>
								</tr>
								<tr>
									<td>
									    <xsl:call-template name="ILLreturnLibrary"/>
									</td>
								</tr>
							</table>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss"/>
									<!-- style.xsl -->
								</xsl:attribute>
								<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
									<tr>
										<td>
											<table cellpadding="5" class="listing">
												<xsl:attribute name="style">
													<xsl:call-template name="mainTableStyleCss"/>
												</xsl:attribute>
												<tr align="center" bgcolor="#f5f5f5">
													<td colspan="5">
														<h3>
															<xsl:value-of select="organization_unit/name"/>
														</h3>
													</td>
												</tr>
												<tr>
													<th>@@lost_item@@</th>
													<th>@@description@@</th>
													<th>@@due_date@@</th>
													<th>@@barcode@@</th>
													<th>@@call_number@@</th>
												</tr>
												<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
													<tr>
														<td>
															<xsl:value-of select="item_loan/title"/>
														</td>
														<td>
															<xsl:value-of select="item_loan/description"/>
														</td>
														<td>
															<xsl:value-of select="item_loan/due_date"/>
														</td>
														<td>
															<xsl:value-of select="item_loan/barcode"/>
														</td>
														<td>
															<xsl:value-of select="physical_item_display_for_printing/call_number"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
									<hr/>
									<br/>
								</xsl:for-each>
								<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
									<tr>
										<td>
											<b>@@overdue_notification_fee@@</b>
											<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>
											<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>
											<xsl:value-of select="ff"/>
										</td>
									</tr>
								</xsl:if>
							</table>
							<br/>
							<table>
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
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>