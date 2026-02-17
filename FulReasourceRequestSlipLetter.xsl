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
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
			    <xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<h1>
				    Requested for: <xsl:value-of select="notification_data/user_for_printing/name"/>
				</h1>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
								<tr>
									<td>
										<strong>Please note: A specific item is specified in this request.</strong>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/manual_description != ''">
								<tr>
									<td>
										<strong>Please note: </strong>The following manual description has been specified in this request -
										<xsl:value-of select="notification_data/request/manual_description"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong>Request ID: </strong>
									<xsl:value-of select="notification_data/request_id"/>
									<br/>
									<img alt="Request Barcode" src="cid:request_id_barcode.png"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Item barcode image: </strong>
									<img alt="Item Barcode Image" src="cid:item_id_barcode.png"/>
								</td>
							</tr>
							<xsl:for-each select="/notification_data/phys_item_display/available_items/available_item">
								<tr>
									<td>
										<strong>Item barcode: </strong>
										<xsl:value-of select="barcode"/>
										<!-- COMMENTED OUT UNTIL APPROVAL  
										<xsl:call-template name="LAXbarcode"/>
										-->
									</td>
								</tr>
							</xsl:for-each>
							<xsl:if test="notification_data/external_id != ''">
								<tr>
									<td>
										<strong>External ID: </strong>
										<xsl:value-of select="notification_data/external_id"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/user_for_printing/name != ''">
								<tr>
									<td>
										<strong>Requested for: </strong>
										<xsl:value-of select="notification_data/user_for_printing/name"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<xsl:call-template name="recordTitle"/>
								</td>
							</tr>
							<xsl:if test="notification_data/phys_item_display/isbn != ''">
								<tr>
									<td>ISBN:

										<xsl:value-of select="notification_data/phys_item_display/isbn"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/issn != ''">
								<tr>
									<td>ISSN:

										<xsl:value-of select="notification_data/phys_item_display/issn"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/edition != ''">
								<tr>
									<td>Edition:

										<xsl:value-of select="notification_data/phys_item_display/edition"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/imprint != ''">
								<tr>
									<td>Imprint:

										<xsl:value-of select="notification_data/phys_item_display/imprint"/>
									</td>
								</tr>
							</xsl:if>
							<b/>
							<tr>
								<td>
									<h2>
										<strong>Location: </strong>
										<xsl:value-of select="notification_data/phys_item_display/location_name"/>
									</h2>
								</td>
								<xsl:if test="notification_data/phys_item_display/call_number != ''">
									<td>
										<h2>
											<strong>Call number: </strong>
											<xsl:value-of select="notification_data/phys_item_display/call_number"/>
										</h2>
									</td>
								</xsl:if>
								<xsl:if test="notification_data/phys_item_display/accession_number != ''">
									<td>
										<h2>
											<strong>Accession number: </strong>
											<xsl:value-of select="notification_data/phys_item_display/accession_number"/>
										</h2>
									</td>
								</xsl:if>
							</tr>
							<xsl:if test="notification_data/phys_item_display/shelving_location/string">
								<xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
									<tr>
										<td>
											<strong>Shelving location: </strong>
											<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/request/selected_inventory_type='HOLDING'">
									<tr>
										<td>
											<strong>@@shelving_locations_for_holding@@: </strong>
											<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'">
									<tr>
										<td>
											<strong>@@shelving_locations_for_holding@@: </strong>
											<xsl:for-each select="notification_data/phys_item_display/shelving_location/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<xsl:if test="notification_data/phys_item_display/display_alt_call_numbers/string">
								<xsl:if test="notification_data/request/selected_inventory_type='ITEM'">
									<tr>
										<td>
											<strong>@@alt_call_number@@: </strong>
											<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/request/selected_inventory_type='HOLDING'">
									<tr>
										<td>
											<strong>@@alt_call_number@@: </strong>
											<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/request/selected_inventory_type='VIRTUAL_HOLDING'">
									<tr>
										<td>
											<strong>@@alt_call_number@@: </strong>
											<xsl:for-each select="notification_data/phys_item_display/display_alt_call_numbers/string">
												<xsl:value-of select="."/>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<b/>
							<tr>
								<td>
									<strong>Destination: </strong>
									<xsl:value-of select="notification_data/destination"/>
									<br/>
									<!-- ADDS IN DELIVERY ADDRESS IF THE ADDRESS IS DIFFERENT FROM DESTINATION VALUE -->
									<xsl:if test="not(notification_data/destination=notification_data/request/delivery_address)">
										<strong>Address</strong>: <xsl:value-of select="notification_data/request/delivery_address"/>
									</xsl:if>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Request type: </strong>
									<xsl:value-of select="notification_data/request_type"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/system_notes != ''">
								<tr>
									<td>
										<strong>System notes:</strong>
										<xsl:value-of select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note != ''">
								<tr>
									<td>
										<strong>Request note:</strong>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
