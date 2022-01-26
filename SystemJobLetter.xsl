<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="style.xsl" />
	<xsl:include href="header.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:template match="/">
		<html>
			<xsl:if test="notification_data/languages/string">
				<xsl:attribute name="lang">
					<xsl:value-of select="notification_data/languages/string" />
				</xsl:attribute>
			</xsl:if>
			<head>
				<title>
					<xsl:value-of select="notification_data/general_data/letter_name" />
				</title>
				<xsl:call-template name="generalStyle" />
				<!-- style.xsl -->
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head" />
				<!-- header.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table role="presentation" cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<xsl:for-each select="notification_data/system_job_report_container">
										<h1>
											<xsl:value-of select="translated_strings_map/map_entry/systemjobs.report/value"/>
										</h1>
										<br/>
										<table cellpadding="5" class="listing">
											<xsl:attribute name="style">
												<xsl:call-template name="mainTableStyleCss"/>
												<!-- style.xsl -->
											</xsl:attribute>
											<xsl:choose>
												<xsl:when test="'true'=report_innovation">
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.name/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/name"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.createdBy/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/creator"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.processId/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/id"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.totalRunTime"/>
														</th>
														<td>
															<xsl:value-of select="report_header/total_running_time"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.startedOn/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/starting_time"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.finishedOn/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/ending_time"/>
														</td>
													</tr>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.processId/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/id"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.name/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/name"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.startedOn/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/starting_time"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.finishedOn/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/ending_time"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.totalRunTime"/>
														</th>
														<td>
															<xsl:value-of select="report_header/total_running_time"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.createdBy/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/creator"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.status/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/status"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.statusDate/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/status_time"/>
														</td>
													</tr>
													<tr>
														<td/>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.recordsProcessed/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/total_number"/>
														</td>
														<th align="right">
															<xsl:value-of select="translated_strings_map/map_entry/c.systemjobs.report.recordsFailed/value"/>
														</th>
														<td>
															<xsl:value-of select="report_header/number_failed"/>
														</td>
													</tr>
												</xsl:otherwise>
											</xsl:choose>
										</table>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="'true'=job_parameters_section_visible">
												<xsl:for-each select="report_parameters">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.schedule.jobParametersSection/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string_list">
															<tr>
																<td align="left" width="5%"/>
																<th align="left" width="50%">
																	<xsl:value-of select="string[1]"/>
																</th>
																<td align="left" width="30%">
																	<xsl:value-of select="string[2]"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="event_links_label/string">
												<xsl:for-each select="event_links_label">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.schedule.jobEvents/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string">
															<tr>
																<td width="5%"/>
																<td width="30%">
																	<xsl:value-of select="."/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=entities_section_visible">
												<xsl:for-each select="report_entities">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.countersSection/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string_list">
															<tr>
																<td align="left" width="5%"/>
																<th align="left" width="50%">
																	<xsl:value-of select="string[1]"/>
																</th>
																<td align="left" width="30%">
																	<xsl:value-of select="string[2]"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=statistics_section_visible">
												<xsl:for-each select="report_statistics">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.statisticsSection/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string_list">
															<tr>
																<td align="left" width="5%"/>
																<th align="left" width="50%">
																	<xsl:value-of select="string[1]"/>
																</th>
																<td align="left" width="30%">
																	<xsl:value-of select="string[2]"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=errors_section_visible">
												<xsl:for-each select="report_errors">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.errorsSection/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string_list">
															<tr>
																<td align="left" width="5%"/>
																<th align="left" width="50%">
																	<xsl:value-of select="string[1]"/>
																</th>
																<td align="left" width="30%">
																	<xsl:value-of select="string[2]"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=report_table_visible">
												<xsl:for-each select="report_table">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.reportTable/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<tr>
															<xsl:for-each select="column_names">
																<td width="5%"/>
																<xsl:for-each select="string">
																	<th>
																		<xsl:value-of select="."/>
																	</th>
																</xsl:for-each>
															</xsl:for-each>
														</tr>
														<tr/>
														<xsl:for-each select="rows">
															<xsl:for-each select="string_list">
																<tr>
																	<td width="5%"/>
																	<xsl:for-each select="string">
																		<td>
																			<xsl:value-of select="."/>
																		</td>
																	</xsl:for-each>
																</tr>
															</xsl:for-each>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=report_table_secondary_visible">
												<xsl:for-each select="report_table_secondary">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.reportTable/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<tr>
															<xsl:for-each select="column_names">
																<td width="5%"/>
																<xsl:for-each select="string">
																	<th>
																		<xsl:value-of select="."/>
																	</th>
																</xsl:for-each>
															</xsl:for-each>
														</tr>
														<tr/>
														<xsl:for-each select="rows">
															<xsl:for-each select="string_list">
																<tr>
																	<td width="5%"/>
																	<xsl:for-each select="string">
																		<td>
																			<xsl:value-of select="."/>
																		</td>
																	</xsl:for-each>
																</tr>
															</xsl:for-each>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=report_table_third_visible">
												<xsl:for-each select="report_table_third">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.reportTable/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<tr>
															<xsl:for-each select="column_names">
																<td width="5%"/>
																<xsl:for-each select="string">
																	<th>
																		<xsl:value-of select="."/>
																	</th>
																</xsl:for-each>
															</xsl:for-each>
														</tr>
														<tr/>
														<xsl:for-each select="rows">
															<xsl:for-each select="string_list">
																<tr>
																	<td width="5%"/>
																	<xsl:for-each select="string">
																		<td>
																			<xsl:value-of select="."/>
																		</td>
																	</xsl:for-each>
																</tr>
															</xsl:for-each>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=report_total_results_summary_visible">
												<xsl:for-each select="report_total_results_summary">
													<h2>
														<xsl:value-of select="../translated_strings_map/map_entry/c.systemjobs.report.totalResultsSummaryTable/value"/>
													</h2>
													<br/>
													<table cellpadding="5" class="listing">
														<xsl:attribute name="style">
															<xsl:call-template name="mainTableStyleCss"/>
															<!-- style.xsl -->
														</xsl:attribute>
														<xsl:for-each select="string_list">
															<tr>
																<td align="left" width="5%"/>
																<th align="left" width="50%">
																	<xsl:value-of select="string[1]"/>
																</th>
																<td align="left" width="30%">
																	<xsl:value-of select="string[2]"/>
																</td>
															</tr>
														</xsl:for-each>
													</table>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="'true'=many_report_tables_visible">
												<xsl:for-each select="many_report_tables">
													<xsl:for-each select="report_table">
														<br/>
														<h2>
															<xsl:value-of select="name"/>
														</h2>
														<br/>
														<table cellpadding="5" class="listing">
															<xsl:attribute name="style">
																<xsl:call-template name="mainTableStyleCss"/>
																<!-- style.xsl -->
															</xsl:attribute>
															<tr>
																<xsl:for-each select="column_names">
																	<td width="5%"/>
																	<xsl:for-each select="string">
																		<th>
																			<xsl:value-of select="."/>
																		</th>
																	</xsl:for-each>
																</xsl:for-each>
															</tr>
															<tr/>
															<xsl:for-each select="rows">
																<xsl:for-each select="string_list">
																	<tr>
																		<td width="5%"/>
																		<xsl:for-each select="string">
																			<td>
																				<xsl:value-of select="."/>
																			</td>
																		</xsl:for-each>
																	</tr>
																</xsl:for-each>
															</xsl:for-each>
														</table>
													</xsl:for-each>
												</xsl:for-each>
												<br/>
												<br/>
											</xsl:when>
										</xsl:choose>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- AFN footer template options from footer.xsl -->
				<xsl:call-template name="AFNLastFooter" />
				<xsl:call-template name="AFNAccount" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
