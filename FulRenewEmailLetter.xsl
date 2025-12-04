<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="mailReason.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />
	<xsl:include href="recordTitle.xsl" />
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
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
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
										We would like to renew the loan for the following resource sharing item. 
										Please let us know if renewal is possible and the new due date.
									</td>
								</tr>
						</table>
						<table>
						    
							<xsl:attribute name="style">
								<xsl:call-template name="listStyleCss" />
								<!-- style.xsl -->
							</xsl:attribute>

							<tr>
								<td>
									<strong>Material type: </strong>
									<xsl:value-of select="notification_data/request/display/material_type" />
								</td>
							</tr>
							<xsl:if test="notification_data/request/display/title !=''">
								<tr>
									<td>
										<strong>Title: </strong>
										<xsl:value-of select="notification_data/request/display/title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/journal_title !=''">
								<tr>
									<td>
										<strong>Journal title: </strong>
										<xsl:value-of select="notification_data/request/display/journal_title" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/author !=''">
								<tr>
									<td>
										<strong>Author: </strong>
										<xsl:value-of select="notification_data/request/display/author" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/publisher !=''">
								<tr>
									<td>
										<strong>Publisher: </strong>
										<xsl:value-of select="notification_data/request/display/publisher" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/place_of_publication !=''">
								<tr>
									<td>
										<strong>Place of publication: </strong>
										<xsl:value-of select="notification_data/request/display/place_of_publication" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/date !=''">
								<tr>
									<td>
										<strong>Publication date: </strong>
										<xsl:value-of select="notification_data/request/display/date" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/year !=''">
								<tr>
									<td>
										<strong>Year: </strong>
										<xsl:value-of select="notification_data/request/display/year" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/edition !=''">
								<tr>
									<td>
										<strong>Edition: </strong>
										<xsl:value-of select="notification_data/request/display/edition" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume !=''">
								<tr>
									<td>
										<strong>Volume: </strong>
										<xsl:value-of select="notification_data/request/display/volume" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issue !=''">
								<tr>
									<td>
										<strong>Issue: </strong>
										<xsl:value-of select="notification_data/request/display/issue" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/series_title_number !=''">
								<tr>
									<td>
										<strong>Series information: </strong>
										<xsl:value-of select="notification_data/request/display/series_title_number" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/isbn !=''">
								<tr>
									<td>
										<strong>ISBN: </strong>
										<xsl:value-of select="notification_data/request/display/isbn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/issn !=''">
								<tr>
									<td>
										<strong>ISSN: </strong>
										<xsl:value-of select="notification_data/request/display/issn" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/doi !=''">
								<tr>
									<td>
										<strong>DOI: </strong>
										<xsl:value-of select="notification_data/request/display/doi" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/pmid !=''">
								<tr>
									<td>
										<strong>PMID: </strong>
										<xsl:value-of select="notification_data/request/display/pmid" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/note !=''">
								<tr>
									<td>
										<strong>Note: </strong>
										<xsl:value-of select="notification_data/request/display/note" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/volume_bk !=''">
								<tr>
									<td>
										<strong>Volume: </strong>
										<xsl:value-of select="notification_data/request/display/volume_bk" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/display/part !=''">
								<tr>
									<td>
										<strong>Part: </strong>
										<xsl:value-of select="notification_data/request/display/part" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/note !=''">
								<tr>
									<td>
										<strong>Request note: </strong>
										<xsl:value-of select="notification_data/request/note" />
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="notification_data/request/external_request_id !=''">
								<tr>
									<td>
										<strong>Request ID: </strong>
										<xsl:value-of select="notification_data/request/external_request_id" />
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td>
									<strong>Date received: </strong>
									<xsl:value-of select="notification_data/request/item_arrival_date" />
								</td>
							</tr>

							<tr><td>&#xA0;</td></tr>

							<tr>
								<td>
									<strong>Original due date: </strong>
									<xsl:value-of select="notification_data/request/due_date" />
								</td>
							</tr>
							<tr>
								<td>
									<strong>Desired due date: </strong>
									<xsl:value-of select="notification_data/request/desired_due_date " />
								</td>
							</tr>

							<tr><td>&#xA0;</td></tr>

							<tr>
								<td>
									<strong>ILL staff note: </strong>
									<xsl:value-of select="notification_data/note_to_partner  " />
								</td>
							</tr>
						</table>
						
						<br />
						
						<table>
							<tr>
								<td>Sincerely,</td>
							</tr>
						</table>
					</div>
				</div>
				<xsl:call-template name="ILLFooterPeerToPeer" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
