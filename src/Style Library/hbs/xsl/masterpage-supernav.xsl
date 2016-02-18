<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
	<xsl:output method="html" omit-xml-declaration="yes"/>
	<xsl:template match="/Root">
	  <Render>
	    <hbs:xDebug/>
	    <UniversalHeader>
	        <hbs:GetRemote>
				<Cache Key="hbs.SITENAME.universal.header" RecoverOnError="True" Minutes="20"/>
				<Header Name="Timeout" Value="1000"/>
				<Request Url="http://www.hbs.edu/shared/ssi/universal.header.html" ResultType="Text"/>
			</hbs:GetRemote>
		</UniversalHeader>
	    <hbs:Repeat/>
	  </Render>
	</xsl:template>
	<xsl:template match="/Render">
	  <div xml:space="preserve" class="responsive-framework">
         <xsl:value-of select="UniversalHeader/hbs:Response" disable-output-escaping="yes"/>
      </div>
    </xsl:template>

</xsl:stylesheet>
