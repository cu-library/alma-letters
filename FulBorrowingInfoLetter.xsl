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
				<div class="messageArea">
					<div class="messageBody">
						<table role='presentation'>
							<xsl:call-template name="salutation2"/>
							<xsl:choose>
								<xsl:when test="notification_data/success='true'">
									<tr>
										<td>@@renewed_loan@@</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<tr>
										<td>@@not_renewed_loan@@</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<xsl:call-template name="recordTitle"/>
												<!-- recordTitle.xsl -->
											</td>
										</tr>
									</table>
									
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="notification_data/success='true'">
									<tr>
										<td>
											<strong>@@new_due_date@@: </strong>
											<xsl:value-of select="notification_data/item_loan_due_date"/>
										</td>
									</tr>
								</xsl:when>
								<xsl:otherwise>
									<!-- COMMENTING OUT REASON SECTION - I WANT TO SEE WHAT IT ACTUALLY PUTS IN THESE FIRST 
									<xsl:choose>
										<xsl:when test="notification_data/note != ''">
											<tr>
												<td>
													<strong>@@failure_reason@@: </strong>
													<xsl:value-of select="notification_data/note"/>
												</td>
											</tr>
										</xsl:when>
									</xsl:choose>
									-->
									<tr>
										<td>
											<strong>Due date: </strong>
											<xsl:value-of select="notification_data/item_loan_due_date"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</table>
						<br/>
						<table role='presentation'>
							<tr>
								<td>@@sincerely@@</td>
							</tr>
							<tr>
								<td>
									@@department@@
									<br/>
									Carleton University Library
								</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="ILLFooter"/>
				<xsl:call-template name="AFNAccount"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
