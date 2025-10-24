<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:include href="header.xsl"/>
    <xsl:include href="senderReceiver.xsl"/>
    <xsl:include href="mailReason.xsl"/>
    <xsl:include href="footer.xsl"/>
    <xsl:include href="style.xsl"/>
    <xsl:include href="recordTitle.xsl"/>
    <xsl:template match="/">
        <html>
            <xsl:if test="notification_data/languages/string">
                <xsl:attribute name="lang">
                    <xsl:value-of select="notification_data/languages/string"/>
                </xsl:attribute>
            </xsl:if>

            <head>
                <xsl:call-template name="generalStyle"/>
            </head>
            <body>
                <xsl:attribute name="style">
                    <xsl:call-template name="bodyStyleCss"/>
                    <!-- style.xsl -->
                </xsl:attribute>
                <xsl:call-template name="head"/>

                <div class="messageArea">

                    <table>
                    <xsl:if test="notification_data/partner_name_and_inst !=''">
                        <tr>
                            <td>
                                <br/>
                                <xsl:value-of select="/notification_data/partner_name_and_inst"/>
                            </td>
                        </tr>
                    </xsl:if>
                        <xsl:if test="notification_data/rapid_partner_address !=''">
                            <tr>
                                <td>
                                    <br/>
                                    <xsl:value-of select="notification_data/rapid_partner_address"/>
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/line1 !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/line1" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/line2 !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/line2" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/line3 !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/line3" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/line4 !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/line4" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/line5 !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/line5" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/city !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/city" />
                                </td>
                            </tr>
                        </xsl:if>
                        <xsl:if test="notification_data/partner_address/country !=''">
                            <tr>
                                <td>
                                    <xsl:value-of select="notification_data/partner_address/country" />
                                </td>
                            </tr>
                        </xsl:if>
                    </table>
                    <div class="messageBody">
                        <table role='presentation'  cellspacing="0" cellpadding="5" border="0">
                            <xsl:attribute name="style">
                                <xsl:call-template name="listStyleCss"/>
                                <!-- style.xsl -->
                            </xsl:attribute>
                            <xsl:if test="notification_data/body !=''">
                                <tr>
                                    <td>
                                        <br/>
                                        <xsl:value-of select="notification_data/body" disable-output-escaping="yes"/>
                                    </td>
                                </tr>
                            </xsl:if>



                        </table>

                        <br/><br/>

                        <table role='presentation' >
                            <tr>
                                <td>@@signature@@</td>
                            </tr>
                            <tr>
                                <td>@@department@@</td>
                            </tr>

                        </table>
                    </div>
                </div>
                <xsl:call-template name="lastFooter"/>
                <!-- footer.xsl -->
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
