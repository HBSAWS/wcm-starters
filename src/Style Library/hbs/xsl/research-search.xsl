<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

    <xsl:import href="lib/queries.xsl"/>
    <xsl:import href="http://webdev.hbs.edu/shared/components/search1/xsl/search1.xsl"/>

    <xsl:output method="html"/>
    
    <xsl:template match="/Root">
    	<Step1>
            <xsl:if test="hbs:Request/debug"><hbs:Debug/></xsl:if>
            <xsl:copy-of select="hbs:Request"/>
            
            <RelatedFaculty>
           	 	<xsl:call-template name="query-research-faculty"></xsl:call-template>
            </RelatedFaculty>
            
            <hbs:Repeat/>
    	</Step1>
    </xsl:template>
    
    <xsl:template match="/Step1">    	
        <Search1>
            <xsl:if test="hbs:Request/debug"><hbs:Debug/></xsl:if>
            <xsl:copy-of select="hbs:Request"/>
            <SearchSettings>
		       
               <WebRoot Url="http://www.hbs.edu/shared/components/search1"/>
               
               <Style Sidebar="True" HideSource="True"/>
				
               <Collection>
                    <Subset Label="Faculty &amp; Research" Name="default" 
                            SubsetFilter="FacultyPublications"
                            Step="12"
                            Filter="HBSDataSource:GenderStories AND -HBSVisibility:Hidden"
                            FacetGroup="RISFacets" EndPoint="web">
                            <xsl:if test="not(hbs:Request/q)">
                              <xsl:attribute name="Sort">HBSSortDate desc</xsl:attribute>
                            </xsl:if>
                    </Subset>
               </Collection>
               
               <Sidebar Style="Faculty">
                  <xsl:for-each select="RelatedFaculty/hbs:QueryResults/z:row">
                      <Faculty ID="{@ows_FacID}" Leadership="{hbs:If(@ows_FacultyType = 'Leadership','True','False')}"/>
                  </xsl:for-each>
               </Sidebar>

               <EndPoints>
                  <xsl:call-template name="HBSWebEndPoints"/>
               </EndPoints>
		  		
               <FacetGroups>
                    <FacetGroup Name="RISFacets" Sort="False">
                        <Facet Name="q" Type="Search" SearchWithin="True"/>
                        <Facet Name="topic" Field="HBSTopic" Label="Topics" Type="List" Zeros="True" MoreLimit="16" />
                        <Facet Name="faculty" Field="HBSFaculty" Label="Faculty" Type="AZList" ComplexFacet="True" Counts="False" DefaultCollapsed="True"/>
                        <!--<Facet Name="facultySidebar" Field="HBSFaculty" Label="Faculty" Type="List" Op="And" Hidden="True"/>-->
                    </FacetGroup>
               </FacetGroups> 
            </SearchSettings>
            
            <hbs:Repeat/>
        </Search1>
    </xsl:template>

    <xsl:template name="render-custom-sidebar">
       <xsl:param name="results"/>
       <xsl:param name="request"/>
       <xsl:param name="settings"/>
       <xsl:call-template name="render-faculty-sidebar">
          <xsl:with-param name="leadership-title" select="'Initiative Leadership'"/>
          <xsl:with-param name="results" select="$results"/>
          <xsl:with-param name="request" select="$request"/>
          <xsl:with-param name="settings" select="$settings"/>
       </xsl:call-template>
    </xsl:template>
        
</xsl:stylesheet>

