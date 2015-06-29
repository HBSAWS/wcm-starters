<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
   
	<xsl:output method="html" omit-xml-declaration="yes"/>

	<xsl:template match="/Root">
		<Render>
           <xsl:if test="hbs:Request/debug='header'"><hbs:Debug/></xsl:if>
           <Request><xsl:copy-of select="hbs:Request/PATH_INFO"/></Request>
		   <hbs:Repeat/>
		   
		   <hbs:GetPage></hbs:GetPage>
		</Render>
	</xsl:template>

	<xsl:template match="/Render">
	
	<xsl:variable name="headerColor">
	   <xsl:choose>
	      <xsl:when test="hbs:Page/z:row">
			<xsl:value-of select="hbs:Page/z:row/@ows_PrimaryColor"/>-inherit
	      </xsl:when>
	      <xsl:otherwise>
	        silver-inherit
	      </xsl:otherwise>
	   </xsl:choose>
    </xsl:variable>
    
    <div class="back-to-top"><a href="#" class="icon-back-to-top"></a></div> 

	<xsl:text disable-output-escaping="yes">&lt;div class="</xsl:text><xsl:value-of select="normalize-space($headerColor)"/><xsl:text disable-output-escaping="yes"> 
         responsive-type slider-inject"
    &gt;</xsl:text>
	
    <div class="inherit-bg site-header">
     <div class="container">

        <div class="desktop-hidden">
           <button class="site-header-button slider-backdrop-above slider-open btn-glass white" data-target="flyout-navigation"><i class="icon24-menu"></i></button>
           <button class="site-header-button slider-backdrop-above slider-open btn-glass white" data-target="flyout-search"><i class="icon24-search"></i></button>
        </div>  

	    <h1 class="gamma-uc"><a href="/newventurecompetition/" class="white">New Venture Competition</a></h1>
        <ul class="toolbar">
            <li>
                <a href="/competitiveness/events/Pages/default.aspx">
                <xsl:if test="contains(Request/PATH_INFO,'events')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                Events</a>
            </li>
            <li>
                <a href="/competitiveness/partners/Pages/default.aspx">
                <xsl:if test="contains(Request/PATH_INFO,'partners')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                Partners</a>
            </li>
            <li>
                <a href="/competitiveness/faq/Pages/default.aspx">
                <xsl:if test="contains(Request/PATH_INFO,'faq')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                FAQ</a>
            </li>
        </ul>
        <div class="hr desktop-visible"></div>
        <table class="navbar">
            <tr>
            <td class="first" width="15%">
                <a href="/healthcare/mba-experience">
                <xsl:if test="contains(Request/PATH_INFO,'mba-experience')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                MBA Experience</a>
            </td>
            <td><div class="divider"></div></td>
            <td>
                <a href="/healthcare/faculty">
                <xsl:if test="contains(Request/PATH_INFO,'faculty')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                Faculty &amp; Research</a>
            </td>
            <td><div class="divider"></div></td>
            <td>
                <a href="/healthcare/executive-education">
                <xsl:if test="contains(Request/PATH_INFO,'executive-education')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                Executive Education</a>
            </td>
            <td><div class="divider"></div></td>
            <td>
                <a href="/healthcare/initiative">
                <xsl:if test="contains(Request/PATH_INFO,'initiative')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                Health Care Initiative</a>
            </td>
            <td><div class="divider"></div></td>
            <td class="last">
                <a href="/healthcare/faqs">
                <xsl:if test="contains(Request/PATH_INFO,'faqs')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                Faqs</a>
            </td>
            </tr>
        </table>
        <div class="hr desktop-visible"></div>
      </div>
     </div>

	    
	    
	</xsl:template>
</xsl:stylesheet>

