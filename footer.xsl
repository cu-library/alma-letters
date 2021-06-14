<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="salutation">
	</xsl:template>
	<xsl:template name="lastFooter">
	</xsl:template>
	<xsl:template name="contactUs">
		<table align="left">
			<tr>
				<td align="left">
					<a>
						<xsl:attribute name="href">
							@@email_contact_us@@
						</xsl:attribute>
						@@contact_us@@
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="myAccount">
		<table align="right">
			<tr>
				<td align="right">
					<a>
						<xsl:attribute name="href">
							@@email_my_account@@
						</xsl:attribute>
						@@my_account@@
					</a>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!-- AFN CODE -->

	<!-- create an OCUL AFN language specific variable for contact link text -->
	<xsl:template name="afn_en_contact_us">
		If you have questions or need assistance, please contact us:
	</xsl:template>

	<xsl:template name="afn_fr_contact_us">
		Si vous avez des questions ou besoin d'aide, veuillez nous contacter:
	</xsl:template>

	<xsl:variable name="is_afn_patron">
		<xsl:if test="(notification_data/user_for_printing/user_group = 'AFNUSER') or (notification_data/user/user_group = 'AFNUSER') or (notification_data/request/user_group = 'AFNUSER') or (	notification_data/user_for_printing/user_group = 'TUGUSER') or (notification_data/user/user_group = 'TUGUSER') or (notification_data/request/user_group = 'TUGUSER')">
			TRUE
		</xsl:if>
	</xsl:variable>

	<!-- perform a test to see if the external id looks like OCUL alma codes 01OCUL_AU...just looking at format / first 2 digits 01OCUL 01UTON-->
	<!-- normally in notification_data/receivers/receiver/user/external_id, but not always. Codes don't match, we'll show no home institution in AFN info -->
	<xsl:variable name="test_external_id">
		<xsl:value-of select="notification_data/receivers/receiver/user/external_id"/>
	</xsl:variable>

	<xsl:variable name="external_id">
		<xsl:choose>
			<xsl:when test="(substring($test_external_id,1,2) = '01')">
				<xsl:value-of select="$test_external_id"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="notification_data/organization_unit/code"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="is_preferred_lang_fr">
		<xsl:choose>
			<xsl:when test="/notification_data/receivers/receiver/preferred_language = 'fr'">
				TRUE
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<!-- create an OCUL AFN specific footer -->
	<xsl:template name="AFNLastFooter">
		<table>
			<xsl:attribute name="style">
			<xsl:call-template name="footerTableStyleCss" />
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="(string-length($is_afn_patron) > 0)">
					<xsl:choose>
						<!-- handle AFN supported languages -->
						<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
							<tr>
								<xsl:choose>
									<xsl:when test="$external_id = '01OCUL_AU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:circulation@algomau.ca"> circulation@algomau.ca</a> | 705-949-2101</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:libhelp@brocku.ca"> libhelp@brocku.ca</a> | 905-688-5550 ×4583</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:libcirc@carleton.ca"> libcirc@carleton.ca</a> | 613-520-2600 x2734</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<p>
											<xsl:call-template name="afn_fr_contact_us" /> <br/>
											Paterson | <a href="mailto:circdesk@lakeheadu.ca"> circdesk@lakeheadu.ca</a> | (807) 343-8225 <br/>
											Éducation | <a href="mailto:edlib@lakeheadu.ca"> edlib@lakeheadu.ca</a>  | (807) 343-8718 <br/>
											Droit | <a href="mailto:law.library@lakeheadu.ca"> law.library@lakeheadu.ca</a> | (807) 346-7830 <br/>
											Orillia | <a href="mailto:orlibrary@lakeheadu.ca"> orlibrary@lakeheadu.ca</a> | (705) 330-4010 ext. 2250 <br/>
										</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:omni@laurentian.ca"> omni@laurentian.ca</a> omni@laurentian.ca / 705-675-4800 / @LaurentianLib </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:circdesk@eclibrary.ca"> circdesk@eclibrary.ca</a> | 705-474-3450, ext. 4222 </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="https://guides.library.uoit.ca/contact"> Coordonnées des techniciens de l'Ontario</a> | <a href="	https://guides.library.durhamcollege.ca/contact"> Coordonnées du Collège Durham</a> </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="https://library.queensu.ca/help-servers/ask-us"> Ask Us </a> </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:library@uoguelph.ca"> library@uoguelph.ca</a> | 519-824-4120 x 53618</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:library@trentu.ca"> library@trentu.ca</a> | Bata: 705-748-1011 x7423 | Durham: 905-435-5102 x5061 </p	>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:bibliolibrary@uottawa.ca"> bibliolibrary@uottawa.ca</a> | 613-562-5213 </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:libaskus@uwaterloo.ca"> libaskus@uwaterloo.ca</a> | 519-888-4567 ext. 84883</p>
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:LeddyLibrary@uwindsor.ca"> LeddyLibrary@uwindsor.ca</a> | 519-253-3000 ext. 3402</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:library@uwo.ca"> library@uwo.ca</a></p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:wlucirc@wlu.ca"> wlucirc@wlu.ca</a> | (519) 884-0710 x3222</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<p><xsl:call-template name="afn_fr_contact_us" />  <a href="mailto:askusyul@yorku.ca"> askusyul@yorku.ca</a> | 416-736-5181</p>
									</xsl:when>
								</xsl:choose>
							</tr>
						</xsl:when>
						<!-- default AFN language is english -->
						<xsl:otherwise>
							<tr>
								<xsl:choose>
									<xsl:when test="$external_id = '01OCUL_AU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:circulation@algomau.ca"> circulation@algomau.ca</a> | 705-949-2101</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_BU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:libhelp@brocku.ca"> libhelp@brocku.ca</a> | 905-688-5550 ×4583</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_CRL' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:libcirc@carleton.ca"> libcirc@carleton.ca</a> | 613-520-2600 x2734</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LHD' ">
										<p>
											<xsl:call-template name="afn_en_contact_us" /> <br/>
											Paterson | <a href="mailto:circdesk@lakeheadu.ca"> circdesk@lakeheadu.ca</a> | (807) 343-8225 <br/>
											Education | <a href="mailto:edlib@lakeheadu.ca"> edlib@lakeheadu.ca</a>  | (807) 343-8718 <br/>
											Law | <a href="mailto:law.library@lakeheadu.ca"> law.library@lakeheadu.ca</a> | (807) 346-7830 <br/>
											Orillia | <a href="mailto:orlibrary@lakeheadu.ca"> orlibrary@lakeheadu.ca</a> | (705) 330-4010 ext. 2250 <br/>
										</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_LU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:omni@laurentian.ca"> omni@laurentian.ca</a> / 705-675-4800 / @LaurentianLib </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_NIP' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:circdesk@eclibrary.ca"> circdesk@eclibrary.ca</a> | 705-474-3450, ext. 4222 </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_IT' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="https://guides.library.uoit.ca/contact"> Ontario Tech Contact Information</a> | <a href="	https://guides.library.durhamcollege.ca/contact"> Durham College Contact Information</a> </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_QU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="https://library.queensu.ca/help-servers/ask-us"> Ask Us </a> </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_TU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:library@trentu.ca"> library@trentu.ca</a> | Bata: 705-748-1011 x7423 | Durham: 905-435-5102 x5061 </p	>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_GUE' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:library@uoguelph.ca"> library@uoguelph.ca</a> | 519-824-4120 x 53618</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UO' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:bibliolibrary@uottawa.ca"> bibliolibrary@uottawa.ca</a> | 613-562-5213 </p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WTL' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:libaskus@uwaterloo.ca"> libaskus@uwaterloo.ca</a> | 519-888-4567 ext. 84883 </p>
									</xsl:when>
									<xsl:when test="$external_id = '01UTON_UW' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:LeddyLibrary@uwindsor.ca"> LeddyLibrary@uwindsor.ca</a> | 519-253-3000 ext. 3402</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_UWO' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:library@uwo.ca"> library@uwo.ca</a></p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_WLU' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:wlucirc@wlu.ca"> wlucirc@wlu.ca</a> | (519) 884-0710 x3222</p>
									</xsl:when>
									<xsl:when test="$external_id = '01OCUL_YOR' ">
										<p><xsl:call-template name="afn_en_contact_us" />  <a href="mailto:askusyul@yorku.ca"> askusyul@yorku.ca</a> | 416-736-5181</p>
									</xsl:when>
								</xsl:choose>
							</tr>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<!-- Fallback - use Carleton default -->
						<p>If you have questions or need assistance, please contact us:<a href="mailto:libcirc@carleton.ca"> libcirc@carleton.ca</a> | 613-520-2600 x2734</p>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>

	<!-- create an OCUL AFN language specific variable for visiting Omni account link text -->
	<xsl:template name="afn_en_visit_home_account_link_text">
		Visit Omni at your home institution
	</xsl:template>

	<xsl:template name="afn_fr_visit_home_account_link_text">
		Visitez Omni de votre institution d'origine
	</xsl:template>

	<xsl:template name="AFNVisitLoansLink">
		<table align="left">
			<tr>
				<td align="left">
					<xsl:choose>
						<xsl:when test="(string-length($is_afn_patron) > 0)">
							<xsl:choose>
								<!-- handle AFN supported languages-->
								<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
									<xsl:choose>
										<xsl:when test="$external_id = '01OCUL_AU' ">
											1. <a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_BU' ">
											1. <a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_CRL' ">
											1. <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LHD' ">
											1. <a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LU' ">
											1. <a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_NIP' ">
											1. <a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_IT' ">
											1. <a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_QU' ">
											1. <a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_TU' ">
											1. <a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_GUE' ">
											1. <a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UO' ">
											1. <a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WTL' ">
											1. <a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01UTON_UW' ">
											1. <a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UWO' ">
											1. <a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WLU' ">
											1. <a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_YOR' ">
											1. <a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=fr"><xsl:call-template name="	afn_fr_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:otherwise>
											1. <xsl:call-template name="afn_fr_visit_home_account_link_text" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:when>
								<!-- default AFN language is english -->
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$external_id = '01OCUL_AU' ">
											1. <a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_BU' ">
											1. <a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_CRL' ">
											1. <a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LHD' ">
											1. <a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LU' ">
											1. <a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_NIP' ">
											1. <a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_IT' ">
											1. <a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_QU' ">
											1. <a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_TU' ">
											1. <a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_GUE' ">
											1. <a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UO' ">
											1. <a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WTL' ">
											1. <a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01UTON_UW' ">
											1. <a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UWO' ">
											1. <a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WLU' ">
											1. <a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_YOR' ">
											1. <a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;section=loans&amp;lang=en"><xsl:call-template name="	afn_en_visit_home_account_link_text" /></a>
										</xsl:when>
										<xsl:otherwise>
											1. <xsl:call-template name="afn_en_visit_home_account_link_text" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<!-- Fallback - use Carleton default -->
							<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;section=loans&amp;lang=en">Visit Omni at your home institution</a>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>

	<!-- create an OCUL AFN language specific variable for login to account link text -->
	<xsl:template name="afn_en_account_link_text">
		Login to My Account
	</xsl:template>

	<xsl:template name="afn_fr_account_link_text">
		Connexion à mon compte
	</xsl:template>

	<xsl:template name="AFNAccount">
		<table align="left">
			<tr>
				<td align="left">
					<xsl:choose>
						<xsl:when test="(string-length($is_afn_patron) > 0)">
							<xsl:choose>
								<!-- handle AFN supported languages -->
								<xsl:when test="(string-length($is_preferred_lang_fr) > 0)">
									<xsl:choose>
										<xsl:when test="$external_id = '01OCUL_AU' ">
											<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_BU' ">
											<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_CRL' ">
											<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LHD' ">
											<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LU' ">
											<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_NIP' ">
											<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_IT' ">
											<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_QU' ">
											<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_TU' ">
											<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_GUE' ">
											<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UO' ">
											<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WTL' ">
											<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01UTON_UW' ">
											<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UWO' ">
											<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WLU' ">
											<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_YOR' ">
											<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;lang=fr"><xsl:call-template name="afn_fr_account_link_text" /></a	>
										</xsl:when>
									</xsl:choose>
								</xsl:when>
								<!-- default AFN language is english -->
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$external_id = '01OCUL_AU' ">
											<a href="https://algomau.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_AU:DEFAULT_AU&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_BU' ">
											<a href="https://ocul-bu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_BU:BU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_CRL' ">
											<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LHD' ">
											<a href="https://ocul-lhd.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_LHD:LHD_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_LU' ">
											<a href="https://omni.laurentian.ca/discovery/account?vid=01OCUL_LU:OMNI&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_NIP' ">
											<a href="https://ocul-nip.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_NIP:NIPISSING&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_IT' ">
											<a href="https://ocul-it.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_IT:UO&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_QU' ">
											<a href="https://ocul-qu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_QU:QU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_TU' ">
											<a href="https://ocul-tu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_TU:TU_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_GUE' ">
											<a href="https://ocul-gue.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_GUE:GUELPH&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UO' ">
											<a href="https://ocul-uo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UO:UO_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WTL' ">
											<a href="https://ocul-wtl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WTL:WTL_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01UTON_UW' ">
											<a href="https://uwindsor.primo.exlibrisgroup.com/discovery/account?vid=01UTON_UW:UWINDSOR&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_UWO' ">
											<a href="https://ocul-uwo.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_UWO:UWO_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a	>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_WLU' ">
											<a href="https://ocul-wlu.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_WLU:WLU_DEF&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a>
										</xsl:when>
										<xsl:when test="$external_id = '01OCUL_YOR' ">
											<a href="https://ocul-yor.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_YOR:YOR_DEFAULT&amp;lang=en"><xsl:call-template name="afn_en_account_link_text" /></a	>
										</xsl:when>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:when>
						<xsl:otherwise>
							<!-- Fallback - use Carleton default -->
							<a href="https://ocul-crl.primo.exlibrisgroup.com/discovery/account?vid=01OCUL_CRL:CRL_DEFAULT&amp;lang=en">Login to My Account</a>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</table>
	</xsl:template>
	<!-- END OF AFN CODE -->
</xsl:stylesheet>
