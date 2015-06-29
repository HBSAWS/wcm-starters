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
	    <UniversalJS>
	        <hbs:GetRemote>
				<Cache Key="hbs.universal.js" RecoverOnError="True" Minutes="720"/>
				<xsl:choose>
				  <xsl:when test="contains(hbs:Request/SERVER_NAME,'dev')">
					<Request Url="http://webdev.hbs.edu/shared/ssi/v2/universal.js.html" ResultType="Text">
	                   <Header Name="Timeout" Value="3000"/>
	                </Request>
                  </xsl:when>
                  <xsl:otherwise>
					<Request Url="http://www.hbs.edu/shared/ssi/v2/universal.js.html" ResultType="Text">
	                   <Header Name="Timeout" Value="3000"/>
	                </Request>
                  </xsl:otherwise>
                </xsl:choose>
	        </hbs:GetRemote>
		</UniversalJS>

	    <Footer>	
	        <hbs:GetRemote>
				<Cache Key="hbs.nvc.universal.footer" RecoverOnError="True" Minutes="720"/>
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
        
        <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <xsl:value-of select="UniversalJS/hbs:Response" disable-output-escaping="yes"/>
        <script type="text/javascript" src="http://www.hbs.edu/shared/js/widgets.js"></script>
        <script type="text/javascript" src="/newventurecompetition/Style Library/hbs/js/nvc.js"></script> 
        <script type="text/javascript" src="http://www.hbs.edu/js/analytics.js"></script>
        <script type="text/javascript">analytics.settings({profile:'www'})</script>

    </xsl:template>
</xsl:stylesheet>