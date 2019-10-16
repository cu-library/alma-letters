<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="salutation">
	</xsl:template>
	<xsl:template name="lastFooter">
	</xsl:template>
	<xsl:template name="contactUs">
		<table align="left">
			<tr>
				<td align="left">
					<a>
						<xsl:attribute name="href">@@email_contact_us@@
                        </xsl:attribute>@@contact_us@@</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="myAccount">
		<table align="right">
			<tr>
				<td align="right">
					<a>
						<xsl:attribute name="href">@@email_my_account@@
                        </xsl:attribute>@@my_account@@</a>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
