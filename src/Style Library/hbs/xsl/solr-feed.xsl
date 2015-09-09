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
		    	<hbs:SPQuery>
					<Site Path="~SiteCollection" />
					<List Name="Profiles" />
					<Cache Key="hbs.employment.profiles" Minutes="60" CheckForListChanges="'True'" />
					<View>
					</View>
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
					<field name="HBSSource"></field>
					<field name="HBSSubset"></field>
					<field name="HBSTitle"></field>
					<field name="HBSBody"></field>
					<field name="HBSLink"></field>
			     </doc>
			 </xsl:for-each>
		</add>  
	</xsl:template>
	

</xsl:stylesheet>
