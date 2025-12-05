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
					<div class="messageBody">
						<!-- Carleton letter -->
						<xsl:call-template name="toWhomIsConcerned"/>
						<!-- mailReason.xsl -->
						<table>
							<tr>
								<td>The library has declared an item you borrowed as lost. Please see the summary below:</td>
							</tr>
						</table>
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:for-each select="notification_data">
								<tr>
									<td>
										<table>
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
											</xsl:attribute>
											<tr>
												<th>Title</th>
												<th>&#160;</th> <!-- not labeling the description column as it takes up a lot of space and doesn't show up half the time -->
												<th>Due date</th>
												<th>Barcode</th>
												<th>Call number</th>
												<th>Lost item replacement fee</th>
											</tr>
												<tr>
												    <xsl:for-each select="item_loan">
    													<td>
    														<xsl:value-of select="title"/>
    													</td>
    													<td>
    														<xsl:value-of select="description"/>
    													</td>
    													<td>
    														<xsl:value-of select="due_date"/>
    													</td>
    													<td>
    														<xsl:value-of select="barcode"/>
    													</td>
    													<td>
    														<xsl:value-of select="call_number"/>
    													</td>
													</xsl:for-each>
													<td>
														<xsl:for-each select="fines_fees_list/user_fines_fees/fine_fee_ammount">
															<xsl:value-of select="normalized_sum"/>&#160;
															<xsl:value-of select="currency"/>
														</xsl:for-each>
													</td>
												</tr>
										</table>
									</td>
								</tr>
							</xsl:for-each>
						</table>
						<table>
							<tr>
								<td>
									<xsl:if test="notification_data/user_for_printing/active_balance/sum !=''">
										<p>
											<strong>Total account balance: </strong>
												<xsl:value-of select="(notification_data/user_for_printing/active_balance/normalized_sum)"/>&#160;
												<xsl:value-of select="notification_data/user_for_printing/active_balance/currency"/>
										</p>
									</xsl:if>
									<p>
										Returning the item will remove the <strong>lost item replacement fee</strong> from your account. 
										<!-- Is there a user block? If yes, tell the patron they have to clear the fine in order to borrow items again. -->
										<xsl:if test="/notification_data/user_for_printing/blocks !=''">You will be unable to borrow other items until you clear or pay your balance.</xsl:if>
										</p>
									<p>If you have questions about your fees or library items, please contact the library and we'll see what we can do to help!</p>
								</td>
							</tr>
							<tr>
								<td>Sincerely,</td>
							</tr>
							<xsl:call-template name="accessSignature" />
						</table>
						<!-- END OF Carleton Letter -->
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
