<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:template match="/">
	<!-- 
    INTERNAL CODE: FulLoanReceiptLetter
    LETTER EDITOR NAME: Loan Receipt Letter
    -->
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
								<td>
									Hi,							
								</td>
							</tr>
							<tr>
								<td>
									You have borrowed the following items from MacOdrum Library at Carleton University.
								</td>
							</tr>
														<!-- OFFICE DELIVERY VARIATION: Checks for "Office Delivery" in address string, and implements different text if so. -->
							<xsl:choose>
								<xsl:when test="contains(/notification_data/items/item_loan/delivery_address, 'Office Delivery')">
									<tr>
										<td>
										<!-- Tells user what department item will be delivered to, strips out unnecessary address bits -->
										They will be delivered to your campus office at the <b><xsl:value-of select="substring-after(substring-before(/notification_data/items/item_loan/delivery_address,'Carleton University'), 'Office Delivery:')" /></b> department.
										</td>
									</tr>
							</xsl:when>
							<xsl:otherwise>
							<tr>
								<td>
									If you have selected "Mail Delivery" for items, they have been processed and are on route to you!
								</td>
							</tr>
							</xsl:otherwise>
							</xsl:choose>
							<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
								<tr>
									<td>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss" />
											</xsl:attribute>
											<tr>
												<th>@@title@@</th>
												<th>@@author@@</th>
												<th>@@loan_date@@</th>
												<th>@@due_date@@</th>
												<th>@@description@@</th>
											</tr>
											<xsl:for-each select="item_loans/overdue_and_lost_loan_notification_display/item_loan">
												<tr>
													<td>
														<xsl:value-of select="title" />
													</td>
													<td>
														<xsl:value-of select="author" />
													</td>
													<td>
														<xsl:value-of select="loan_date" />
													</td>
													<td>
														<xsl:value-of select="new_due_date_str" />
													</td>
													<td>
														<xsl:value-of select="description" />
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
							</xsl:for-each>
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
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>