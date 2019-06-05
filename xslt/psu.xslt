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
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">
    <xsl:output omit-xml-declaration="no" method="xml" encoding="UTF-8" indent="yes"/>

    <!-- includes transform file that does DCMI Types, DPLA-recommended Getty AAT subset, Lexvo Language Codes, and Limited Geonames reconciliation. -->
    <!-- Use includes here if you need to separate out templates for either use specific to a dataset or use generic enough for multiple providers (like remediation.xslt). -->
    <!-- For using this XSLT in Combine, you need to replace the following with an actionable HTTP link to the remediation XSLT, or load both XSLT into Combine then rename this to the filepath & name assigned to remediation.xslt within Combine. -->
    <xsl:include href="remediation.xslt"/>

    <xsl:template match="dc:contributor">
        <xsl:element name="dcterms:contributor">
            <xsl:value-of select="normalize-space(.)"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="dc:creator">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:choose>
                <!-- ignore role only fields -->
                <xsl:when test="normalize-space(lower-case(.))='artist'" />
                <xsl:when test="normalize-space(lower-case(.))='author'" />
                <xsl:when test="normalize-space(lower-case(.))='compiler'" />
                <xsl:when test="normalize-space(lower-case(.))='contributor'" />
                <xsl:when test="normalize-space(lower-case(.))='defender'" />
                <xsl:when test="normalize-space(lower-case(.))='editor'" />
                <xsl:when test="normalize-space(lower-case(.))='manufacturer'" />
                <xsl:when test="normalize-space(lower-case(.))='painter'" />
                <xsl:when test="normalize-space(lower-case(.))='photographer'" />
                <xsl:when test="normalize-space(lower-case(.))='printer'" />
                <xsl:when test="normalize-space(lower-case(.))='publisher'" />
                <xsl:when test="normalize-space(lower-case(.))='studio'" />
                <xsl:otherwise>
                    <xsl:for-each select="tokenize(normalize-space(.), ';')">
                        <xsl:element name="dcterms:creator">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="dc:date">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:choose>
                <!-- Skipping MM/DD/YYYY, DD-Mon-YY dates as they are most likely scanned dates -->
                <xsl:when test="normalize-space(.)!='' and not(contains(., '/')) and not(matches(normalize-space(.), '^\d{2}-[a-zA-Z]{3,4}-\d{2}$'))">
                    <xsl:element name="dc:date">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:when>
                <!-- MM/DD/YYYY ; M/D/YYYY ; M/DD/YYYY ; & MM/D/YYYY parsing. Here if you want to use it later.
                <xsl:when test="normalize-space(.)!='' and contains(., '/') and not(contains(., '-'))">
                    <xsl:variable name="date" select="tokenize(normalize-space(.), '/')"/>
                    <xsl:variable name="month" select="$date[1]"/>
                    <xsl:variable name="day" select="$date[2]"/>
                    <xsl:variable name="year" select="$date[3]"/>
                    <xsl:element name="dc:date">
                        <xsl:value-of select="concat(concat(concat(concat($year, '-'), $month), '-'), $day)"/>
                    </xsl:element>
                </xsl:when>  -->
                <!-- DD-Mon-YY parsing. Here if you want to use it later.
                <xsl:when test="normalize-space(.)!='' and matches(normalize-space(.), '^\d{2}-[a-zA-Z]{3,4}-\d{2}$')">
                    <xsl:variable name="date" select="tokenize(normalize-space(.), '-')"/>
                    <xsl:variable name="day" select="$date[1]"/>
                    <xsl:variable name="month_str" select="lower-case($date[2])"/>
                    <xsl:variable name="month" select="$monthLookup/nhdl:month[. = $month_str]/@string"/>
                    <xsl:variable name="year_short" select="$date[3]"/>
                    <xsl:variable name="year" select="concat('19', $year_short)"/>
                    <xsl:element name="dc:date">
                        <xsl:value-of select="concat(concat(concat(concat($year, '-'), $month), '-'), $day)"/>
                    </xsl:element>
                </xsl:when> -->
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="dc:description">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:description">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:format">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:variable name="subtypeterm" select="normalize-space(lower-case(.))"/>
                <xsl:choose>
                    <xsl:when test="$subtypeterm = $gettySubtype/nhdl:type">
                        <xsl:element name="edm:hasType">
                            <xsl:value-of select="$gettySubtype/nhdl:type[. = $subtypeterm]/@uri"/>
                        </xsl:element>
                        <xsl:element name="edm:hasType">
                            <xsl:value-of select="$gettySubtype/nhdl:type[. = $subtypeterm]/@string"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- unmatched formats get stored in the format? field -->
                        <xsl:if test="normalize-space(.)!=''">
                            <xsl:element name="edm:hasType">
                                <xsl:value-of select="normalize-space(.)"/>
                            </xsl:element>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <!-- Ignore item numbers and legacy identifiers, which are all digit identifiers. --> 
    <xsl:template match="dc:identifier">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:for-each select="tokenize(normalize-space(.), ',')">
                <!-- ignore item numbers, which are all digits -->
                <xsl:if test="normalize-space(.)!='' and not(matches(normalize-space(.), '^\d*$'))">
                    <xsl:element name="dcterms:identifier">
                        <xsl:value-of select="normalize-space(.)"/>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="dc:identifier" mode="locationurls">
        <xsl:if test="starts-with(., 'http://') and contains(., 'cdm/ref')">
            <xsl:element name="edm:isShownAt">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
            <xsl:element name="edm:preview">
                <xsl:variable name="cdmroot" select="substring-before(., '/cdm/ref/')"/>
                <xsl:variable name="recordinfo" select="substring-after(., '/collection/')"/>
                <xsl:variable name="alias" select="substring-before($recordinfo, '/id/')"/>
                <xsl:variable name="pointer" select="substring-after($recordinfo, '/id/')"/>
                <xsl:value-of select="concat($cdmroot, '/utils/getthumbnail/collection/', $alias, '/id/', $pointer)"/>
            </xsl:element>
            <xsl:element name="dcterms:isReferencedBy">
                <xsl:variable name="iiif-manifest" select="concat(replace(replace(., 'cdm/ref/collection', 'digital/iiif'), '/id', ''), '/info.json')"/>
                <xsl:value-of select="$iiif-manifest"/>
            </xsl:element>
            <xsl:element name="svcs:has_Service">
                <xsl:value-of>http://digitalcollections.plymouth.edu/digital/custom/mirador</xsl:value-of>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:language">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:variable name="langterm" select="normalize-space(lower-case(.))"/>
            <xsl:if test="$langterm = $lexvoLang/nhdl:language">
                <xsl:element name="dcterms:language">
                    <xsl:value-of select="$lexvoLang/nhdl:language[. = $langterm]/@uri"/>
                </xsl:element>
                <xsl:element name="dcterms:language">
                    <xsl:value-of select="$lexvoLang/nhdl:language[. = $langterm]/@string"/>
                </xsl:element>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <!-- Filter rights statements to only include RightsStatement.org or CreativeCommons URIs. -->
    <xsl:template match="dc:rights">
        <xsl:if test="contains(., 'rightsstatement.org') or contains(., 'creativecommons.org')">
            <xsl:element name="edm:rights">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- When dc:rights field has 'Plymouth State University', but them in Rights Holder field. -->
    <xsl:template match="dc:rights" mode="rightsholder">
        <xsl:if test="matches(., 'Plymouth State University')">
            <xsl:element name="dcterms:rightsholder">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:subject">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:element name="dcterms:subject">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="dc:title">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:title">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <xsl:template match="dc:type">
      <xsl:for-each select="tokenize(normalize-space(.), ';')">
          <xsl:if test="normalize-space(.)!=''">
              <xsl:variable name="typeterm" select="normalize-space(lower-case(.))"/>
              <xsl:if test="$typeterm = $dcmiType/nhdl:type">
                  <xsl:element name="dcterms:type">
                      <xsl:value-of select="$dcmiType/nhdl:type[. = $typeterm]/@uri"/>
                  </xsl:element>
                  <xsl:element name="dcterms:type">
                      <xsl:value-of select="$dcmiType/nhdl:type[. = $typeterm]/@string"/>
                  </xsl:element>
              </xsl:if>
          </xsl:if>
      </xsl:for-each>
    </xsl:template>


    <!-- Analysis notes say to always ignore alternative title. -->
    <xsl:template match="dcterms:alternative" />

    <xsl:template match="dcterms:extent">
        <xsl:if test="normalize-space(.)!=''">
            <xsl:element name="dcterms:extent">
                <xsl:value-of select="normalize-space(.)"/>
            </xsl:element>
        </xsl:if>
    </xsl:template>

    <!-- repository, defaulting to 'Plymouth State University' if missing. -->
    <xsl:template match="dcterms:provenance">
        <xsl:choose>
            <xsl:when test="normalize-space(.)!='' and contains(lower-case(.), 'plymouth state university')">
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="edm:dataProvider">
                    <xsl:value-of>Plymouth State University</xsl:value-of>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="dcterms:spatial">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:variable name="geoterm" select="normalize-space(.)"/>
                <xsl:choose>
                    <xsl:when test="$geoterm = $geonamesLocation/nhdl:location">
                        <xsl:element name="dcterms:spatial">
                            <xsl:value-of select="$geonamesLocation/nhdl:location[. = $geoterm]/@uri"/>
                        </xsl:element>
                        <xsl:element name="dcterms:spatial">
                            <xsl:value-of select="$geonamesLocation/nhdl:location[. = $geoterm]/@string"/>
                        </xsl:element>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:element name="dcterms:spatial">
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:element>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="dcterms:temporal">
        <xsl:for-each select="tokenize(normalize-space(.), ';')">
            <xsl:if test="normalize-space(.)!=''">
                <xsl:element name="dcterms:temporal">
                    <xsl:value-of select="normalize-space(.)"/>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="hub">
        <xsl:element name="edm:provider">
            <xsl:value-of>New Hampshire Digital Library</xsl:value-of>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
