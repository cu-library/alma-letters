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
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									<strong>Note:</strong> If you requested Mail Delivery, your items have been checked out to you and are now in the process of being mailed. Unfortunately we cannot estimate delivery times.
								</td>
							</tr>
							<tr>
								<td>
									<h>@@inform_loaned_items@@
										<xsl:value-of select="notification_data/organization_unit/name"/>
										, 
										<xsl:value-of select="notification_data/circ_desk_name"/></h>
								</td>
							</tr>
							<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display">
								<tr>
									<td>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
											</xsl:attribute>
											<tr align="center" bgcolor="#f5f5f5">
												<td colspan="6">
													<h3>
														<xsl:value-of select="organization_unit/name"/>
													</h3>
												</td>
											</tr>
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
														<xsl:value-of select="title"/>
													</td>
													<td>
														<xsl:value-of select="author"/>
													</td>
													<td>
														<xsl:value-of select="loan_date"/>
													</td>
													<td>
														<xsl:value-of select="new_due_date_str"/>
													</td>
													<td>
														<xsl:value-of select="description"/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
									</td>
								</tr>
								<hr/>
								<br/>
							</xsl:for-each>
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
