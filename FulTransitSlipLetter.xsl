<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<!-- AFN-VERSION 1.4 some values to test on around org names -->
	<xsl:variable name="destination_inst_code">
		<!-- ADD IF EMPTY, SET VALUE TO TEXT THAT WILL FAIL THE CONTAINS CODE, LIKE A NULL CHECK  -->
		<xsl:value-of select="notification_data/request/work_flow_entity/destination_institution_code"/>
	</xsl:variable>
	<xsl:variable name="not_local_institution_name">
		<!-- populated when item is not local, ie at AFN destination  use if not empty-->
		<xsl:value-of select="notification_data/request/out_of_institution_owner_institution_name"/>
	</xsl:variable>
	<!-- END OF AFN-VERSION 1.4 -->
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
					<strong>Send @@to@@:
                <!-- START OF AFN-VERSION 1.5 -->
						<xsl:choose>
							<xsl:when test="notification_data/request/calculated_destination_name != ''">
								<xsl:value-of select="notification_data/request/calculated_destination_name"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="notification_data/request/out_of_institution_owner_institution_name"/>
							</xsl:otherwise>
						</xsl:choose>
						<!-- END OF AFN-VERSION 1.5 -->
					</strong>
				</h1>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table>
							<tr>
								<td>
									<strong>@@print_date@@: </strong>
									<xsl:value-of select="notification_data/request/create_date"/>
-									<xsl:value-of select="notification_data/request/create_time"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@request_id@@: </strong>
									<img src="cid:request_id_barcode.png" alt="Request Barcode"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@item_barcode@@: </strong>
									<img src="cid:item_id_barcode.png" alt="Item Barcode"/>
								</td>
							</tr>
						</table>
						<table>
							<tr>
								<td><p>@@we_are_transferring_item_below@@</p></td>
							</tr>
							<tr>
								<!-- AFN-VERSION 1.4 adjust from statement (replace td tag) to use org name template -->
								<!--
									replace the institution code in assigned_unit_name with the org name of the owning institution (ie the from) based on the code
									IF an institution code exists in the assigned_unit_name value
									<destination_institution_code>01OCUL_YOR</destination_institution_code>
								-->
								<td>
									<strong>@@from@@: </strong>
									<xsl:choose>
										<xsl:when test="(string-length($destination_inst_code) > 0) and (contains(notification_data/request/assigned_unit_name, $destination_inst_code))">
											<xsl:call-template name="AFNOrgName"/>
											<xsl:value-of select="substring-after(notification_data/request/assigned_unit_name, $destination_inst_code)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="notification_data/request/assigned_unit_name"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<!-- END OF AFN-VERSION 1.4 -->
							</tr>
							<tr>
								<!-- START OF AFN-VERSION 1.5 -->
								<td>
									<strong>@@to@@: </strong>
									<xsl:choose>
										<xsl:when test="notification_data/request/calculated_destination_name != ''">
											<xsl:value-of select="notification_data/request/calculated_destination_name"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="notification_data/request/out_of_institution_owner_institution_name"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<!-- END OF AFN-VERSION 1.5 -->
							</tr>
						</table>
						<table>
							<tr>
								<td>
									<strong>@@transfer_date@@: </strong>
									<xsl:value-of select="notification_data/request/create_date"/>
								</td>
							</tr>
							<tr>
								<td>
									<strong>@@transfer_time@@: </strong>
									<xsl:value-of select="notification_data/request/create_time"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/material_type_display">
								<tr>
									<td>
										<strong>@@material_type@@: </strong>
										<xsl:value-of select="notification_data/request/material_type_display"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/user_for_printing/note">
								<tr>
									<td>
										<strong>@@user_note@@:</strong>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/note"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/system_notes">
								<tr>
									<td>
										<strong>@@system_notes@@:</strong>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/system_notes"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note">
								<tr>
									<td>
										<strong>@@request_note@@:</strong>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/user_for_printing/name">
								<tr>
									<td>
										<strong>@@requested_for@@:</strong>
									</td>
								</tr>
								<tr>
									<td>
										<xsl:value-of select="notification_data/user_for_printing/name"/>
									</td>
								</tr>
								<xsl:if test="notification_data/user_for_printing/email">
									<tr>
										<td>
											<strong>@@email@@: </strong>
											<xsl:value-of select="notification_data/user_for_printing/email"/>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="notification_data/user_for_printing/phone">
									<tr>
										<td>
											<strong>@@tel@@: </strong>
											<xsl:value-of select="notification_data/user_for_printing/phone"/>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<strong>@@request_date@@: </strong>
										<xsl:value-of select="notification_data/request/create_date"/>
									</td>
								</tr>
								<xsl:if test="notification_data/request/lastInterestDate">
									<tr>
										<td>
											<strong>@@expiration_date@@: </strong>
											<xsl:value-of select="notification_data/request/lastInterestDate"/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
						</table>
						<table>
							<tr>
								<td>
									<xsl:call-template name="recordTitle"/>
								</td>
							</tr>
						</table>
						<table>
							<xsl:if test="notification_data/phys_item_display/owning_library_name">
								<tr>
									<!-- AFN-VERSION 1.4 adjust owning library to use org name template -->
									<td>
										<strong>@@owning_library@@: </strong>
										<xsl:choose>
											<xsl:when test="(string-length($destination_inst_code) > 0) and (contains(notification_data/request/assigned_unit_name, $destination_inst_code))">
												<xsl:call-template name="AFNOrgName"/> - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>
											</xsl:when>
											<xsl:when test="(string-length($not_local_institution_name) > 0)">
												<xsl:value-of select="notification_data/request/out_of_institution_owner_institution_name"/> - <xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="notification_data/phys_item_display/owning_library_name"/>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<!-- END OF AFN-VERSION 1.4 -->
								</tr>
							</xsl:if>
						</table>
					</div>
				</div>
				<!-- recordTitle.xsl -->
				<xsl:call-template name="lastFooter"/>
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>