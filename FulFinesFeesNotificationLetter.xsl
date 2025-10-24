<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<!-- START AFN-VERSION 1.8 -->
	<!-- Check if an email partner. If it is, we're trying to send more of an invoice letter -->
	<xsl:variable name="is_email_partner">
		<xsl:if test="(notification_data/user_for_printing/user_group = 'NZILLUSER') or (notification_data/user/user_group = 'NZILLUSER')">
		TRUE
	</xsl:if>
	</xsl:variable>
	<!-- END AFN-VERSION 1.8 -->
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string"/>
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/letter_name"/>
				</title>
				<xsl:call-template name="generalStyle"/>
				<!-- style.xsl -->
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
						<!-- START AFN-VERSION 1.8 -->
						<xsl:choose>
							<!-- EMAIL PARTNER LETTER -->
							<xsl:when test="(string-length($is_email_partner) > 0)">
								<!-- Omni Email Partner receipt -->
								<!-- handle AFN supported languages (is_preferred_lang_fr) defined in footer.xsl-->
								<xsl:choose>
									<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
										<!-- Omni Email Partner receipt FRENCH-->
										<p id="email_partner_count_summary_id" align="right">
											<!-- AFN TODO - those institutions who need to support french invoices, place here -->
											<!-- since most institutions currently DO NOT have french invoices, we won't boiler plate -->
										</p>
									</xsl:when>
									<xsl:otherwise>
										<!-- Omni Email Partner receipt ENGLISH-->
										<p id="email_partner_request_lib_id" align="left">
											@@we_would_like@@
										</p>
										<p id="email_partner_count_summary_id" align="left">
											<strong>Total Number of Requests: <xsl:value-of select="count(notification_data/fines_fees_list/*)"/></strong>
										</p>
										<p id="email_partner_amount_summary_id" align="left">
											<strong>Total Amount Due: <xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/total_fines_currency"/></strong>
										</p>
										<p id="email_partner_info_id" align="left">
											<strong>Requesting Library: <xsl:value-of select="notification_data/user_for_printing/name"/>&#160;<xsl:value-of select="notification_data/user_for_printing/last_name"/></strong>
										</p>
										<table cellpadding="4" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
												<!-- style.xsl -->
											</xsl:attribute>
											<caption>Fine/Fee Details</caption>
											<tr>
												<th>@@fee_type@@</th>
												<th>Shipped</th>
												<th>Item</th>
												<th>@@fee_amount@@</th>
											</tr>
											<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
												<tr>
													<td>
														<xsl:value-of select="fine_fee_type_display"/>
													</td>
													<td>
														<xsl:value-of select="create_date"/>
													</td>
													<td>
														<xsl:value-of select="item_title"/>
													</td>
													<td>
														<xsl:value-of select="fine_fee_ammount/normalized_sum"/>
													</td>
												</tr>
											</xsl:for-each>
										</table>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<!-- END EMAIL PARTNER LETTER -->
							<!-- START CARLETON LETTER (for regular patrons) -->
							<xsl:otherwise>
								<p id="patron_lending_lib_id" align="left">
									@@we_would_like@@<br/>
									Your total balance is:  
									<strong>
										<xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/total_fines_currency"/>
									</strong>.
								</p>
								<table cellpadding="4" class="listing">
									<xsl:attribute name="style">
										<xsl:call-template name="mainTableStyleCss"/>
										<!-- style.xsl -->
									</xsl:attribute>
									<caption>Fine/Fee Details</caption>
									<tr>
										<th>@@fee_type@@</th>
										<th>@@fee_amount@@</th>
										<th>@@note@@</th>
										<th>@@line1@@</th>
									</tr>
									<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
										<tr>
											<td>
												<xsl:value-of select="fine_fee_type_display"/>
											</td>
											<td>
												<xsl:value-of select="fine_fee_ammount/normalized_sum"/>
											</td>
											<td>
												<xsl:value-of select="fine_comment"/>
											</td>
											<td>
												<xsl:value-of select="item_title"/>
											</td>
										</tr>
									</xsl:for-each>
									<xsl:if test="notification_data/fine_fee_notification_fee_amount/sum !=''">
										<tr>
											<td>
												<strong>@@fine_fee_notification_fee@@ </strong>
												<xsl:value-of select="notification_data/fine_fee_notification_fee_amount/normalized_sum"/>&#160;<xsl:value-of select="ff"/>
											</td>
										</tr>
									</xsl:if>
								</table>
								<p id="patron_local_payment_id" align="left">
									Please come to the Library Services Desk to pay your balance.
								</p>
								<!-- AFN letter decision tree? Commented this out; this letter should never send to AFN patrons in the first place, and as it's currently set up it would display WITH and AFTER the Carleton patron letter. -->
								<!-- <xsl:choose>									
									<xsl:when test="(string-length($is_afn_patron) > 0)">
										<xsl:choose>
											<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
												<p id="patron_afn_payment_id" align="left">
												Les options de paiement varient dans chaque bibliothèque Omni. Veuillez contacter votre bibliothèque d'origine pour plus de détails sur la façon de payer votre amende.
												</p>
											</xsl:when>
											<xsl:otherwise>
												<p id="patron_afn_payment_id" align="left">
												Payment options vary at each Omni library. Please contact your home library for details about how to pay your fine.
												</p>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
									Carleton patron footer from AFN choice
									</xsl:otherwise>
								</xsl:choose>
								-->
								@@sincerely@@<br/>
								@@department@@
							</xsl:otherwise>
							<!-- END CARLETON LETTER -->
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="(string-length($is_email_partner) > 0)">
								<!-- START AFN TODO Enter your institutions financial contact info -->
								<!-- email partner footer -->
								<p id="email_partner_financial_contact">                        
									For payment options, please contact our <strong>Interlibrary Loans Department</strong>:<br/><br/>
									Phone number: <xsl:call-template name="ILLphone"/>
												<br/>
									Email: <xsl:call-template name="ILLemail"/>
												<br/>
									Library Code: <xsl:call-template name="ILLLibraryCode"/>
									<br/>
								</p>
								<!-- END AFN TODO Enter your institutions financial contact info -->
							</xsl:when>
							<xsl:otherwise>
								<!-- standard patron footer -->
								<xsl:call-template name="AFNLastFooter"/>
								<xsl:call-template name="AFNAccount"/>
							</xsl:otherwise>
						</xsl:choose>
						<!-- END AFN-VERSION 1.8 -->
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
