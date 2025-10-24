<?xml version="1.0" encoding="utf-8" standalone="no" ?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xsl:version="1.0">
	<xsl:output method="xml" encoding="utf-8" indent="yes"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />
	<xsl:template match="/">
		<xsl:element name="html">
			<xsl:element name="body">
				<xsl:text>
					Hello, <br />
				</xsl:text>
				<xsl:text>
					You got a new feedback from
					<xsl:value-of select="/notification_data/user_email" />
				</xsl:text>
				<xsl:text> . <br /> <br /> </xsl:text>
				<xsl:text>
					<strong>Problem Description:</strong>
					<xsl:value-of
					select="/notification_data/problem_description" /> <br />
				</xsl:text>
				<xsl:text>
					<strong>Relevant URL:</strong>
					<xsl:value-of
					select="/notification_data/relevant_url" /> <br /> <br />
				</xsl:text>
				<xsl:text>
					<strong>Browser:</strong>
					<xsl:value-of select="/notification_data/browser" /> <br />
				</xsl:text>
				<xsl:text>
					<strong>Device:</strong>
					<xsl:value-of select="/notification_data/device" /> <br /> <br />
				</xsl:text>
				<xsl:text>
					Thank you  <br /> <br />
				</xsl:text>
				<xsl:text>
					* Please note we make the best effort to ensure that this message is error and virus free. <br />
				</xsl:text>
				<xsl:text>
					If you don&apos;t trust the sender of this message do not click on any of the above links, respond to the email,
 					or provide any sensitive information.
               	</xsl:text>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>