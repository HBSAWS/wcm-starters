<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
    <xsl:param name="args"/>
	<xsl:output method="html" omit-xml-declaration="yes"/>
	<xsl:template match="/Root">

	<xsl:variable name="root" xml:space="default">/newventurecompetition</xsl:variable>

	
	  <Render>
	    <xsl:if test="hbs:Request/debug='footer'"><hbs:Debug/></xsl:if>
	    <Footer>	
	        <hbs:GetRemote>
				<Cache Key="hbs.SITENAME.universal.footer" RecoverOnError="True" Minutes="720"/>
				<Request Url="http://www.hbs.edu/shared/ssi/site-specific/universal.footer.nvc.html" ResultType="Text">
                   <Header Name="Timeout" Value="3000"/>
                </Request>
			</hbs:GetRemote>
		</Footer>
	    <hbs:Repeat/>
	  </Render>
	</xsl:template>
	<xsl:template match="/Render">
        <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> <!-- closing color wrapper -->
        <div class="responsive-framework">
           <xsl:value-of select="Footer/hbs:Response" disable-output-escaping="yes"/>
        </div>
    </xsl:template>
</xsl:stylesheet>
