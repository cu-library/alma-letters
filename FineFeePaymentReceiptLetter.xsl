<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<!-- START AFN-VERSION 1.8 -->
	<!-- Check if an email partner. If it is, we're trying to send more of an invoice letter -->
	<xsl:variable name="is_email_partner">
		<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER')">
		TRUE
	</xsl:if>
	</xsl:variable>
	<!-- END AFN-VERSION 1.8 -->
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
						<xsl:call-template name="toWhomIsConcerned"/>
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>Thank you for your recent payment!</td>
							</tr>
							<xsl:if test="notification_data/transaction_id != ''">
								<tr>
									<td>
										@@transaction_id@@: <xsl:value-of select="/notification_data/transaction_id"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="notification_data/labels_list">
								<tr>
									<td>
										<xsl:value-of select="letter.fineFeePaymentReceiptLetter.message"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>@@fee_type@@</th>
											<th>@@payment_date@@</th>
											<th align="right">@@paid_amount@@</th>
											<th>@@payment_method@@</th>
											<th>@@note@@</th>
										</tr>
										<xsl:for-each select="notification_data/user_fines_fees_list/user_fines_fees">
											<tr>
												<td>
													<xsl:value-of select="fine_fee_type_display"/>
												</td>
												<td>
													<xsl:value-of select="create_date"/>
												</td>
												<td align="right">
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_ammount/currency"/>
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_amount_display"/>
												</td>
												<td>
													<xsl:choose>
														<xsl:when test="fines_fee_transactions/fines_fee_transaction/transaction_method = 'CASH'">
															Campus Card
														</xsl:when>
														<xsl:when test="fines_fee_transactions/fines_fee_transaction/transaction_method = 'CREDIT_CARD'">
															Visa
														</xsl:when>
														<xsl:when test="fines_fee_transactions/fines_fee_transaction/transaction_method = 'CHECK'">
															Mastercard
														</xsl:when>
														<xsl:when test="fines_fee_transactions/fines_fee_transaction/transaction_method = 'DEBIT_CARD'">
															Debit Card
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_method"/>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td>
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_note"/>
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td/>
											<td align="right">
												<b>@@total@@:</b>
											</td>
											<td align="right">
												<xsl:value-of select="notification_data/total_amount_paid"/>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<!-- START AFN-VERSION 1.8 -->
				<xsl:choose>
					<xsl:when test="(string-length($is_email_partner) > 0)">
						<!-- email partner footer -->
						<p id="email_partner_financial_contact" align="left">
							<!-- START AFN TODO Enter your institutions financial contact info -->
                            Please direct inquiries about this payment to:<br/>
							<br/>
							Interlibrary Loans Department<br/>
                            Phone number: <xsl:call-template name="ILLphone"/>
							<br/>
                            Email: <xsl:call-template name="ILLemail"/>
							<br/>
                            Library Code: <xsl:call-template name="ILLLibraryCode"/>
							<br/>
							<!-- END AFN TODO Enter your institutions financial contact info -->
						</p>
					</xsl:when>
					<xsl:otherwise>
						<table cellpadding="5">
							<tr>
								<td>
									For more information, please <xsl:call-template name="accountLogin"/>.
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
						<!-- standard patron footer Local and AFN (links to home IZ) -->
						<!-- realistically, NO AFN messages would be sent. Patrons should pay at home IZ, but it would work -->
						<xsl:call-template name="AFNLastFooter"/>
						<xsl:call-template name="AFNAccount"/>
					</xsl:otherwise>
				</xsl:choose>
				<!-- END AFN-VERSION 1.8 -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>