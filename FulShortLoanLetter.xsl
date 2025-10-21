<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl"/>
	<xsl:include href="header.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:template match="/">
		<html>
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
						<table>
						<xsl:call-template name="salutation2"/>
							<tr>
								<td>
									<p><em><xsl:value-of select="notification_data/item_loan/physical_item/title"/></em> is due back at <xsl:value-of select="notification_data/due_date"/>.</p>
									<!-- Check if the item policy includes fines for late return. If yes, tell the patron how much they will be charged. -->
									<xsl:choose>
										<!-- When there is a fine policy: -->
										<xsl:when test="notification_data/has_fine_value='TRUE'">
											<p>Late returns incur a fine of <xsl:value-of select="notification_data/amount"/><xsl:value-of select="notification_data/currency_symbol"/> per <xsl:value-of select="notification_data/uom"/>.</p>
										</xsl:when>
										<!-- When there isn't a fine policy: -->
										<!-- TODO: Do we want to imply that the patron may incur a fine even if we don't have a fine policy? If not, this can just become a simple xsl:if check instead. -->
										<xsl:otherwise>
											<p>You may incur overdue charges if you return this item late.</p>
										</xsl:otherwise>
									</xsl:choose>
									<!-- If the item is from the JMC location, ask the patron to return it to the JMC desk if possible. -->
									<xsl:if test="notification_data/item_loan/location_code='jmc'">
									<p>Please return this item to the JMC Services Desk. If no attendant is available, return it to the main Library Services Desk.</p>
									</xsl:if>
								</td>
							</tr>
							<tr><td><p>Sincerely,</p></td></tr>
							<xsl:choose>
    							<!-- Apply JMC signature if the item is from the JMC location -->
    							<xsl:when test="notification_data/item_loan/location_code='jmc'">
						            <xsl:call-template name="libraryAccessibilitySignature"/>
					            </xsl:when>
    							<!-- In all other cases: the standard Access Services signature is fine -->
    							<xsl:otherwise>
    							    <xsl:call-template name="accessSignature"/>
    							</xsl:otherwise>
							</xsl:choose>
						</table>
					</div>
				</div>
				<!-- FOOTERS -->
				<xsl:choose>
					<!-- Apply JMC footer if the item is from the JMC location -->
					<xsl:when test="notification_data/item_loan/location_code='jmc'">
						<xsl:call-template name="libraryAccessibilityFooter"/>
					</xsl:when>
					<!-- In all other cases: the standard AFN footer is fine. -->
					<xsl:otherwise>
						<xsl:call-template name="AFNLastFooter"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:call-template name="AFNAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
