<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<!-- Location variable to be used for excluding items that aren't in the location we want. -->
	<xsl:variable name="location" select="notification_data/phys_item_display/location_name"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:if test="notification_data/user_for_printing/name!=''">
					<h1 class="minimize-space">
				    Requested for: <xsl:value-of select="notification_data/user_for_printing/name"/>
					</h1>
				</xsl:if>
				<xsl:call-template name="printedSlipHead"/>
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<!-- START OF BARCODE SECTION -->
						<table>
							<xsl:if test="/notification_data/phys_item_display/barcode!=''">
								<tr>
									<td>
										<strong>@@item_barcode@@:<br/>
										</strong>
									</td>
									<td>
										<!-- Displays all available barcodes. -->
										<!-- 
										Barcode information can appear in two different sections of the XML. 
										This is the first potential node. 
										-->
										<!-- AFN items seem to put barcode info in this node. -->
										<xsl:for-each select="/notification_data/phys_item_display">
											<!-- 
										We are going to prevent it from displaying barcodes that don't match 
										our preferred location. Basically this excludes RSV and LAX items 
										from displaying unless they are the only place where the item is 
										available. 
										-->
											<xsl:if test="$location = location_name">
												<!-- 
														Separated out version of barcode. 
														Only shows up for LAX items. 
														-->
												<xsl:call-template name="LAXbarcode"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<!-- 
							Second (more often used) XML section where barcode info is available from. 
							Code chunk follows the same pattern as above. 
							-->
							<xsl:if test="/notification_data/phys_item_display/barcode='' and /notification_data/phys_item_display/available_items/available_item/barcode!=''">
								<tr>
									<td>
										<strong>@@item_barcode@@:</strong>
									</td>
									<td>
										<xsl:for-each select="/notification_data/phys_item_display/available_items/available_item">
											<xsl:if test="$location = location_name">
												<!-- 
														Separated out version of barcode. 
														Only shows up for LAX items. 
														-->
												<xsl:call-template name="LAXbarcode"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
							</xsl:if>
							<!-- 
							Barcode image will only display when there is a barcode.
							If there's multiple barcodes, barcode image will probably be broken.
							Leaving it in in those cases anyways because I'm not 100% sure why/when it fails.
							-->
							<xsl:choose>
								<xsl:when test="(/notification_data/phys_item_display/barcode='' 
							                        or not(/notification_data/phys_item_display/barcode)) 
							                        and (/notification_data/phys_item_display/available_items/available_item/barcode='' 
							                        or not(/notification_data/phys_item_display/available_items/available_item/barcode) )">
							        </xsl:when>
								<xsl:otherwise>
									<tr>
										<td colspan="2">
											<img alt="Item Barcode Image" src="cid:item_id_barcode.png"/>
										</td>
									</tr>
								</xsl:otherwise>
							</xsl:choose>
						</table>
						<!-- END OF barcode section -->
						<hr/>
						<!-- START OF BIBLIOGRAPHIC INFO -->
						<div>
							<h2 class="location-call-title">
								<strong>Location: </strong>
								<xsl:value-of select="notification_data/phys_item_display/location_name"/>
								<br/>
								<strong>Call number: </strong>
								<xsl:choose>
									<xsl:when test="notification_data/phys_item_display/display_alt_call_numbers/string!=''">
										<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
											<xsl:value-of select="."/>
											<br/>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="notification_data/phys_item_display/call_number"/>
										<br/>
									</xsl:otherwise>
								</xsl:choose>
								<strong>Title: </strong>
								<xsl:value-of select="notification_data/phys_item_display/title"/>
							</h2>
						</div>
						<div class="slip-spacing">
							<xsl:if test="notification_data/phys_item_display/author !=''">
								<strong>Author: </strong>
								<xsl:value-of select="notification_data/phys_item_display/author"/>
								<br/>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
								<strong>Description: </strong>
								<xsl:value-of select="notification_data/phys_item_display/issue_level_description"/>
								<br/>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/isbn != ''">
								<strong>ISBN: </strong>
								<xsl:value-of select="notification_data/phys_item_display/isbn"/>
								<br/>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issn != ''">
								<strong>ISSN: </strong>
								<xsl:value-of select="notification_data/phys_item_display/issn"/>
								<br/>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/edition != ''">
								<strong>Edition: </strong>
								<xsl:value-of select="notification_data/phys_item_display/edition"/>
								<br/>
							</xsl:if>
							<!--
    							"manual_description" seems to appear on requests for records that have
    							no items. The manual_description value is a concatenation of Description field
    							and Publication Date field from the request form in Primo. 
    							Basically, this would only come up very rarely.
    						-->
							<xsl:if test="notification_data/request/manual_description != ''">
								<strong>The requester has added the following description: </strong>
								<xsl:value-of select="notification_data/request/manual_description"/>
							</xsl:if>
						</div>
						<!-- END OF BIBLIOGRAPHIC INFO -->
						<hr/>
						<!-- START OF REQUEST INFO -->
						<div class="slip-spacing">
							<!-- 
    							DESTINATION FIELD
    							Does not display if the destination is either "MacOdrum Library" or Library Services Desk"
    							(as both of these are standard.)
    							If the destination displays AND there is a user address, display first part of user address as "office location"
    							for Office Delivery.
    							-->
							<xsl:if test="/notification_data/destination!='MacOdrum Library' and /notification_data/destination!='Library Services Desk'">
								<p>
									<strong>Destination: </strong>
									<xsl:value-of select="notification_data/destination"/>
									<xsl:if test="/notification_data/user_for_printing/address1!=''">
										<br/>
										<strong>Office location: </strong>
										<xsl:value-of select="/notification_data/user_for_printing/address1"/>
									</xsl:if>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/external_id != ''">
								<p>
									<strong>External ID: </strong>
									<xsl:value-of select="notification_data/external_id"/>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/shelving_location/string!=''">
								<p>
									<strong>Annex shelving location: </strong>
									<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
										<xsl:value-of select="."/>
									</xsl:for-each>
								</p>
							</xsl:if>
							<xsl:if test="notification_data/request/system_notes != ''">
								<p>
									<strong>System notes: </strong>
									<xsl:value-of select="notification_data/request/system_notes"/>
								</p>
							</xsl:if>
							<p>
								<strong>Request type: </strong>
								<xsl:value-of select="notification_data/request_type"/>
							</p>
							<xsl:if test="notification_data/request/note != ''">
								<p>
									<strong>Request note: </strong>
									<xsl:value-of select="notification_data/request/note"/>
								</p>
							</xsl:if>
						</div>
						<table>
							<tr>
								<td>
									<strong>Request ID: </strong>
									<xsl:value-of select="notification_data/request_id"/>
									<br/>
									<img alt="Request Barcode" src="cid:request_id_barcode.png"/>
								</td>
							</tr>
						</table>
					</div>
					<!-- END OF REQUEST INFO -->
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
