<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string" />
				</xsl:attribute>
			</xsl:if>

			<head>
				<title>
					<xsl:value-of select="/notification_data/title" />
				</title>

				<style type="text/css">

					body {
					width: 100%;
					opacity: 1;
					margin: 0;
					padding: 0;
					-webkit-font-smoothing: antialiased;
					mso-margin-top-alt: 0px;
					mso-margin-bottom-alt: 0px;
					mso-padding-alt: 0px 0px 0px 0px;
					font-family: 'Roboto', sans-serif;
					}

					p,
					h1,
					h2,
					h3,
					h4 {
					margin-top: 0;
					margin-bottom: 0;
					padding-top: 0;
					padding-bottom: 0;
					}

					span.preheader {
					display: none;
					font-size: 1px;
					}

					html {
					width: 100%;
					}

					table {
					font-size:
					14px;
					border: 0;
					}

					#content-wrapper
					{
					background-color: #ffffff;
					margin-top: 50px;
					}
				</style>

			</head>

			<body>
				<table role="presentation" border="0" width="100%" cellpadding="0" cellspacing="0" style="background-color: #F1F7F8;">

					<tr>
						<td height="50" style="font-size: 50px; line-height: 50px;">&#160; </td>
					</tr>

					<tr>
						<td align="center">
							<table role="presentation" id="content-wrapper" border="0" align="center" width="590" cellpadding="0" cellspacing="0">




								<tr>
									<td align="center">
										<!--HEADER -->
										<table role="presentation" border="0" align="center" width="590" height="70" cellpadding="0" cellspacing="0"
											style="background: url(cid:notification-background.jpg); min-height: 150px; width: 97%;">
											<!-- style="background: url(/background.jpg); min-height: 150px; width: 97%;" -->

											<tr>
												<td align="left" style="padding-left: 20px;">
													<img width="100" border="0" style="min-height: 70px; min-width:240px ;" src="cid:logo.jpg" alt="logo" />
												</td>
											</tr>
										</table>
										<!-- END HEADER -->
									</td>
								</tr>

								<tr>
									<td height="25" style="font-size: 25px; line-height: 25px;">&#160; </td>
								</tr>
								<tr>
									<td height="25" style="line-height: 25px;">
										<!--TITLE -->
										<table role="presentation" style="padding-left: 20px;">
											<tr>
												<td align="left" style="font-size:24px; font-weight: 400 ;">
													<xsl:value-of select="/notification_data/title" />
												</td>
											</tr>
										</table>
										<!--TITLE -->
									</td>
								</tr>
								<tr>
									<td height="5" style="font-size: 5px; line-height: 5px;">&#160; </td>
								</tr>
								<tr>
									<td height="16" style=" line-height: 16px;">
										<!--DATE -->
										<table role="presentation" style="padding-left: 20px;">
											<tr>
												<td align="left" style="font-size:16px; font-weight: 300 ;">
													<xsl:value-of select="/notification_data/create_date" />
													&#160;|
													<xsl:value-of select="/notification_data/organization_unit/description" />
												</td>
											</tr>
										</table>
										<!--END DATE -->
									</td>
								</tr>
								<tr>
									<td height="25" style="font-size: 25px; line-height: 25px;">&#160; </td>
								</tr>
								<tr>
									<td height="16" style=" line-height: 16px;">
										<!--TO -->
										<table role="presentation" style="padding-left: 20px;">
											<tr>
												<td align="left" style="font-size:16px; font-weight: 400 ;">
													@@dear@@
													<strong>
														<xsl:value-of select="/notification_data/receivers/receiver/user/first_name" />
														&#160;

														<xsl:value-of select="/notification_data/receivers/receiver/user/last_name" />
														,
													</strong>
												</td>
											</tr>
										</table>
										<!--END TO -->
									</td>
								</tr>
								<tr>
									<td height="5" style="font-size: 5px; line-height: 5px;">&#160; </td>
								</tr>
								<tr>
									<td height="16" style=" line-height: 16px;">
										<!--DESCRIPTION -->
										<table role="presentation" style="padding-left: 20px;">
											<tr>
												<td align="left" style="font-size:14px; font-weight: 300 ;">
													<xsl:value-of select="/notification_data/description" />
												</td>
											</tr>
										</table>
										<!--END DESCRIPTION -->
									</td>
								</tr>
								
								<tr>
									<td height="16" style=" line-height: 16px;">
										<!--LINK -->
										<table role="presentation" style="padding-left: 20px;">
											<tr>
												<td align="left" style="font-size:14px; font-weight: 300 ;">
													<xsl:element name="a">
														<xsl:attribute name="href">
															<xsl:value-of select="/notification_data/link"/>
														</xsl:attribute>
														<xsl:value-of select="/notification_data/link_label"/>
													</xsl:element>
												</td>
											</tr>
										</table>
										<!--END LINK -->
									</td>
								</tr>

							</table>
						</td>
					</tr>
					<tr>
						<td height="250" style="font-size: 250px; line-height: 250px;">&#160; </td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>



</xsl:stylesheet>




