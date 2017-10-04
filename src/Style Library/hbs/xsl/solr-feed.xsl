<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:atom="http://www.w3.org/2005/Atom"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   xmlns:ext="http://www.hbs.edu/"
   exclude-result-prefixes="hbs z msxsl atom">
 
    <xsl:param name="args"/>
  
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    
    <xsl:template match="/Root">
        <Render>
            <xsl:copy-of select="hbs:Request"/>
            <xsl:if test="hbs:Request/debug = 'true'"><hbs:Debug/></xsl:if>
            <AllProfiles>
                <hbs:SPQuery Name="query-remote-stories">
                    <Site Path="~SiteCollection" />
                    <List Name="RemoteStories" />
                    <Cache Key="hbs.solr.hci.remote.stories.{hbs:Request/delta}.{hbs:Request/limit}.{hbs:Request/start}.{hbs:Request/end}" Minutes="20" CheckForListChanges="True" />
                    <View>
                        <Query>
                            <Where>
                                <And>
                                    <xsl:choose>
                                        <xsl:when test="hbs:Request/delta">
                                            <Gt>
                                                <FieldRef Name="Modified" />
                                                <Value Type="DateTime" IncludeTimeValue="TRUE">
                                                     <xsl:value-of select="hbs:GetOffsetDateTime('yyyy-MM-ddTHH:mm:ssZ',-10*60*1000)/@Formatted"/>
                                                </Value>
                                            </Gt>
                                        </xsl:when>
                                        <xsl:otherwise>
                                           <Gt>
                                                <FieldRef Name="ID" />
                                                <Value Type="Counter">0</Value>
                                           </Gt>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <Eq>
                                        <FieldRef Name="Status"/>
                                        <Value Type="Dropdown">Visible</Value>
                                    </Eq>
                                </And>
                            </Where>
                            <OrderBy>
                               <FieldRef Name="Modified" Ascending="TRUE"/>
                            </OrderBy>
                        </Query>
                        <RowLimit>50</RowLimit>
                     </View>
                     <QueryOptions>
                        <DatesInUtc>True</DatesInUtc>
                     </QueryOptions>
            </hbs:SPQuery>

            </AllProfiles>
            <hbs:Repeat/>
        </Render>
    </xsl:template>
   
  
   <xsl:template match="/Render">
      <add>
         <xsl:for-each select="AllProfiles/hbs:QueryResults/z:row">
            <doc>
               <field name="id"></field>
               <field name="HBSDataSource"></field>
               <xsl:if test="@ows_Visibility = 'Hidden'">
                  <field name="HBSDataLifecycle">Deleted</field>
               </xsl:if>
               <field name="HBSSource"></field>
               <field name="HBSSubset"></field>
               <field name="HBSModifiedDate"><xsl:value-of select="@ows_Modified"/></field>
               <field name="HBSSortDate"><xsl:value-of select="hbs:Replace(@ows_PublicationDate,' ','T')"/>Z</field>
               <field name="HBSTitle"></field>
               <field name="HBSBody"></field>
               <field name="HBSLink"></field>
            </doc>
         </xsl:for-each>
      </add>  
   </xsl:template>
   
</xsl:stylesheet>
