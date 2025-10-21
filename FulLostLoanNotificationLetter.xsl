<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
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
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
								</td>
							</tr>
						</table>
						<table cellpadding="5" class="listing">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:for-each select="notification_data">
								<table>
									<tr>
										<td>
											<b>@@lost_item@@ :</b>
											<xsl:value-of select="item_loan/title"/>
											<br/>
											<b>@@description@@ :</b>
											<xsl:value-of select="item_loan/description"/>
											<br/>
											<b>@@by@@ :</b>
											<xsl:value-of select="item_loan/author"/>
											<br/>
											<b>@@library@@ :</b>
											<xsl:value-of select="organization_unit/name"/>
											<br/>
											<b>@@loan_date@@ :</b>
											<xsl:value-of select="item_loan/loan_date"/>
											<br/>
											<b>@@due_date@@ :</b>
											<xsl:value-of select="item_loan/due_date"/>
											<br/>
											<b>@@barcode@@ :</b>
											<xsl:value-of select="item_loan/barcode"/>
											<br/>
											<b>@@call_number@@ :</b>
											<xsl:value-of select="phys_item_display/call_number"/>
											<br/>
											<b>@@charged_with_fines_fees@@ </b>
										</td>
									</tr>
								</table>
							</xsl:for-each>
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss"/>
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@fee_type@@</th>
									<th>@@fee_amount@@</th>
									<th>@@note@@</th>
								</tr>
								<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
									<tr>
										<td>
											<xsl:value-of select="fine_fee_type_display"/>
										</td>
										<td>
											<xsl:value-of select="fine_fee_ammount/normalized_sum"/>
											 
											<xsl:value-of select="fine_fee_ammount/currency"/>
										</td>
										<td>
											<xsl:value-of select="ff"/>
										</td>
									</tr>
								</xsl:for-each>
							</table>
							<br/>
							<br/>@@additional_info_1@@

							<br/>
							@@additional_info_2@@
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
