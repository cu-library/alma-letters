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
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<xsl:call-template name="senderReceiver"/>
				<!-- SenderReceiver.xsl -->
				<br/>
				<xsl:call-template name="toWhomIsConcerned"/>
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									We would like to remind you that you have library materials that are due shortly. Please login to your Library Account to check the due dates and renew materials if required for a longer period. If the material has been requested by another patron you will have to return the material before the due date.
								</td>
							</tr>
							<tr>
								<td>
									Materials can be returned at the MacOdrum Library or at any university in Ontario.
								</td>
							</tr>
							<tr>
								<td>
									<xsl:if test="notification_data/short_loans='true'">
										<b>@@short_loans_message@@</b>
									</xsl:if>
									<xsl:if test="notification_data/short_loans='false'">
										<b>@@message@@</b>
									</xsl:if>
									<br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<b>@@loans@@</b>
								</td>
							</tr>
							<tr>
								<td>
									<table cellpadding="5" class="listing">
										<xsl:attribute name="style">
											<xsl:call-template name="mainTableStyleCss"/>
											<!-- style.xsl -->
										</xsl:attribute>
										<tr>
											<th>@@title@@</th>
											<th>@@description@@</th>
											<th>@@author@@</th>
											<th>@@due_date@@</th>
											<th>@@library@@</th>
										</tr>
										<xsl:for-each select="notification_data/item_loans/item_loan">
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
												<td>
													<xsl:value-of select="library_name"/>
												</td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>
						</table>
						<br/>
						<br/>@@additional_info_1@@


						<br/>
						@@additional_info_2@@


						<br/>
						<table>
							<tr>
								<td>
									For more information please visit your
									<a href="https://ocul-crl.alma.exlibrisgroup.com">Library Account</a>.
								</td>
							</tr>
							<tr>
								<td>If you have any questions please contact a staff member from Access Services at
									<a href="mailto:libcirc@carleton.ca">libcirc@carleton.ca</a>
									or 613-520-2600 x2734.</td>
							</tr>
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>@@department@@</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- footer.xsl -->
				<xsl:call-template name="lastFooter"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
