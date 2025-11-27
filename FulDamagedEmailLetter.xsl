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
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<table>
					<tr>
						<td>
							Hello,
						</td>
					</tr>
				</table>
				<div class="messageArea">
					<div class="messageBody">
						<table>
									<tr>
										<td>
											The following resource sharing request item was reported to us as damaged:
										</td>
									</tr>
						</table>
						<table>
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss"/>
								<!-- style.xsl -->
							</xsl:attribute>
							<xsl:if test="notification_data/request/display/material_type != ''">
    							<tr>
    								<td>
                                        <strong>Material type: </strong>
    									<xsl:value-of select="notification_data/request/display/material_type"/>
    								</td>
    							</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/title !=''">
								<tr>
									<td>
                                        <strong>Title: </strong>
										<xsl:value-of select="notification_data/request/display/title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/journal_title !=''">
								<tr>
									<td>
                                        <strong>Journal title: </strong>
										<xsl:value-of select="notification_data/request/display/journal_title"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/author !=''">
								<tr>
									<td>
                                        <strong>Author: </strong>
										<xsl:value-of select="notification_data/request/display/author"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/publisher !=''">
								<tr>
									<td>
                                        <strong>Publisher: </strong>
										<xsl:value-of select="notification_data/request/display/publisher"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/place_of_publication !=''">
								<tr>
									<td>
                                        <strong> @@place_of_publication@@: </strong>
										<xsl:value-of select="notification_data/request/display/place_of_publication"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/date !=''">
								<tr>
									<td>
                                        <strong> @@publication_date@@: </strong>
										<xsl:value-of select="notification_data/request/display/date"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/year !=''">
								<tr>
									<td>
                                        <strong> @@year@@: </strong>
										<xsl:value-of select="notification_data/request/display/year"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/edition !=''">
								<tr>
									<td>
                                        <strong> @@edition@@: </strong>
										<xsl:value-of select="notification_data/request/display/edition"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/call_number !=''">
								<tr>
									<td>
                                        <strong> @@call_number@@: </strong>
										<xsl:value-of select="notification_data/request/display/call_number"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume !=''">
								<tr>
									<td>
                                        <strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/request/display/volume"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issue !=''">
								<tr>
									<td>
                                        <strong> @@issue@@: </strong>
										<xsl:value-of select="notification_data/request/display/issue"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/additional_person_name !=''">
								<tr>
									<td>
                                        <strong> @@additional_person_name@@: </strong>
										<xsl:value-of select="notification_data/request/display/additional_person_name"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/source !=''">
								<tr>
									<td>
                                        <strong> @@source@@: </strong>
										<xsl:value-of select="notification_data/request/display/source"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/series_title_number !=''">
								<tr>
									<td>
                                        <strong> @@series_title_number@@: </strong>
										<xsl:value-of select="notification_data/request/display/series_title_number"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/isbn !=''">
								<tr>
									<td>
                                        <strong> @@isbn@@: </strong>
										<xsl:value-of select="notification_data/request/display/isbn"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issn !=''">
								<tr>
									<td>
                                        <strong> @@issn@@: </strong>
										<xsl:value-of select="notification_data/request/display/issn"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/doi !=''">
								<tr>
									<td>
                                        <strong> @@doi@@: </strong>
										<xsl:value-of select="notification_data/request/display/doi"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/pmid !=''">
								<tr>
									<td>
                                        <strong> @@pmid@@: </strong>
										<xsl:value-of select="notification_data/request/display/pmid"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/note !=''">
								<tr>
									<td>
                                        <strong> @@note@@: </strong>
										<xsl:value-of select="notification_data/request/display/note"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/chapter !=''">
								<tr>
									<td>
                                        <strong> @@chapter@@: </strong>
										<xsl:value-of select="notification_data/request/display/chapter"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume_bk !=''">
								<tr>
									<td>
                                        <strong> @@volume@@: </strong>
										<xsl:value-of select="notification_data/request/display/volume_bk"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/part !=''">
								<tr>
									<td>
                                        <strong> @@part@@: </strong>
										<xsl:value-of select="notification_data/request/display/part"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/pages !=''">
								<tr>
									<td>
                                        <strong> @@pages@@: </strong>
										<xsl:value-of select="notification_data/request/display/pages"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/start_page !=''">
								<tr>
									<td>
                                        <strong> @@start_page@@: </strong>
										<xsl:value-of select="notification_data/request/display/start_page"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/end_page !=''">
								<tr>
									<td>
                                        <strong> @@end_page@@: </strong>
										<xsl:value-of select="notification_data/request/display/end_page"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note !=''">
								<tr>
									<td>
                                        <strong> @@request_note@@: </strong>
										<xsl:value-of select="notification_data/request/note"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
                                    <strong> @@date@@: </strong>
									<xsl:value-of select="notification_data/general_data/current_date"/>
								</td>
							</tr>
							<xsl:if test="notification_data/request/external_request_id !=''">
								<tr>
									<td>
                                        <strong> @@request_id@@: </strong>
										<xsl:value-of select="notification_data/request/external_request_id"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
                                    <strong> @@request_format@@: </strong>
									<xsl:value-of select="notification_data/request/format_display"/>
								</td>
							</tr>
							<tr>
								<td>
                                    <strong> @@receiving_date@@: </strong>
									<xsl:value-of select="notification_data/request/item_arrival_date"/>
								</td>
							</tr>
							<tr>
								<td>&#xA0;</td>
							</tr>
							<tr>
								<td>
                                    <strong> @@original_due_date@@: </strong>
									<xsl:value-of select="notification_data/request/due_date"/>
								</td>
							</tr>
							<tr>
								<td>
                                    <strong> @@desired_due_date@@: </strong>
									<xsl:value-of select="notification_data/request/desired_due_date "/>
								</td>
							</tr>
							<tr>
								<td>&#xA0;</td>
							</tr>
							<tr>
								<td>
                                    <strong> @@note_to_partner@@: </strong>
									<xsl:value-of select="notification_data/note_to_partner  "/>
								</td>
							</tr>
							<xsl:choose>
								<xsl:when test="notification_data/request/max_fee !=''">
									<tr>
										<td>
                                            <strong>@@maximum_fee@@: </strong>
											<xsl:value-of select="notification_data/request/max_fee"/>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
						</table>
						<br/>
						<table>
							<tr>
								<td>@@signature@@</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="notification_data/library/name"/>
								</td>
							</tr>
							<xsl:if test="notification_data/library/address/line1 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line1"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line2 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line2"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line3 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line3"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line4 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line4"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/line5 !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/line5"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/city !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/city"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/library/address/country !=''">
								<tr>
									<td>
										<xsl:value-of select="notification_data/library/address/country"/>
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
