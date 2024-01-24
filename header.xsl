<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="head">
		<!-- START AFN CODE - Check if an email partner. If it is, we're trying to send more of an invoice letter -->
		<xsl:variable name="is_email_partner">
			<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER')">
			TRUE
		</xsl:if>
		</xsl:variable>
		<!-- END OF AFN CODE -->
		<table cellspacing="0" cellpadding="5" border="0">
			<xsl:attribute name="style">
				<xsl:call-template name="headerTableStyleCss"/>
				<!-- style.xsl -->
			</xsl:attribute>
			<!-- LOGO INSERT -->
			<tr>
				<xsl:attribute name="style">
					<xsl:call-template name="headerLogoStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<td colspan="2">
					<div id="mailHeader">
						<div id="logoContainer" class="alignLeft">
							<!-- AFN CODE -->
							<xsl:choose>
								<xsl:when test="(notification_data/user_for_printing/user_group = 'AFNUSER') or (notification_data/user/user_group = 'AFNUSER') or (notification_data/request/user_group = 'AFNUSER') or (notification_data/user_for_printing/user_group = 'TUGUSER') or (notification_data/user/user_group = 'TUGUSER') or (notification_data/request/user_group = 'TUGUSER')">
									<img src="https://ocul.on.ca/omni/images/omni_logo_for_letters.jpg" alt="Omni logo"/>
								</xsl:when>
								<xsl:otherwise>
									<!-- AFN TODO -->
									<img alt="Carleton University logo" src="cid:logo.jpg"/>
									<!-- END OF AFN TODO -->
								</xsl:otherwise>
							</xsl:choose>
							<!-- END OF AFN CODE -->
						</div>
					</div>
				</td>
			</tr>
			<!-- END OF LOGO INSERT -->
			<tr>
				<xsl:for-each select="notification_data/general_data">
					<td>
						<h1>
							<xsl:value-of select="letter_name"/>
						</h1>
					</td>
					<td align="right">
						<xsl:value-of select="current_date"/>
					</td>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>