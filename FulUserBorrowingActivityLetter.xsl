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
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
								<tr>
									<td>
										@@reminder_message@@
										<br/>
										<br/>
									</td>
								</tr>
								<xsl:if test="notification_data/overdue_loans_by_library/library_loans_for_display">
									<tr>
										<td>
											<b>@@overdue_loans@@</b>
										</td>
									</tr>
									<xsl:for-each select="notification_data/overdue_loans_by_library/library_loans_for_display">
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
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
										<hr/>
										<br/>
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
														</tr>
													</xsl:for-each>
												</table>
											</td>
										</tr>
										<hr/>
										<br/>
									</xsl:for-each>
								</xsl:if>
							</xsl:if>
							<xsl:if test="notification_data/organization_fee_list/string">
								<tr>
									<td>
										<b>@@debt_message@@</b>
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
										<b>@@total@@
											<xsl:value-of select="notification_data/total_fee"/></b>
									</td>
								</tr>
								<tr>
									<td>
										<b>@@please_pay_message@@</b>
										<br/>
										<br/>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>
				<!-- footer.xsl -->
				<xsl:call-template name="lastFooter"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
