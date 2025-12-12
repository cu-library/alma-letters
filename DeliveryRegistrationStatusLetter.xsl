<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
				<title>
					<xsl:value-of select="notification_data/general_data/subject"/>
				</title>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<xsl:call-template name="toWhomIsConcerned"/>
						<table>
							<tr>
								<td>
									<xsl:variable name="registrationStatus">
										<xsl:value-of select="notification_data/delivery_registration/status"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$registrationStatus = 'REGISTERED'">
											<p>
        										You have been added to the waitlist for 
        										&#34;<xsl:value-of select="notification_data/delivery_registration/title"/>&#34;.
        										Your current position in the waitlist is:
												<strong>
													<xsl:value-of select="notification_data/delivery_registration/number_in_queue"/>
												</strong>.
        									</p>
											<p>
            									We will send you another email once the resource becomes available.
            									You will have
            										<strong>
														<xsl:value-of select="notification_data/delivery_registration/grace_period"/> 
														minutes
													</strong>
            										to start using the resource. 
            										If you do not access the resource within that period, 
            										it will be passed on to the next person in the waitlist.
        									</p>
										</xsl:when>
										<xsl:when test="$registrationStatus = 'ITEM_AVAILABLE'">
											<xsl:variable name="deliveryUrl">
												<xsl:value-of select="notification_data/delivery_registration/delivery_url"/>
											</xsl:variable>
											<p>
									            &#34;<xsl:value-of select="notification_data/delivery_registration/title"/>&#34; 
										        is now available.
									        </p>
											<p>
												<a href="{$deliveryUrl}" target="_blank">Access Resource</a>
											</p>
											<p>
									            You have
    										    <strong>
													<xsl:value-of select="notification_data/delivery_registration/grace_period"/>
    										        minutes
    										    </strong> 
    										    to access the resource before it is passed to the next person in the waitlist.
									        </p>
										</xsl:when>
										<xsl:when test="$registrationStatus = 'GRACE_PERIOD_EXPIRED'">
											<xsl:variable name="deliveryUrl">
												<xsl:value-of select="notification_data/delivery_registration/delivery_url"/>
											</xsl:variable>
											<p>
												Your access window for
												&#34;<xsl:value-of select="notification_data/delivery_registration/title"/>&#34; 
												has expired.
											</p>
											<p>
												You may
												<a href="{$deliveryUrl}" target="_blank">rejoin the waitlist</a>
												if you wish.
											</p>
										</xsl:when>
										<xsl:when test="$registrationStatus = 'REMOVED'">
											<p>
												You have been removed from the waitlist for
												&#34;<xsl:value-of select="notification_data/delivery_registration/title"/>&#34;.
											</p>
											<p>
												For more information, please contact the library.
											</p>
										</xsl:when>
										<xsl:otherwise>
    										<!-- This is empty for some reason? Maybe if there's no status it should just abort the letter. - Alex -->
    									</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td>Sincerely,</td>
							</tr>
							<xsl:call-template name="courseReservesSignature" />
						</table>
					</div>
				</div>
				<!-- footer.xsl -->
				<xsl:call-template name="courseReservesFooter"/>
				<xsl:call-template name="myAccount"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
