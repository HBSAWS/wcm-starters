<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

    <xsl:import href="http://www.hbs.edu/shared/components/search1/xsl/search1.xsl"/>
    <xsl:output method="html"/>

    <xsl:template match="/Root">
        <Search1>
            <xsl:if test="hbs:Request/debug"><hbs:Debug/></xsl:if>
            <xsl:copy-of select="hbs:Request"/>

            <SearchSettings>

               <WebRoot Url="http://www.hbs.edu/shared/components/search1"/>
               
               <!--<Style IndividualPages="True" Sidebar="True" />-->
               
               <Collection>
                    <xsl:call-template name="HBSWebSubsets"/>

                    <Subset Label="Recruiting" Name="default" SubsetFilter="Recruiting"
                            FacetGroup="DefaultFacets" EndPoint="web">
                    </Subset>

               </Collection>

               <EndPoints>
                  <xsl:call-template name="HBSWebEndPoints">
                    <!-- disable grouping -->
                    <!-- <xsl:with-param name="Group" select="'False'"/> -->

                    <!-- point to production content -->
                    <!-- <xsl:with-param name="Prod" select="true()"/> -->

                  </xsl:call-template>
               </EndPoints> 

               <FacetGroups>
                  <xsl:call-template name="HBSWebFacets"/>
                  
                  <!--
                  <FacetGroup Name="ExampleFacets" Sort="True">
                     <Facet Name="HBSSubset" Type="Subsets"/>
                     <Facet Name="q" Type="Search"/>
                     <Facet Name="HBSWebsite" Label="Website" Type="List"/>
                     <Facet Name="HBSTopic" Label="Topics" Type="HierList" Zeros="True" />
			<Facet Name="type" Field="HBSContentType" Label="Type" Type="List" MoreLimit="20"/>
			<Facet Name="topic" Field="HBSTopic" Label="Topic" Type="HierList"/>
			<Facet Name="industry" Field="HBSIndustry" Label="Industry" Type="BigList" MoreStyle="AZList" DefaultCollapsed="True"/>
			<Facet Name="region" Field="HBSGeographicArea" Label="Geographic Area" Type="HierList" DefaultCollapsed="True" MoreLimit="20"/>
			<Facet Name="faculty" Field="HBSCurrentFaculty" Label="Current Faculty" Type="AZList" Zeros="True" ComplexFacet="True" DefaultCollapsed="True"/>
			<Facet Name="emeriti" Field="HBSEmeritiFaculty" Label="Emeriti Faculty" Type="AZList" Zeros="True" ComplexFacet="True" DefaultCollapsed="True"/>
			<Facet Name="date" Field="HBSSortDate" Label="Date" Type="DateRange" xMinDate="01/01/2012" DefaultCollapsed="True"/>
			<Facet Name="format" Field="HBSFormat" Label="Format" Type="List" MoreLimit="20" DefaultCollapsed="True"/>
			<Facet Name="keyword" Field="HBSKeyword" Label="Keyword" Type="Hidden" Hidden="True"/>
			<Facet Name="language" Field="HBSLanguage" Label="Languages" Type="List" MoreLimit="20" DefaultCollapsed="True"/>
			<Facet Name="unit" Field="HBSCompanyUnit" Label="Academic Unit" Type="List" MoreLimit="20" DefaultCollapsed="True"/>
	              <Facet Type="Html">
		              <div class="shim24"></div>
		              <div><a class="mu" href="/leadership/20th-century-leaders/Pages/charts-and-statistics.aspx">Charts &amp; Statistics</a></div>
	              </Facet>

                  -->
                  
                  <!-- examples of complex facet data 
                  
                  <arr name="HBSGeographicArea">
      <str>|t=US Northeast|p=United States|</str>
      <str>|t=United States|</str>
      <str>|t=US West|p=United States|</str>
      <str>|t=United States|</str>
    </arr> 
                  -->
		            
               </FacetGroups> 
                  
               </FacetGroups> 

               <Page Mode="Standalone" _Title="Custom Title">
                  <Breadcrumb Name="Recruiting" Url="/"/>
               </Page>

            </SearchSettings>

            <hbs:Repeat/>
        </Search1>
    </xsl:template>


</xsl:stylesheet>
