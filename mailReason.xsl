<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="toWhomIsConcerned">
		<table style="padding: 5px;">
			<tr>
				<td>
					<xsl:for-each select="notification_data">
						<span>@@dear@@</span>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
</xsl:stylesheet>
