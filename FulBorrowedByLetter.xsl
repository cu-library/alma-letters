<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:template match="/">
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
					    <xsl:call-template name="toWhomIsConcerned" />
						<table>
							<tr>
								<td>
								    <strong>
								        <!-- If the patron has a preferred first name, use that. Otherwise, use the regular first name. -->
								        <xsl:choose>
								            <xsl:when test="/notification_data/borrower/preferred_first_name != ''">
								                <xsl:value-of select="/notification_data/borrower/preferred_first_name" />
								            </xsl:when>
								            <xsl:otherwise>
								                <xsl:value-of select="/notification_data/borrower/first_name" />
								            </xsl:otherwise>
								        </xsl:choose>
								        <xsl:value-of select="/notification_data/borrower/last_name" />
								    </strong>
									has picked up the following item on your behalf: 
								</td>
							</tr>
						</table>
						<table>
						    <xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:for-each select="notification_data/phys_item_display">
    							<tr>
    							    <td>
    							        <strong>Title: </strong>
    							        <xsl:value-of select="title" />
    							    </td>
    							</tr>
    							<xsl:if test="author != ''">
        							<tr>
        							    <td>
        							        <strong>Author: </strong>
        							        <xsl:value-of select="author" />
        							    </td>
        							</tr>
    							</xsl:if>
    							<xsl:if test="barcode != ''">
        							<tr>
        							    <td>
        							        <strong>Barcode: </strong>
        							        <xsl:value-of select="barcode" />
        							    </td>
        							</tr>
    							</xsl:if>
							</xsl:for-each>
						</table>
						<table>
							<tr>
								<td>
									This item is checked out on your account and is due back by <strong><xsl:value-of select="/notification_data/due_date" /></strong>.
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>
									Sincerely,
								</td>
							</tr>
							<xsl:call-template name="accessSignature" />
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