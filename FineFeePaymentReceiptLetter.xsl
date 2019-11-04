<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
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
						<table>
							<tr>
								<td>A payment has been received on your Library Account.</td>
							</tr>
						</table>
						<xsl:if test="notification_data/transaction_id != ''">
							<h4>@@transaction_id@@:
								<xsl:value-of select="/notification_data/transaction_id"/></h4>
						</xsl:if>
						<xsl:for-each select="notification_data/labels_list">
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td>
										<xsl:value-of select="letter.fineFeePaymentReceiptLetter.message"/>
									</td>
								</tr>
							</table>
							<br/>
						</xsl:for-each>
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
						<br/>
						<table>
							<tr>
								<td>For more information please visit your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.</td>
							</tr>
							<tr>
								<td>If you have any questions please contact a staff member from Access Services at <a href="mailto:LibCirc@cunet.carleton.ca">LibCirc@cunet.carleton.ca</a> or 613-520-2600 x2734.</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
