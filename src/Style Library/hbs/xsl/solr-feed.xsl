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
               <field name="HBSTitle"></field>
               <field name="HBSBody"></field>
               <field name="HBSLink"></field>
               <xsl:for-each select="hbs:Multivalue('lookup', @ows_Topics)">
                  <field name="HBSTopic"><xsl:value-of select="@Val"/></field>
               </xsl:for-each>
               <!-- HBSDisplayDate -->
               <xsl:variable name="startdate" select="@ows_Date"/>
               <xsl:variable name="enddate" select="@ows_EndDate"/>

               <xsl:variable name="tz" select="hbs:Split($startdate,' ')[position() = last()]/@Val"/>
               <xsl:variable name="startday" select="hbs:Split($startdate,' ')[position() = 1]/@Val"/>
               <xsl:variable name="endday" select="hbs:Split($enddate,' ')[position() = 1]/@Val"/>

               <xsl:variable name="starttime" select="hbs:Split($startdate,' ')[position() = 2]/@Val"/>
               <xsl:variable name="endtime" select="hbs:Split($enddate,' ')[position() = 2]/@Val"/>

               <xsl:variable name="displaydate" xml:space="preserve">
                  <xsl:value-of select="hbs:ParseDate($starttime,'HH:mm:ss','h:mm tt')/@Formatted"/> - <xsl:value-of select="hbs:ParseDate($endtime,'HH:mm:ss','h:mm tt')/@Formatted"/> 
                  <xsl:value-of select="$tz"/>
                  <xsl:choose>
                     <xsl:when test="$startday = $endday">
                        <xsl:value-of select="hbs:ParseDate($startday,'yyyy-M-d','dd MMM yyyy')/@Formatted"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$startday"/> – <xsl:value-of select="$endday"/>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>

               <field name="HBSDisplayDate"><xsl:value-of select="normalize-space($displaydate)"/></field>
               
               <!-- for Hierarchy Topic/Industry/Locations Facets -->
               
               <xsl:for-each select="eventTags/eventTag[eventTagName='Topics']">
                  <xsl:call-template name="nested-lookup-loop">
                     <xsl:with-param name="Term" select="eventTagDesc"/>
                     <!-- query local topics list for this $RelatedTopics variable -->
                     <xsl:with-param name="TermSet" select="$RelatedTopics"/>
                     <xsl:with-param name="FieldName" select="'HBSTopic'"/>
                  </xsl:call-template>
               </xsl:for-each>

               <xsl:for-each select="eventTags/eventTag[eventTagName='Industry']">
                  <xsl:call-template name="nested-lookup-loop">
                     <xsl:with-param name="Term" select="eventTagDesc"/>
                     <!-- query local industries list for this $RelatedIndustries variable -->
                     <xsl:with-param name="TermSet" select="$RelatedIndustries"/>
                     <xsl:with-param name="FieldName" select="'HBSIndustries'"/>
                  </xsl:call-template>
               </xsl:for-each>
               
               <xsl:for-each select="eventTags/eventTag[eventTagName='Location']">
                  <xsl:call-template name="nested-lookup-loop">
                     <xsl:with-param name="Term" select="eventTagDesc"/>
                     <!-- query local locations list for this $RelatedLocations variable -->
                     <xsl:with-param name="TermSet" select="$RelatedLocations"/>
                     <xsl:with-param name="FieldName" select="'HBSGeographicArea'"/>
                  </xsl:call-template>
               </xsl:for-each>
            </doc>
         </xsl:for-each>
      </add>  
   </xsl:template>
   
   <!-- For Hierarachy facet rendering --> 
   <xsl:template name="nested-lookup-loop">
		<xsl:param name="Term"/>
		<xsl:param name="TermSet"/>
		<xsl:param name="FieldName"/>

		<xsl:variable name="Parent" select="$TermSet[@ows_Title = $Term]/@ows_Parent"/>
	
		<xsl:choose>
			<xsl:when test="$Parent != ''">
				<field name="{$FieldName}">|t=<xsl:value-of select="$Term"/>|p=<xsl:value-of select="$Parent"/>|</field>
				<xsl:call-template name="nested-lookup-loop">
					<xsl:with-param name="Term" select="$Parent"/>
					<xsl:with-param name="TermSet" select="$TermSet"/>
					<xsl:with-param name="FieldName" select="$FieldName"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<field name="{$FieldName}">|t=<xsl:value-of select="$Term"/>|</field>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
