<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="style.xsl" />
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
									Thanks for picking up your item(s)!
								</td>
							</tr>
							<tr>
								<td>
									Looking for additional materials that were not in our library? Try requesting them through our Resource Sharing!
								</td>
							</tr>
							<tr>
								<td>
									Sincerely,
								</td>
							</tr>
							<tr>
								<td>
									Access Services Department
								</td>
							</tr>
							<tr>
								<td>
									Carleton University Library
								</td>
							</tr>
							<tr>
								<td>
									Need research help or assistance with your account? We’re here to help! <a href="https://library.carleton.ca/help">Ask a Librarian.</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
