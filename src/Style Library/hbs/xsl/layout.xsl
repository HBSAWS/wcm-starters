<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
   
   
    <xsl:import href="http://webdev.hbs.edu/shared/templates/heroes/research-hero-home.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/heroes/research-hero.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/features/featured-media.xsl"/> 
    <xsl:import href="http://webdev.hbs.edu/shared/templates/sidebars/sidebar-container.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/sidebars/sidebar-newsroom.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/lists/people-list.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/layouts/layouts.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/lists/leadership-list.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/features/media-coverage.xsl"/>

    <xsl:import href="http://webdev.hbs.edu/shared/templates/headers/page-header-traditional.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/templates/features/stats-traditional.xsl"/>

    <xsl:param name="args"/> 
    <xsl:output method="html"/>

    <xsl:template match="/Root">
        <Render>
            <xsl:if test="hbs:Request/debug='true' and hbs:UserIsSiteAdmin()">
                <hbs:Debug/>
            </xsl:if>

            <xsl:variable name="header" select="hbs:TryParseXml(hbs:GetPageProperty('PageHeaderXml'))"/>

            <Header>
               <!-- inject the breadcrumb -->
               <xsl:for-each select="$header/*">
                  <xsl:element name="{name()}">
                     <Breadcrumb Xsl="core-breadcrumb.xsl"/>
                     <xsl:copy-of select="node()"/>
                  </xsl:element>
               </xsl:for-each>
            </Header>

            <Body>
               <xsl:copy-of select="hbs:TryParseXml(hbs:GetPageProperty('PageContentXml'))/*"/>
            </Body>
            
            <xsl:variable name="sidebar" select="hbs:TryParseXml(hbs:GetPageProperty('PageSidebarXml'))/*"/>

            <xsl:if test="$sidebar">
                <Sidebar>
                   <SidebarContainer>
                      <xsl:copy-of select="$sidebar"/>
                   </SidebarContainer>
                </Sidebar>
            </xsl:if>

            <hbs:Repeat/>
        </Render>
    </xsl:template>

    <xsl:template match="/Render">
        
        <div class="page-header inherit-bg h1-aplha-uc">
            <xsl:apply-templates select="Header"/>
        </div>
        
        <xsl:choose>
           <xsl:when test="Body/Search">
                <xsl:apply-templates select="Body"/>
                <div class="base tablet-base mobile-base"></div>
           </xsl:when>
           
           <!--Page with Sidebar, do 8-12 -->
           <xsl:when test="Sidebar">
                <div class="container mobile-container tablet-container">
                    <div class="row">
                        <div class="span8 body-margins">
                            <div class="cap mobile-cap tablet-cap"></div>
                            <xsl:apply-templates select="Body"/>
                            <div class="base"></div>
                        </div>
                        <div class="span4 sidebar sidebar-margins">
                            <xsl:apply-templates select="Sidebar"/>
                            <div class="base"></div>
                        </div>                      
                    </div>
                </div>
           </xsl:when>
           <xsl:otherwise>
                <div class="container mobile-container tablet-container">
                    <div class="cap mobile-cap tablet-cap"></div>
                    <div class="row">
                        <div class="span12 body-margins">
                        
                            <xsl:apply-templates select="Body"/>
                        </div>
                    </div>
                    <div class="base"></div>
                </div>
           </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>
        
    <xsl:template match="Search">
       <xsl:value-of select="hbs:CallStr('stories-search.xsl',@Filter,@View)" disable-output-escaping="yes"/>
    </xsl:template>


</xsl:stylesheet>