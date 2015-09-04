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

               <Collection>
                    <xsl:call-template name="HBSWebSubsets"/>

                    <Subset Label="Recruiting" Name="default" SubsetFilter="Recruiting"
                            FacetGroup="DefaultFacets" EndPoint="web">
                    </Subset>

               </Collection>

               <EndPoints>
                  <xsl:call-template name="HBSWebEndPoints"/>
               </EndPoints> 

               <FacetGroups>
                  <xsl:call-template name="HBSWebFacets"/>
               </FacetGroups> 

               <Page Mode="Standalone">
                  <Breadcrumb Name="Recruiting" Url="/"/>
               </Page>

            </SearchSettings>

            <hbs:Repeat/>
        </Search1>
    </xsl:template>


</xsl:stylesheet>
