<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:nhdl="http://github.com/cmharlow/nhdl-mdx/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>
    
    <!-- Includes templates that can be consistently used across PSU sets. -->
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <xsl:include href="psu.xslt"/>
    
    <!-- base record. Matches each OAI feed record that is mapped. -->    
    <xsl:template match="text()|@*"/>
    <xsl:template match="//oai:record/oai:header[@status = 'deleted']" />
    <xsl:template match="//oai_qdc:qualifieddc">
        <oai_qdc:qualifieddc xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/" 
            xmlns:dcterms="http://purl.org/dc/terms/" 
            xmlns:edm="http://www.europeana.eu/schemas/edm/" 
            xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/" 
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/" 
            xmlns:dc="http://purl.org/dc/elements/1.1/" 
            xmlns:oai-pmh="http://www.openarchives.org/OAI/2.0/">
            <!-- will match specific templates that relevant for p15828coll1. -->
            <xsl:apply-templates />
            
            <!-- add templates you have to call - e.g. named templates; matched templates with mode -->
            <xsl:apply-templates select="dc:identifier" mode="locationurls"/>
            <dcterms:isPartOf>Plymouth State Historical Collection</dcterms:isPartOf>
            <xsl:call-template name="hub"/>
        </oai_qdc:qualifieddc>
    </xsl:template>
    
    <!-- Ignore dc:date field for this collection per analysis notes. instead, use dates from dc:description. -->
    <xsl:template match="dc:date" />
    
    <!-- Parse dates from description as dates. --> 
    <xsl:template match="dc:description" mode='dates'>
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <xsl:when test="matches(normalize-space(.), '^\d{4}$') or matches(normalize-space(.), '^\d{4}-\d{2}$') or matches(normalize-space(.), '^\d{4}-\d{2}-\d{2}$')">
                    <xsl:element name="dcterms:date">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="matches(normalize-space(.), '^ca. \d{4}$')">
                    <xsl:element name="dcterms:date">
                        <xsl:value-of select="replace(normalize-space(.), 'ca. ', '')"/>
                    </xsl:element>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <!-- Filter out dates, sub-collections from dc:description. No consistent ordering. --> 
    <xsl:template match="dc:description">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:choose>
                <xsl:when test="matches(normalize-space(.), '^\d{4}$') or matches(normalize-space(.), '^\d{4}-\d{2}$') or matches(normalize-space(.), '^\d{4}-\d{2}-\d{2}$')"/>
                <xsl:when test="matches(normalize-space(.), '^ca. \d{4}$')"/>
                <xsl:when test="matches(normalize-space(lower-case(.)), 'psu athletics')"/>
                <xsl:otherwise>
                    <xsl:element name="dcterms:description">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>