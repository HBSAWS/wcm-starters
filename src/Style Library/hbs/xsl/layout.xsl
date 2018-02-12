<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
   
    <xsl:import href="{$templates}/layouts/auto-layout.xsl"/>
    <xsl:import href="{$templates}/headers/page-header.xsl"/>
    <xsl:import href="{$templates}/util/html-util.xsl"/>
    <xsl:import href="{$templates}/features/site-search.xsl"/>
    <xsl:import href="{$templates}/text/body-content.xsl"/>
    <xsl:import href="{$templates}/wcm/edit-panel.xsl"/>

    <!-- Left Nav (if needed) -->
    <xsl:import href="{$templates}/navigation/local-navigation.xsl"/>

    <xsl:param name="args"/> 
    <xsl:output method="html"/>

    <xsl:template match="/Root">
        <Render>
            <xsl:if test="hbs:Request/debug='true' and hbs:UserIsSiteAdmin()">
                <hbs:Debug/>
            </xsl:if>

            <AutoLayout>
              <xsl:variable name="header" select="hbs:TryParseXml(hbs:GetPageProperty('PageHeaderXml'))"/>
              <Header>
                 <xsl:choose>
                    <xsl:when test="not($header/*)">
                      <PageHeader AutoFill="True"/>
                    </xsl:when>
                    <xsl:otherwise>
                       <xsl:copy-of select="$header/*"/>
                    </xsl:otherwise>
                 </xsl:choose>
              </Header>

              <xsl:if test="$args = 'left-nav'">
                <LocalNavigation>
                  <Site Path="/project-url/section1/" Depth="2"/>
                  <Site Path="/project-url/section2/" Depth="2"/>
                </LocalNavigation>
              </xsl:if>

              <Body>
                <EditPanel/>
                <BodyContent>
                  <xsl:copy-of select="hbs:TryParseXml(hbs:GetPageProperty('PageContentXml'))/*"/>
                </BodyContent>
              </Body>
              
              <xsl:variable name="sidebar" select="hbs:TryParseXml(hbs:GetPageProperty('PageSidebarXml'))/*"/>

              <xsl:if test="$sidebar">
                  <Sidebar>
                     <SidebarBlockContainer>
                        <xsl:copy-of select="$sidebar"/>
                     </SidebarBlockContainer>
                  </Sidebar>
              </xsl:if>
            </AutoLayout>

            <hbs:Repeat/>
        </Render>
    </xsl:template>

    <xsl:template match="/Render">
        <xsl:apply-templates/>       
    </xsl:template>

    <!-- example of a SPQuery 

    <xsl:template match="Research">
        <xsl:variable name="query">
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
        <xsl:variable name="results" select="msxsl:node-set(hbs:Eval($query))"/>

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
    </xsl:template>-->

   

</xsl:stylesheet>
