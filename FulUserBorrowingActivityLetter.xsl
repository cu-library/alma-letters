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
        INTERNAL CODE: FulUserBorrowingActivityLetter
        LETTER EDITOR NAME: Borrowing Activity Letter
        -->
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
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
										<!-- handle AFN default language fr -->
										<table cellspacing="0" cellpadding="5" border="0">
											<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
												<tr>
													<td>
														<!-- AFN VERSION 1.1 -->
														<b>Veuillez voir ci-dessous pour le(s) document(s) en prêt dans votre compte à <xsl:value-of select="notification_data/organization_unit/name"/>
														</b>
														<br/>
													</td>
												</tr>
												<xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
													<tr>
														<td>
															<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
															<b>Prêts en souffrance</b>
														</td>
													</tr>
													<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
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
																	<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE
																	<th>Title</th>
																	<th>Author</th>
																	<th>Due Date</th>
																	<th>Fine</th>
																	<th>Library</th>
																	 -->
																	<tr>
																		<th>Titre</th>
																		<th>Auteur</th>
																		<!-- AFN VERSION 1.6 changed some french text -->
																		<th>Date de retour</th>
																		<th>Amende</th>
																		<th>Bibliothèque</th>
																	</tr>
																	<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
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
																				<xsl:value-of select="normalized_fine"/>
																			</td>
																			<td>
																				<xsl:value-of select="library_name"/>
																			</td>
																		</tr>
																	</xsl:for-each>
																</table>
															</td>
															<hr/>
															<br/>
														</tr>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="notification_data/loans_by_library/library_loans_for_display">
													<tr>
														<td>
															<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
															<b>Prêts</b>
														</td>
													</tr>
													<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
														<tr>
															<td>
																<table cellpadding="5" class="listing">
																	<xsl:attribute name="style">
																		<xsl:call-template name="mainTableStyleCss"/>
																	</xsl:attribute>
																	<tr align="center" bgcolor="#f5f5f5">
																		<td colspan="3">
																			<h3>
																				<xsl:value-of select="organization_unit/name"/>
																			</h3>
																		</td>
																	</tr>
																	<tr>
																		<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE
																		<th>Title</th>
																		<th>Due Date</th>
																		<th>Fine</th>
																		-->
																		<th>Titre</th>
																		<!-- AFN VERSION 1.6 changed some french text -->
																		<th>Date de retour</th>
																		<th>Amende</th>
																	</tr>
																	<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
																		<tr>
																			<td>
																				<xsl:value-of select="title"/>
																			</td>
																			<td>
																				<xsl:value-of select="due_date"/>
																			</td>
																			<td>
																				<xsl:value-of select="normalized_fine"/>
																			</td>
																		</tr>
																	</xsl:for-each>
																</table>
																<hr/>
																<br/>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
											<xsl:if test="notification_data/organization_fee_list/string">
												<tr>
													<td>
														<!-- AFN VERSION 1.1 -->
														<b>Les amendes à votre compte:</b>
													</td>
												</tr>
												<xsl:for-each select="notification_data/organization_fee_list/string">
													<tr>
														<td>
															<xsl:value-of select="."/>
														</td>
													</tr>
												</xsl:for-each>
												<tr>
													<td>
														<b>
															<!-- AFN VERSION 1.1 -->
															Total: <xsl:value-of select="notification_data/total_fee"/>
														</b>
													</td>
												</tr>
												<tr>
													<td>
														<!-- AFN OFFICIAL TRANSLATION COMING AFN-TRANSLATE -->
														<b>Veuillez régler votre compte dans les plus brefs délais.</b>
														<br/>
													</td>
												</tr>
											</xsl:if>
										</table>
									</xsl:when>
									<xsl:otherwise>
										<!-- handle AFN default language en -->
										<table cellspacing="0" cellpadding="5" border="0">
											<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
												<tr>
													<td>
														<b>
															Please see below for item(s) checked out on your account at <xsl:value-of select="notification_data/organization_unit/name"/>
														</b>
														<br/>
													</td>
												</tr>
												<xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
													<tr>
														<td>
															<b>Overdue Loans</b>
														</td>
													</tr>
													<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
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
																		<th>Title</th>
																		<th>Author</th>
																		<th>Due Date</th>
																		<th>Fine</th>
																		<th>Library</th>
																	</tr>
																	<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
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
																				<xsl:value-of select="normalized_fine"/>
																			</td>
																			<td>
																				<xsl:value-of select="library_name"/>
																			</td>
																		</tr>
																	</xsl:for-each>
																</table>
																<hr/>
																<br/>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:if>
												<xsl:if test="notification_data/loans_by_library/library_loans_for_display">
													<tr>
														<td>
															<b>Loans</b>
														</td>
													</tr>
													<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
														<tr>
															<td>
																<table cellpadding="5" class="listing">
																	<xsl:attribute name="style">
																		<xsl:call-template name="mainTableStyleCss"/>
																	</xsl:attribute>
																	<tr align="center" bgcolor="#f5f5f5">
																		<td colspan="3">
																			<h3>
																				<xsl:value-of select="organization_unit/name"/>
																			</h3>
																		</td>
																	</tr>
																	<tr>
																		<th>Title</th>
																		<th>Due Date</th>
																		<th>Fine</th>
																	</tr>
																	<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
																		<tr>
																			<td>
																				<xsl:value-of select="title"/>
																			</td>
																			<td>
																				<xsl:value-of select="due_date"/>
																			</td>
																			<td>
																				<xsl:value-of select="normalized_fine"/>
																			</td>
																		</tr>
																	</xsl:for-each>
																</table>
																<hr/>
																<br/>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:if>
											</xsl:if>
											<xsl:if test="notification_data/organization_fee_list/string">
												<tr>
													<td>
														<b>Fines on your account:</b>
													</td>
												</tr>
												<xsl:for-each select="notification_data/organization_fee_list/string">
													<tr>
														<td>
															<xsl:value-of select="."/>
														</td>
													</tr>
												</xsl:for-each>
												<tr>
													<td>
														<b>
															Total: <xsl:value-of select="notification_data/total_fee"/>
														</b>
													</td>
												</tr>
												<tr>
													<td>
														<b>Please settle your account at the earliest opportunity.</b>
														<br/>
													</td>
												</tr>
											</xsl:if>
										</table>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<!-- Carleton letter -->
								<xsl:call-template name="toWhomIsConcerned"/>
								<!-- mailReason.xsl -->
								<table cellspacing="0" cellpadding="5" border="0">
									<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
										<tr>
											<td>
												@@reminder_message@@
												<br/>
												<hr/>
											</td>
										</tr>
										<xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
											<tr>
												<td>
													<b>@@overdue_loans@@</b>
												</td>
											</tr>
											<xsl:for-each select="notification_data/overdue_loans_by_library">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss"/>
															</xsl:attribute>
															<tr>
																<th>@@title@@</th>
																<th>@@description@@</th>
																<th>@@author@@</th>
																<th>@@due_date@@</th>
															</tr>
															<xsl:for-each select="library_loans_for_display/item_loans/overdue_and_lost_loan_notification_display/item_loan">
																<xsl:sort select="due_date" order="ascending"/>
																<tr>
																	<td>
																		<xsl:value-of select="physical_item/title"/>
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
																</tr>
															</xsl:for-each>
														</table>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="notification_data/loans_by_library/library_loans_for_display">
											<tr>
												<td>
													<b>@@loans@@</b>
												</td>
											</tr>
											<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
												<tr>
													<td>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss"/>
															</xsl:attribute>
															<tr>
																<th>@@title@@</th>
																<th>@@description@@</th>
																<th>@@author@@</th>
																<th>@@due_date@@</th>
															</tr>
															<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
																<xsl:sort select="due_date" order="ascending"/>
																<xsl:if test="notified_by_profiles = ''">
																	<tr>
																		<td>
																			<xsl:value-of select="physical_item/title"/>
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
																	</tr>
																</xsl:if>
															</xsl:for-each>
														</table>
														<hr/>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
									</xsl:if>
									<xsl:if test="notification_data/organization_fee_list/string">
										<tr>
											<td>
												@@debt_message@@ <strong><xsl:value-of select="notification_data/total_fee"/></strong>.
											</td>
										</tr>
										<tr>
											<td>
												<b>@@please_pay_message@@</b>
											</td>
										</tr>
									</xsl:if>
								</table>
								<!-- END OF Carleton letter -->
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