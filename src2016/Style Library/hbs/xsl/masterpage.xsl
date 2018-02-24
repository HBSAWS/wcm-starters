<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

    <xsl:param name="args"/>
    <xsl:output omit-xml-declaration="yes" method="html"/>
    
    <xsl:template match="/Root">
        <Render>
            <hbs:Repeat/>
        </Render>
    </xsl:template>
    
    <xsl:template match="/Render">
	    <xsl:choose>
            <xsl:when test="$args = 'supernav'">
               <xsl:value-of select="hbs:CallStr('masterpage-supernav.xsl')" disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:when test="$args = 'head'">
               <xsl:value-of select="hbs:CallStr('masterpage-head.xsl')" disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:when test="$args = 'header'">
               <xsl:value-of select="hbs:CallStr('masterpage-header.xsl')" disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:when test="$args = 'footer'">
               <xsl:value-of select="hbs:CallStr('masterpage-footer.xsl')" disable-output-escaping="yes"/>
            </xsl:when>
            <xsl:when test="$args = 'js'">
               <xsl:value-of select="hbs:CallStr('masterpage-js.xsl')" disable-output-escaping="yes"/>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>