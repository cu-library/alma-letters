<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="toWhomIsConcerned">
		<table>
			<tr>
				<td>
					<xsl:for-each select="notification_data">
						<span>Hi,</span>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
