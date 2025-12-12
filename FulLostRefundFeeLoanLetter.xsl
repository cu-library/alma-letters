<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<table>
					<tr>
						<td>The following lost item was found: </td>
					</tr>
				</table>
				<table>
					<xsl:attribute name="style">
						<xsl:call-template name="listStyleCss"/>
						<!-- style.xsl -->
					</xsl:attribute>
					<xsl:for-each select="notification_data">
						<tr>
							<td>
								<strong>Title: </strong>
								<xsl:value-of select="item_loan/title"/>
								<br/>
								<xsl:if test="item_loan/description != ''">
									<strong>Loan details: </strong>
									<xsl:value-of select="item_loan/description"/>
									<br/>
								</xsl:if>
								<strong>Author: </strong>
								<xsl:value-of select="item_loan/author"/>
								<br/>
								<strong>Library: </strong>
								<xsl:value-of select="organization_unit/name"/>
								<br/>
								<strong>Loan date: </strong>
								<xsl:value-of select="item_loan/loan_date"/>
								<br/>
								<strong>Due date: </strong>
								<xsl:value-of select="item_loan/due_date"/>
								<br/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<table>
					<tr>
						<td>
						        Below are the details of charges and credits related to this loan:
					    </td>
					</tr>
					<table>
						<xsl:attribute name="style">
							<xsl:call-template name="mainTableStyleCss"/>
							<!-- style.xsl -->
						</xsl:attribute>
						<tr>
							<th>Fee type</th>
							<th align="right" width="10">Amount</th>
						</tr>
						<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
							<tr>
								<td>
									<xsl:value-of select="fine_fee_type_display"/>
								</td>
								<td align="right">
									<xsl:value-of select="fine_fee_ammount/normalized_sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
								</td>
							</tr>
						</xsl:for-each>
						<tr>
							<td align="right">
								<strong>Total: </strong>
							</td>
							<td align="right">
								<xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/fines_fees_list/user_fines_fees/fine_fee_ammount/currency"/>
							</td>
						</tr>
					</table>
				</table>
				<br/>
				<table>
					<tr>
						<td>Sincerely,</td>
					</tr>
					<xsl:call-template name="accessSignature"/>
				</table>
				<xsl:call-template name="AFNLastFooter"/>
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>