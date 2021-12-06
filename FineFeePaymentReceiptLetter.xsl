<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
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
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>Hi,</td>
							</tr>
							<tr>
								<td>Thank you for your recent payment!</td>
							</tr>
							<xsl:if test="notification_data/transaction_id != ''">
								<tr>
									<td>
										@@transaction_id@@: <xsl:value-of select="/notification_data/transaction_id" />
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="notification_data/labels_list">
									<tr>
										<td>
											<xsl:value-of select="letter.fineFeePaymentReceiptLetter.message" />
										</td>
									</tr>
							</xsl:for-each>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss" />
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
													<xsl:value-of select="fine_fee_type_display" />
												</td>
												<td>
													<xsl:value-of select="create_date" />
												</td>
												<td align="right">
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_ammount/currency" />
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_amount_display" />
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
															<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_method" />
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td>
													<xsl:value-of select="fines_fee_transactions/fines_fee_transaction/transaction_note" />
												</td>
											</tr>
										</xsl:for-each>
										<tr>
											<td />
											<td align="right">
												<b>@@total@@:</b>
											</td>
											<td align="right">
												<xsl:value-of select="notification_data/total_amount_paid" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									For more information please visit your
									<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.
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
									<br />
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
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>