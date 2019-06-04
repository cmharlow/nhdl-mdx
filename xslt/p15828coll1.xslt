<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/' xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/" xmlns:oclc="http://purl.org/oclc/terms/" version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

    <xsl:include href="psu.xsl"/>

    <xsl:template match="text()|@*"/>
    <xsl:template match="//oai_dc:dc">
        <mods xmlns:xlink="http://www.w3.org/1999/xlink"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns="http://www.loc.gov/mods/v3" version="3.5"
            xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd">
            <xsl:apply-templates select="dc:title"/> <!-- titleInfo/title and part/detail|date parsed out -->
            <xsl:apply-templates select="dc:identifier"/> <!-- identifier -->
            <xsl:apply-templates select="dc:creator" /> <!-- name/role -->

            <xsl:if test="dc:date|dc:publisher">
                <originInfo>
                    <xsl:apply-templates select="dc:date[1]"/> <!-- date (text + key) -->
                    <xsl:apply-templates select="dc:creator" mode="publisher"/> <!-- publisher parsed from creator -->
                    <xsl:apply-templates select="dc:publisher"/> <!-- place of origin - publishers all repositories -->
                </originInfo>
            </xsl:if>

            <xsl:if test="dc:format|dc:type">
                <physicalDescription>
                    <xsl:apply-templates select="dc:format"/> <!-- extent, internetMediaTypes -->
                    <xsl:apply-templates select="dc:type" mode="form"/> <!-- form information -->
                </physicalDescription>
            </xsl:if>

            <xsl:if test="dc:identifier">
                <location>
                    <xsl:apply-templates select="dc:identifier" mode="URL"/> <!-- object in context URL -->
                    <xsl:apply-templates select="dc:identifier" mode="locationurl"></xsl:apply-templates>
                </location>
            </xsl:if>

            <xsl:apply-templates select="dc:description"/> <!-- abstract -->
            <xsl:apply-templates select="dc:relation" /> <!-- collections -->
            <xsl:apply-templates select="dc:rights"/> <!-- accessCondition -->
            <xsl:apply-templates select="dc:subject"/> <!-- subjects -->
            <xsl:apply-templates select="dc:format" mode="relatedItem"/>
            <xsl:apply-templates select="dc:type"/> <!-- item types -->
            <xsl:apply-templates select="dc:type" mode="genre"/> <!-- genres -->
            <xsl:apply-templates select="dc:source"/>
            <relatedItem type='host' displayLabel="Project">
                <titleInfo>
                    <title>Hugh Tyler Collection</title>
                </titleInfo>
                <abstract>These photographs from Hugh Tyler's album include photos of James Agee and his mother’s family, some of the few surviving photographs from the time immediately after Agee's father’s death. The photograph album has 37 pages and contains mostly family snapshots. Some photographs appear to have been removed from the album prior to its donation, and there are also several loose photographs. All of the photographs of the photographs in the album have been scanned, even those presently unidentified.</abstract>
                <location>
                    <url>http://cdm16311.contentdm.oclc.org/cdm/landingpage/collection/p15136coll1/</url>
                </location>
            </relatedItem>
            <xsl:call-template name="recordInfo"/> <!-- record info for Knoxville Public Libraries collections -->
        </mods>
    </xsl:template>

</xsl:stylesheet>
