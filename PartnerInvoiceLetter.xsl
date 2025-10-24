<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:include href="header.xsl" />
    <xsl:include href="senderReceiver.xsl" />
    <xsl:include href="mailReason.xsl" />
    <xsl:include href="footer.xsl" />
    <xsl:include href="style.xsl" />
    <xsl:template match="/">
        <html>
            <xsl:if test="notification_data/languages/string">
                <xsl:attribute name="lang">
                    <xsl:value-of select="notification_data/languages/string"/>
                </xsl:attribute>
            </xsl:if>

            <head>
                <title>
                    <xsl:value-of select="notification_data/general_data/subject"/>
                </title>

                <xsl:call-template name="generalStyle" />
            </head>

            <body>
                <xsl:attribute name="style">
                    <xsl:call-template name="bodyStyleCss" />
                </xsl:attribute>

                <xsl:call-template name="head" />
                <xsl:call-template name="senderReceiver" />

                <br />
                <xsl:call-template name="toWhomIsConcerned" /> <!-- mailReason.xsl -->

                <xsl:if  test="notification_data/invoice_id != ''" >
                    <h4>@@invoiceNumber@@: <xsl:value-of select="/notification_data/invoice_id"/></h4>
                </xsl:if>

                <table cellpadding="5" class="listing">
                    <xsl:attribute name="style">
                        <xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
                    </xsl:attribute>
                    <tr>
                        <th>@@externalIdentifier@@</th>
                        <th>@@title@@</th>
                        <th>@@feeType@@</th>
                        <th>@@chargeAmount@@</th>
                    </tr>
                    <xsl:for-each select="notification_data/lending_request_fee_list/lending_request_fee">
                        <tr>
                            <xsl:if  test="external_identifier != '0' and external_identifier != '1'" >
                                <td><xsl:value-of select="external_identifier"/></td>
                            </xsl:if>
                            <xsl:if  test="external_identifier = '0' or external_identifier = '1'" >
                                <td></td>
                            </xsl:if>
                            <td><xsl:value-of select="title"/></td>
                            <xsl:if  test="external_identifier != '0' and external_identifier != '1'" >
                                <td><xsl:value-of select="fee_type"/></td>
                                <td align="right"><xsl:value-of select="charge_amount"/>&#160;<xsl:value-of select="currency"/></td>
                            </xsl:if>
                            <xsl:if  test="external_identifier = '0' or external_identifier = '1'" >
                                <strong><td><xsl:value-of select="fee_type"/></td></strong>
                                <strong><td align="right"><xsl:value-of select="charge_amount"/>&#160;<xsl:value-of select="currency"/></td></strong>
                            </xsl:if>
                            <xsl:if test="external_identifier = '0'">
                                <tr>
                                    <td colspan="4">
                                        <div style="border-top: 3px solid black; margin: 0;"></div>
                                    </td>
                                </tr>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </table>

                <br />
                <table role='presentation' >

                    <tr><td>@@sincerely@@</td></tr>
                    <tr><td>@@department@@</td></tr>

                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>


