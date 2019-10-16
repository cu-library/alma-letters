<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="head">
		<table border="0" cellpadding="5" cellspacing="0">
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
						<div class="alignLeft" id="logoContainer">
							<img alt="logo" src="cid:logo.jpg"/>
						</div>
					</div>
				</td>
			</tr>
			<!-- END OF LOGO INSERT -->
			<tr>
				<xsl:for-each select="notification_data/general_data">
					<td>
						<h1>@@letterName@@</h1>
					</td>
					<td align="right">
						<xsl:value-of select="current_date"/>
					</td>
				</xsl:for-each>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
