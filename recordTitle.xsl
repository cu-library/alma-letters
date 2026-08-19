<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="recordTitle">
		<div class="recordTitle">
			<span class="spacer_after_1em">
				<xsl:value-of select="notification_data/phys_item_display/title"/>
			</span>
		</div>
		<xsl:if test="notification_data/phys_item_display/author !=''">
			<div class="">
				<span class="spacer_after_1em">
					<span class="recordAuthor">@@by@@ <xsl:value-of select="notification_data/phys_item_display/author"/>
					</span>
				</span>
			</div>
		</xsl:if>
		<xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
			<div class="">
				<span class="spacer_after_1em">
					<span class="volumeIssue">@@description@@ <xsl:value-of select="notification_data/phys_item_display/issue_level_description"/>
					</span>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
	<!-- testing a template that will cut off the trailing comma in the author value -->
	<xsl:template name="recordTitle2">
	    <div class="recordTitle">
			<span class="spacer_after_1em">
				<xsl:value-of select="notification_data/phys_item_display/title"/>
			</span>
		</div>
		<xsl:if test="notification_data/phys_item_display/author !=''">
			<div class="">
				<span class="spacer_after_1em">
					<span class="recordAuthor">@@by@@ 
    					<xsl:choose>
                            <!-- Check if the single last character of author value is a comma. If yes, remove it. -->
                            <xsl:when test="substring(notification_data/phys_item_display/author, string-length(notification_data/phys_item_display/author)) = ','">
                                <xsl:value-of select="substring(notification_data/phys_item_display/author, 1, string-length(notification_data/phys_item_display/author) - 1)" />
                            </xsl:when>
                            <!-- If no, just display author value unchanged. -->
                            <xsl:otherwise>
                                <xsl:value-of select="notification_data/phys_item_display/author" />
                            </xsl:otherwise>
                        </xsl:choose>
					</span>
				</span>
			</div>
		</xsl:if>
		<xsl:if test="notification_data/phys_item_display/issue_level_description !=''">
			<div class="">
				<span class="spacer_after_1em">
					<span class="volumeIssue">@@description@@ <xsl:value-of select="notification_data/phys_item_display/issue_level_description"/>
					</span>
				</span>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>