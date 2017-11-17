<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
   
   
    <xsl:import href="{$templates}/layouts/layouts.xsl"/>

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
                     <Breadcrumb/>
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

    <xsl:template match="Research">
        <xsl:variable name="spquery">
			<hbs:SPQuery>
			    <Site Path="/managing-the-future-of-work" />
			    <List Url="/managing-the-future-of-work/Lists/Research" />
			    <Cache Key="hbs.managing.research" Minutes="20" CheckForListChanges="True" />
			    <View>
			        <Query>
			            <Where>
			               <Eq><FieldRef Name="Visibility" /><Value Type="Text">Visible</Value></Eq>
			            </Where>
			            <OrderBy><FieldRef Name="Date" Ascending="FALSE"/></OrderBy>
			        </Query>
			        <RowLimit>100</RowLimit>
			    </View>
			</hbs:SPQuery>
        </xsl:variable>
        <xsl:variable name="spquery-results" select="msxsl:node-set(hbs:Eval($spquery))"/>

    	<xsl:variable name="research">
    	    
		    <ResearchList>
		        <xsl:for-each select="$spquery-results/hbs:QueryResults/z:row">
		        	<xsl:variable name="img"><xsl:value-of select="substring-before(substring-after(@ows_RelatedImage,'src=&quot;'),'&quot;')"/></xsl:variable>
		        
			    	<Item>
			            <Title Href="{@ows_Link}"><xsl:value-of select="@ows_Title"/></Title>  
			            <SubTitle><xsl:value-of select="@ows_SubTitle"/></SubTitle>
			            <Date><xsl:value-of select="hbs:ParseDate(substring-before(@ows_Date,' '),'yyyy-MM-dd','dd MMM yyyy')/@Formatted"/></Date>
			            <Source><xsl:value-of select="@ows_Source"/></Source>
			            <xsl:if test="@ows_Byline != ''"><Author xml:space="preserve"><xsl:value-of select="@ows_Attribution"/> <xsl:value-of select="@ows_Byline"/></Author></xsl:if>
			            <EditUrl>/managing-the-future-of-work/Lists/Research/EditForm.aspx?ID=<xsl:value-of select="@ows_ID"/></EditUrl>
			            <xsl:if test="$img != ''"><Image><xsl:value-of select="$img"/></Image></xsl:if>
			            <xsl:if test="@ows_Blurb"><Blurb><xsl:value-of select="@ows_Blurb"/></Blurb></xsl:if>
			        </Item>
		        </xsl:for-each>
	        </ResearchList>
        </xsl:variable>
        <xsl:apply-templates select="msxsl:node-set($research)"/>
        <div class="base tablet-base mobile-base"/>
    </xsl:template>

   

</xsl:stylesheet>
