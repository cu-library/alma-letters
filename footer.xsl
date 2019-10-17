<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="salutation">
	</xsl:template>
	<xsl:template name="lastFooter">
		<table>
			<tr>
				<td>
					For more information please visit your
					<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.
				</td>
			</tr>
			<tr>
				<td>If you have any questions please contact a staff member from Access Services at
					<a href="mailto:libcirc@carleton.ca">libcirc@carleton.ca</a>
					or 613-520-2600 x2734.</td>
			</tr>
		</table>
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
