<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="senderReceiver">
		<table border="0" cellpadding="5" cellspacing="0" width="100%">
			<tr>
				<td width="50%">
					<xsl:choose>
						<xsl:when test="notification_data/user_for_printing">
							<table border="0" cellpadding="5" cellspacing="0">
								<xsl:attribute name="style">
									<xsl:call-template name="listStyleCss"/>
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<td>
										<b>
											<xsl:value-of select="notification_data/user_for_printing/name"/>
										</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/address1"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/address2"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/address3"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/address4"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/address5"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/city"/>
										 
										<xsl:value-of select="notification_data/user_for_printing/postal_code"/>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/state"/>
										 
										<xsl:value-of select="notification_data/user_for_printing/country"/>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="notification_data/receivers/receiver/user">
							<xsl:for-each select="notification_data/receivers/receiver/user">
								<table>
									<xsl:attribute name="style">
										<xsl:call-template name="listStyleCss"/>
										<!-- style.xsl -->
									</xsl:attribute>
									<tr>
										<td>
											<b>
												<xsl:value-of select="last_name"/>
												<xsl:value-of select="first_name"/>
											</b>
										</td>
									</tr>
								</table>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
				</td>
				<td align="right" width="50%">
					<xsl:for-each select="notification_data/organization_unit">
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<tr>
								<td>
									<xsl:value-of select="name"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/line1"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/line2"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/city"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/postal_code"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="address/country"/>
								</td>
							</tr>
						</table>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
