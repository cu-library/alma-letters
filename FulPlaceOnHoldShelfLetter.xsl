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
					<xsl:call-template name="bodyStyleCss"/> <!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/> <!-- header.xsl -->
				<br/>
				<xsl:call-template name="senderReceiver"/> <!-- SenderReceiver.xsl -->
				<br/>
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<tr>
								<td>
									The item(s) you have requested are ready for curbside pick-up or are being prepared for mail delivery.
								</td>
							</tr>
							<tr>
								<td>
									If you have chosen curbside pick-up: Upon arrival please remain in your vehicle, have your Banner ID/Student Number readily available, and call <a href="tel:1-343-996-9167">(343) 996-9167</a>. Due to construction in the Dunton Tower parking lot, our curbside pickup location has been slightly relocated up library road to the book return slot/door on the exterior of the library building. Parking is still available along library road for short pickups. 
								</td>
							</tr>
							<tr>
								<td>
									<br>
									Visit <a href="https://library.carleton.ca/services/curbside-pick-and-mail-delivery-library-print-collection">
									https://library.carleton.ca/services/curbside-pick-and-mail-delivery-library-print-collection</a> for additional information on how to pick-up items from the library.  <strong>Curbside pickup is open Monday to Friday, 9:00 am - 12:00pm and 1:00pm-4:00pm.</strong>
								</td>
							</tr>
							<tr>
								<td>
								    <br>
									If you have chosen the mail delivery option: Please email your mailing address to <a href="mailto:library.services@carleton.ca">library.services@carleton.ca</a> and a staff member will reach out to confirm details. 
								</td>
							</tr>
						</table>
						<table border="0" cellpadding="5" cellspacing="0">
							<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
								<tr>
									<td>@@note_item_held_until@@
										<xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>
										.</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<xsl:call-template name="recordTitle"/> <!-- recordTitle.xsl -->
								</td>
							</tr>
							<xsl:if test="notification_data/request/system_notes">
								<tr>
									<td>
										<b>@@notes_affect_loan@@:</b>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>
						</table>
						<br/>
						<table>
							<tr>
								<td>For more information please login to your <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/login?vid=01OCUL_CRL:CRL_DEFAULT">Library Account</a>.</td>
							</tr>
							<tr>
								<td>If you have any questions please contact a staff member from Access Services at <a href="mailto:library.services@carleton.ca">library.services@carleton.ca</a> or 613-520-2600 x2734.</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="lastFooter"/> <!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
