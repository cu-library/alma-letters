<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:variable name="conta1">0</xsl:variable>
	<xsl:variable name="stepType" select="/notification_data/request/work_flow_entity/step_type"/>
	<xsl:variable name="externalRequestId" select="/notification_data/external_request_id"/>
	<xsl:variable name="externalSystem" select="/notification_data/external_system"/>
	<xsl:variable name="isDeposit" select="/notification_data/request/deposit_indicator"/>
	<xsl:variable name="isDigitalDocDelivery" select="/notification_data/digital_document_delivery"/>

	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle" />
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->
				<xsl:call-template name="senderReceiver" />
				<!-- SenderReceiver.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>@@your_request@@</td>
							</tr>
							<xsl:choose>
								<xsl:when test="notification_data/request/part = 'EXTERNAL' ">
									<xsl:if test="notification_data/request/chapter_article_title !=''">
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/chapter_article_title"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/chapter_article_author !=''">
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/chapter_article_author"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/notes !=''">
										<tr>
											<td>
												<xsl:value-of select="notification_data/request/notes"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/volume !=''">
										<tr>
											<td>Volume: <xsl:value-of select="notification_data/request/volume"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/issue !=''">
										<tr>
											<td>Issue: <xsl:value-of select="notification_data/request/issue"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:if test="notification_data/request/chapter_article_title !=''">
										<tr>
											<td>@@title@@: <xsl:value-of select="notification_data/request/chapter_article_title"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/chapter_article_author !=''">
										<tr>
											<td>Author: <xsl:value-of select="notification_data/request/chapter_article_author"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/notes !=''">
										<tr>
											<td>Notes: <xsl:value-of select="notification_data/request/notes"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/volume !=''">
										<tr>
											<td>Volume: <xsl:value-of select="notification_data/request/volume"/>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="notification_data/request/issue !=''">
										<tr>
											<td>Issue: <xsl:value-of select="notification_data/request/issue"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>

							<tr>

								<!-- AFN-VERSION 1.4  adjust download urls -->
								<!-- build the local doc delivery -->
								<xsl:variable name="local_download">
									<!-- populated both local and ISO resource sharing but need to replace lowercase local with upper -->
									<!-- https://ocul-gue.alma.exlibrisgroup.com/services/login?auth=local&amp;digitalDoc=2502461080005152:null-01OCULGUE0017823-->
									<xsl:variable name="url_local" select="notification_data/download_url_local"/>
									<xsl:value-of select="substring-before($url_local, 'auth=local')"/>
									auth=LOCAL
									<xsl:value-of select="substring-after($url_local, 'auth=local')"/>
								</xsl:variable>

								<xsl:variable name="saml_download">
									<!-- populated both local and ISO resource sharing put does not have our idpCode (UG-SSO) in our download url-->
									<!-- https://ocul-gue.alma.exlibrisgroup.com/services/login?auth=SAML&amp;idpCode=&amp;digitalDoc=2502461080005152:null-01OCULGUE0017823-->
									<xsl:variable name="url_saml" select="notification_data/download_url_saml"/>
									<!-- AFN TODO CHANGE to YOUR IDPCODE (SAML AUTH)-->
									<xsl:value-of select="substring-before($url_saml, 'idpCode=')"/>
									idpCode=UG-SSO
									<xsl:value-of select="substring-after($url_saml, 'idpCode=')"/>
								<!-- END OF AFN TODO -->
								</xsl:variable>
								<!-- END OF AFN-VERSION 1.4 -->

								<!-- Check if it's an omafra user -(OMA) then use local login user/passwd OTHERWISE it's SAML AUTH -->
								<xsl:choose>
									<xsl:when test="notification_data/request/user_statistics1 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics2 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics3 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics4 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics5 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics6 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics7 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics8 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics9 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:when test="notification_data/request/user_statistics10 = 'OMA' ">
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$local_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
									</xsl:when>
									<xsl:otherwise>
										<!-- AFN-VERSION 1.4  adjust download urls -->
										<td>
											<a>
												<xsl:attribute name="href">
													<xsl:value-of select="$saml_download" />
												</xsl:attribute>@@to_see_the_resource@@</a>
										</td>
										<!-- END OF AFN-VERSION 1.4 -->
									</xsl:otherwise>
								</xsl:choose>
							</tr>

							<tr>
								<td>
									To read this PDF file you require a PDF reader (e.g. Adobe, PDF Studio, Preview).
								</td>
							</tr>

							<tr>
								<td>
									___________________________________________________________________________________________
									<br/>
									<br/>
								</td>
							</tr>

							<tr>
								<td>
									<strong>Copyright Statement - As you previously agreed:</strong>
								</td>
							</tr>
							<tr>
								<td>
									<strong>1. You will receive only a single copy of the article/document requested.</strong>
								</td>
							</tr>
							<tr>
								<td>
									<strong>2. This copy has been made pursuant to the Fair Dealing Policy of the University of Guelph, for use by a student, staff member, faculty member or library patron. This copy may be used by the recipient solely for the purpose of research, private study, education, parody, satire, criticism, review, or news reporting. When using the copy for the purpose of criticism, review, or news reporting, attribution must be given to the source, including the name of the author or creator, if available.</strong>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Any further reproduction or distribution of this copy, or use for any purpose other than those specified above, may require the consent of the copyright owner.</strong>
								</td>
							</tr>
							<tr>
								<td>
									<strong>Failing to comply with the above conditions may constitute copyright infringement under Canadian law.</strong>
								</td>
							</tr>

							<tr>
								<td>If you experience problems or have questions, please contact:</td>
							</tr>
							<tr>
								<td>
									University of Guelph Library, Access Services Department<br/>
									519-824-4120 x. 53618<br/>
									Email: <a href="mailto:library@uoguelph.ca">library@uoguelph.ca</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<br/>
				<xsl:call-template name="myAccount" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
