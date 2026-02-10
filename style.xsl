<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="generalStyle">
		<style>
			body {
				@@language_related_body_css@@ background-color:#fff;
			}
			.listing td {
				border-bottom: 1px solid #eee;
			}
			.listing tr:hover td {
				background-color:#eee;
			}
			.listing th {
				background-color:#f5f5f5;
			}
			h4{
				line-height: 0.2em;
			}
			 <!-- START AFN styles -->
			 .afn_steps_list li{margin-bottom:1em}
			 #afn_letter_name_id{margin-top:1em; font-size: 30%;}
			 .afn_letter_plain_list{list-style-type: none;}
			 <!-- END AFN styles -->
			 <!-- Carleton styles -->
			 caption {
				font-weight: bold;
			 }
			 table {
				padding: 5px;
			 }
            
            .acq-orders th, td {
                vertical-align: top;
                padding: 0.25em;
            }
            
            .acq-orders th {
                text-align: left;
                white-space: nowrap;
            }
			 <!-- END Carleton styles -->
		</style>
	</xsl:template>
	<!-- 	
	DO NOT make font-size less than 100%. Less than 100% shows up okay in Outlook, but if someone is forwarding to Gmail the text becomes illegibly tiny. 
	Additionally, we do need to specify 100%; leaving it out entirely can also make the font illegibly tiny.
	-->
	<xsl:template name="bodyStyleCss">font-family: arial; color:#333; margin:0; padding:0em; font-size:100%</xsl:template> 
	<xsl:template name="listStyleCss">list-style: none; margin:0 0 0 1em; padding:0</xsl:template>
	<xsl:template name="mainTableStyleCss">width:100%; text-align:left;</xsl:template>
	<xsl:template name="headerLogoStyleCss">background-color:#ffffff;  width:100%;</xsl:template>
	<xsl:template name="headerTableStyleCss">background-color:#e9e9e9;  width:100%; height:30px; text-shadow:1px 1px 1px #fff;</xsl:template>
	<xsl:template name="footerTableStyleCss">width:100%; font-weight:700; line-height:2em; font-size:100%;</xsl:template>
</xsl:stylesheet>