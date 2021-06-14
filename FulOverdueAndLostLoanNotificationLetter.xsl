<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/> <!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
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
																				<xsl:value-of select="fine_fee_type_display"/>:
																			</b>
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
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<!-- Overdue Notification Fee: -->
														<b>Frais d'avis de retard:</b>
														<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
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
												<xsl:call-template name="mainTableStyleCss" /><!-- style.xsl -->
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
																				<xsl:value-of select="fine_fee_type_display"/>:
																			</b>
																			<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
																			<br />
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
										<br />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
							<!-- Carleton letter -->
								<table border="0" cellpadding="5" cellspacing="0">
									<tr>
										<td>
											<h>@@inform_you_item_below@@ </h>
											<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
										</td>
									</tr>
								</table>
								<table cellpadding="5" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss"/> <!-- style.xsl -->
									</xsl:attribute>
									<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
										<tr>
											<td>
												<table cellpadding="5" class="listing">
													<xsl:attribute name="style">
														<xsl:call-template name="mainTableStyleCss"/>
													</xsl:attribute>
													<tr align="center" bgcolor="#f5f5f5">
														<td colspan="8">
															<h3>
																<xsl:value-of select="organization_unit/name"/>
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
																<xsl:value-of select="item_loan/title"/>
															</td>
															<td>
																<xsl:value-of select="item_loan/description"/>
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
																<xsl:value-of select="item_loan/barcode"/>
															</td>
															<td>
																<xsl:value-of select="physical_item_display_for_printing/call_number"/>
															</td>
															<td>
																<xsl:for-each select="fines_fees_list/user_fines_fees">
																	<b>
																		<xsl:value-of select="fine_fee_type_display"/>: </b>
																	<xsl:value-of select="fine_fee_ammount/normalized_sum"/>
																	 
																	<xsl:value-of select="fine_fee_ammount/currency"/>
																	 
																	<xsl:value-of select="ff"/>
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
												<b>@@overdue_notification_fee@@ </b>
												<xsl:value-of select="notification_data/overdue_notification_fee_amount/normalized_sum"/>
												 
												<xsl:value-of select="notification_data/overdue_notification_fee_amount/currency"/>
												 
												<xsl:value-of select="ff"/>
											</td>
										</tr>
									</xsl:if>
									<br/>
									@@additional_info_1@@
									<br/>
									@@additional_info_2@@
								</table>
								<br/>
								<table>
									<tr>
										<td>For more information please visit your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.</td>
									</tr>
									<tr>
										<td>If you have any questions please contact a staff member from Access Services at <a href="mailto:LibCirc@cunet.carleton.ca">LibCirc@cunet.carleton.ca</a> or 613-520-2600 x2734.</td>
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
