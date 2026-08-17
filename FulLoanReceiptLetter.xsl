<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:template match="/">
		<!-- 
    INTERNAL CODE: FulLoanReceiptLetter
    LETTER EDITOR NAME: Loan Receipt Letter
    -->
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
						<div class="down-with-unnecessary-tables">
							<xsl:call-template name="toWhomIsConcerned2"/>
							<!-- Variable to flag if the items in the letter are new loans. -->
							<xsl:variable name="new_loans">
								<xsl:for-each select="/notification_data/items/item_loan">
									<xsl:if test="old_due_date=''">a</xsl:if>
								</xsl:for-each>
							</xsl:variable>
							<!-- Variable to count how many items are in the letter. -->
							<xsl:variable name="num_loans">
								<xsl:value-of select="count(/notification_data/items/item_loan/item_id)"/>
							</xsl:variable>
							<!-- Are there any new loans? If so, list them. -->
							<xsl:if test="string-length($new_loans) > 0">
								<p>You have borrowed the following item(s):</p>
								<table>
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss"/>
									</xsl:attribute>
									<tr>
										<th>Title</th>
										<!-- Optional column. Only shows if any of he items have descriptions. -->
										<xsl:call-template name="descriptionTH"/>
										<th>Due date</th>
									</tr>
									<xsl:for-each select="/notification_data/loans_by_library/library_loans_for_display/item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<xsl:if test="old_due_date = ''">
											<tr>
												<td>
													<xsl:value-of select="title"/>
												</td>
												<!-- Optional cell. Only shows if any of the items have descriptions. -->
												<xsl:call-template name="descriptionValues"/>
												<td>
													<xsl:value-of select="new_due_date_str"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</table>
								<!-- 
								OFFICE DELIVERY VARIATION: 
								Checks for "Office Delivery" in address string, and implements different text if so.
								-->
								<xsl:if test="contains(/notification_data/items/item_loan/delivery_address, 'Office Delivery')">
									<p>
										<!-- Tells user what department item will be delivered to, strips out unnecessary address bits -->
        								They will be delivered to your campus office at the 
        								<strong>
											<xsl:value-of select="substring-after(substring-before(/notification_data/items/item_loan/delivery_address,'Carleton University'), 'Office Delivery:')"/>
										</strong> 
        								department.
    						        </p>
								</xsl:if>
							</xsl:if>
							<!-- 
							Are there any loans that changed, but aren't new loans? 
							If yes, list them and tell the patron they have new due dates. 
							-->
							<xsl:if test="$num_loans > string-length($new_loans)">
								<p>The following items have a new due date: </p>
								<table>
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss"/>
									</xsl:attribute>
									<tr>
										<th>Title</th>
										<!-- Optional column. Only shows if any of he items have descriptions. -->
										<xsl:call-template name="descriptionTH"/>
										<th>Old due date</th>
										<th>New due date</th>
									</tr>
									<xsl:for-each select="/notification_data/loans_by_library/library_loans_for_display/item_loans/overdue_and_lost_loan_notification_display/item_loan">
										<xsl:if test="old_due_date != ''">
											<tr>
												<td>
													<xsl:value-of select="title"/>
												</td>
												<!-- Optional cell. Only shows if any of the items have descriptions. -->
												<xsl:call-template name="descriptionValues"/>
												<td>
													<xsl:value-of select="old_due_date_str"/>
												</td>
												<td>
													<xsl:value-of select="new_due_date_str"/>
												</td>
											</tr>
										</xsl:if>
									</xsl:for-each>
								</table>
							</xsl:if>
							<xsl:call-template name="accessSignatureWT"/>
						</div>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>