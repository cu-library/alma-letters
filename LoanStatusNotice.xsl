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
										<!-- handle AFN language fr -->
										<table cellspacing="0" cellpadding="5" border="0">
											<tr>
												<td>
													<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
														<!-- AFN-VERSION 1.1 -->
														<b>Le(s) document(s) énuméré(s) ci-dessous ont été rappelé(s). Voir ci-dessous pour la mise à jour de la (des) date(s) d'échéance.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_ONLY'">
														<!-- AFN-VERSION 1.1 -->
														<b>Le(s) document(s) énuméré(s) ci-dessous ont été rappelé(s). Le(s) date(s) d'échéance n'ont pas changée(s).</b>
													</xsl:if>
													<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
														<!-- AFN-VERSION 1.1 -->
														<b>La date d'échéance pour le(s) document(s) suivant(s) a(ont) changé. <br/>
															<br/>
                                                        Veuillez retourner le(s) document(s) avant la nouvelle date d'échéance pour éviter les amendes/frais.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
														<!-- AFN-VERSION 1.1 -->
														<b>Le rappel qui a été fait sur votre (vos) document(s) emprunté(s) a été annulé et la date de retour original a été rétablie. Voir ci-dessous pour la mise à jour de la (des) date(s) d'échéance.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
														<!-- AFN-VERSION 1.1 -->
														<b>Le rappel qui a été fait sur votre (vos) document(s) emprunté(s) a été annulé. Le prêt a été renouvelé. Voir ci-dessous pour la mise à jour de la (des) date(s) d'échéance.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
														<!-- AFN-VERSION 1.1 -->
														<!-- AFN-VERSION 1.6 -->
														<b>Le rappel qui a été fait sur votre (vos) document(s) emprunté(s) a été annulé. Il n'y a pas de changement dans la (les) date(s) d'échéance.</b>
													</xsl:if>
													<br/>
													<br/>
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
                                                                <th>Author</th>
                                                                <th>Original due date</th>
                                                                <th>Revised due date</th>
                                                                <th>Library</th>
                                                             -->
															<th>Titre</th>
															<th>Auteur</th>
															<!-- AFN VERSION 1.6 changed some french text -->
															<th>Ancienne date de retour</th>
															<th>Nouvelle date de retour</th>
															<!-- END OF AFN VERSION 1.6 changed some french text -->
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
																	<xsl:value-of select="old_due_date_str"/>
																</td>
																<td>
																	<xsl:value-of select="new_due_date_str"/>
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
													<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
														<b>The item(s) listed below have been recalled. See below for the updated due date(s).</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_ONLY'">
														<b>The item(s) listed below have been recalled. The due date(s) have not changed.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
														<b>The due date for the following item(s) has changed.<br/>
															<br/>
                                                        Please return the item(s) prior to the new due date to avoid fines/fees.</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE'">
														<b>The recall placed on your borrowed item(s) has been cancelled, and the original due date has been restored. See below for the updated due date(s).</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
														<b>The recall placed on your borrowed item(s) has been cancelled. The loan has been renewed. See below for the updated due date(s).</b>
													</xsl:if>
													<xsl:if test="notification_data/message='RECALL_CANCEL_NO_CHANGE'">
														<b>The recall placed on your borrowed item(s) has been cancelled. There is no change in the due date.</b>
													</xsl:if>
													<br/>
													<br/>
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
															<th>Author</th>
															<th>Original due date</th>
															<th>Revised due date</th>
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
																	<xsl:value-of select="old_due_date_str"/>
																</td>
																<td>
																	<xsl:value-of select="new_due_date_str"/>
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
								<xsl:call-template name="toWhomIsConcerned"/>
								<!-- mailReason.xsl -->
								<table role="presentation" cellspacing="0" cellpadding="5" border="0">
									<!-- This block explains whether the item is a recall, a due date change, or a recall cancellation -->
									<tr>
										<td>
											<xsl:if test="((notification_data/message='RECALL_DUEDATE_CHANGE') or (notification_data/message='RECALL_ONLY'))">	
												The library has recalled the following item(s).
											</xsl:if>
											<xsl:if test="notification_data/message='DUE_DATE_CHANGE_ONLY'">
												The library has changed the due date for the following item(s). Please see below for the revised due date.
											</xsl:if>
											<xsl:if test="((notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE') or (notification_data/message='RECALL_CANCEL_ITEM_RENEWED') or (notification_data/message='RECALL_CANCEL_NO_CHANGE'))">
												The library has cancelled the recall on the following item(s).
											</xsl:if>
										</td>
									</tr>
									<!-- END OF explanation block -->
									<!-- These two blocks deal with recall due dates and fine warnings -->
									<xsl:if test="((notification_data/message='RECALL_DUEDATE_CHANGE') or (notification_data/message='RECALL_ONLY'))">
										<tr>
											<td>
												<xsl:if test="notification_data/message='RECALL_DUEDATE_CHANGE'">
													<strong>Please note the due date for your item(s) has changed.</strong> You will incur recall fines if you keep the item(s) past the new due date.
												</xsl:if>
												<xsl:if test="notification_data/message='RECALL_ONLY'">
													The due date for your item(s) has not changed. Please note that you will incur recall fines if you keep the item(s) past the due date.
												</xsl:if>
											</td>
										</tr>
										<tr>
											<td>
												 For more information, visit the library's <xsl:call-template name="overdueItemsAndFines"/> page.
											</td>
										</tr>
									</xsl:if>
									<!-- END OF recall due date/fine warning block -->
									<!-- This block deals with recall cancellations -->
									<xsl:if test="((notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE') or (notification_data/message='RECALL_CANCEL_ITEM_RENEWED') or (notification_data/message='RECALL_CANCEL_NO_CHANGE'))">
										<tr>
											<td>
												<xsl:if test="(notification_data/message='RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE') and (/notification_data/item_loans/item_loan/old_due_date != /notification_data/item_loans/item_loan/due_date)">
													We have restored the original due date(s); please see below for due date details.
												</xsl:if>
												<xsl:if test="notification_data/message='RECALL_CANCEL_ITEM_RENEWED'">
													We have renewed the loan(s) for you; please see below for due date details.
												</xsl:if>
												<!-- Annoyingly, "RECALL_CANCEL_NO_CHANGE" doesn't exist in practice. Alma always sends the RECALL_CANCEL_RESTORE_ORIGINAL_DUEDATE notification, even when the due date hasn't changed. I'm conditioning around this by making sure the old due date isn't the same as the current due date. You'll see this in the table logic, also. -->
												<xsl:if test="(notification_data/message='RECALL_CANCEL_NO_CHANGE') or (/notification_data/item_loans/item_loan/old_due_date = /notification_data/item_loans/item_loan/due_date)">
													There is no change in item due date(s). Please see below for details.
												</xsl:if>
											</td>
										</tr>
									</xsl:if>
									<!-- END OF recall cancellation block -->
									<!-- Table of items -->
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
													<!-- If an "old due date" value exists, display old and new due date. -->
													<xsl:choose>
														<xsl:when test="((/notification_data/item_loans/item_loan/old_due_date !='') and (/notification_data/item_loans/item_loan/old_due_date !=/notification_data/item_loans/item_loan/due_date))">
															<th>@@old_due_date@@</th>
															<th>@@new_due_date@@</th>
														</xsl:when>
														<!-- If the "old due date" value doesn't exist, just display the due date. -->
														<xsl:otherwise>
															<th>Due Date</th>
														</xsl:otherwise>
													</xsl:choose>
												</tr>
												<xsl:for-each select="notification_data/item_loans/item_loan">
													<tr>
														<td>
															<xsl:value-of select="title"/>
														</td>
														<td>
															<xsl:value-of select="item_description"/>
														</td>
														<!-- If the "old due date" value exists and ISN'T equal to the current due date, display it. Otherwise, we don't need it. -->
														<xsl:if test="((/notification_data/item_loans/item_loan/old_due_date !='') and (/notification_data/item_loans/item_loan/old_due_date !=/notification_data/item_loans/item_loan/due_date))">
															<td>
																<xsl:value-of select="old_due_date"/>
															</td>
														</xsl:if>
														<td>
															<xsl:value-of select="/notification_data/item_loans/item_loan/due_date"/>
														</td>
													</tr>
												</xsl:for-each>
											</table>
										</td>
									</tr>
									<!-- END OF table -->
									<tr>
										<td>
											For more information on your loans, please <xsl:call-template name="accountLogin"/>.
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