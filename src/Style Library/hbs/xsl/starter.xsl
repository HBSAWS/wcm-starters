<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

    <!--<xsl:import href="lib/queries.xsl"/>-->
    <xsl:param name="args"/> 
    <xsl:output method="html" omit-xml-declaration="yes"/>
    <!--
    
    Query Data
    
    -->
    <xsl:template match="/Root">
        <Render>
            <xsl:if test="hbs:Request/debug='true'">
                <hbs:Debug/>
            </xsl:if>
            <hbs:Repeat/>
        </Render>
    </xsl:template>
    <!--
    
    Render Output
    
    -->
    <xsl:template match="/Render">
       <p>Hello World</p>
    </xsl:template>
</xsl:stylesheet>