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
										<!-- handle AFN French fr -->
										<br />
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<h>Pour éviter d'avoir à payer les frais indiqués, veuillez retourner le(s) document(s) suivant(s) à votre bibliothèque.</h>
												</td>
											</tr>
										</table>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
											<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="6">
																	<h3>
																		<xsl:value-of select="organization_unit/name" />
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
																<th>Appel Nombre</th>
																<th>Frais connexes</th>
															</tr>
															<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
																<tr>
																	<td>
																		<xsl:value-of select="item_loan/title" />
																	</td>
																	<td>
																		<xsl:value-of select="physical_item_display_for_printing/library_name" />
																	</td>
																	<td>
																		<xsl:value-of select="item_loan/loan_date" />
																	</td>
																	<td>
																		<xsl:value-of select="item_loan/due_date" />
																	</td>
																	<td>
																		<xsl:value-of select="physical_item_display_for_printing/call_number" />
																	</td>
																	<td>
																		<xsl:for-each select="fines_fees_list/user_fines_fees">
																			<b>
																				<xsl:value-of select="fine_fee_type_display" />
																				:
																			</b>
																			<xsl:value-of select="fine_fee_ammount/normalized_sum" />
																			&#160;
																			<xsl:value-of select="ff" />
																			<br />
																		</xsl:for-each>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
												<hr />
												<br />
											</xsl:for-each>
											<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
												<tr>
													<td>
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<!-- Overdue Notification Fee: -->
														<b>Frais d'avis de retard:</b>
														<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum" />
														&#160;
														<xsl:value-of select="ff" />
													</td>
												</tr>
											</xsl:if>
										</table>
										<br />
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<br />
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<h>To avoid incurring the indicated fees, please return the following item(s) to your library.</h>
												</td>
											</tr>
										</table>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
											</xsl:attribute>
											<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss" />
															</xsl:attribute>
															<tr align="center" bgcolor="#f5f5f5">
																<td colspan="6">
																	<h3>
																		<xsl:value-of select="organization_unit/name" />
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
																		<xsl:value-of select="item_loan/title" />
																	</td>
																	<td>
																		<xsl:value-of select="physical_item_display_for_printing/library_name" />
																	</td>
																	<td>
																		<xsl:value-of select="item_loan/loan_date" />
																	</td>
																	<td>
																		<xsl:value-of select="item_loan/due_date" />
																	</td>
																	<td>
																		<xsl:value-of select="physical_item_display_for_printing/call_number" />
																	</td>
																	<td>
																		<xsl:for-each select="fines_fees_list/user_fines_fees">
																			<b>
																				<xsl:value-of select="fine_fee_type_display" />
																				:
																			</b>
																			<xsl:value-of select="fine_fee_ammount/normalized_sum" />
																			&#160;
																			<xsl:value-of select="ff" />
																			<br />
																		</xsl:for-each>
																	</td>
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
												<hr />
												<br />
											</xsl:for-each>
											<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
												<tr>
													<td>
														<b>Overdue Notification Fee:</b>
														<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum" />
														&#160;
														<xsl:value-of select="ff" />
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
								<table role="presentation" cellspacing="0" cellpadding="5" border="0">
									<tr>
										<td>
											Hi,
</td>
									</tr>
									<tr>
										<td>
											It looks like you have materials still checked out and they are now overdue.
</td>
									</tr>
									<tr>
										<td>
											If you still need them, please login to your
											<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>
											to renew them or reach out to us and we'll see what we can do.  If the item has been requested by another library user, the item will not be able to be renewed.
										</td>
									</tr>
									<tr>
										<td>
											Otherwise, items can be returned at the MacOdrum Library or at any university in Ontario.
</td>
									</tr>
								</table>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
									</xsl:attribute>
									<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
										<tr>
											<td>
												<table cellpadding="5" class="listing">
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss" />
													</xsl:attribute>
													<tr align="center" bgcolor="#f5f5f5">
														<td colspan="8">
															<h3>
																<xsl:value-of select="organization_unit/name" />
															</h3>
														</td>
													</tr>
													<tr>
														<th>@@lost_item@@</th>
														<th>@@description@@</th>
														<th>@@library@@</th>
														<th>@@loan_date@@</th>
														<th>@@due_date@@</th>
														<th>@@barcode@@</th>
														<th>@@call_number@@</th>
														<th>@@charged_with_fines_fees@@</th>
													</tr>
													<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display">
														<tr>
															<td>
																<xsl:value-of select="item_loan/title" />
															</td>
															<td>
																<xsl:value-of select="item_loan/description" />
															</td>
															<td>
																<xsl:value-of select="physical_item_display_for_printing/library_name" />
															</td>
															<td>
																<xsl:value-of select="item_loan/loan_date" />
															</td>
															<td>
																<xsl:value-of select="item_loan/due_date" />
															</td>
															<td>
																<xsl:value-of select="item_loan/barcode" />
															</td>
															<td>
																<xsl:value-of select="physical_item_display_for_printing/call_number" />
															</td>
															<td>
																<xsl:for-each select="fines_fees_list/user_fines_fees">
																	<b>
																		<xsl:value-of select="fine_fee_type_display" />
																		:
																	</b>
																	<xsl:value-of select="fine_fee_ammount/normalized_sum" />
																	<xsl:value-of select="fine_fee_ammount/currency" />
																	<xsl:value-of select="ff" />
																	<br />
																</xsl:for-each>
															</td>
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
										<hr />
										<br />
									</xsl:for-each>
									<xsl:if test="notification_data/overdue_notification_fee_amount/sum !=''">
										<tr>
											<td>
												<b>@@overdue_notification_fee@@</b>
												<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum" />
												<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency" />
												<xsl:value-of select="ff" />
											</td>
										</tr>
									</xsl:if>
								</table>
								<br />
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