<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
    <xsl:param name="args"/>
    <xsl:output omit-xml-declaration="yes" method="html"/>
    <xsl:template match="/Root">
      <Step1>
        <xsl:if test="hbs:Request/debug='head'"><hbs:Debug/></xsl:if>

        <Request>
          <xsl:copy-of select="hbs:Request/SERVER_NAME"/>
          <xsl:copy-of select="hbs:Request/LOCAL_ADDR"/>
          <xsl:copy-of select="hbs:Request/PATH_INFO"/>
        </Request>
        <hbs:GetPage/>
        <UniversalHead>
            <hbs:GetRemote>
                <Cache Key="hbs.universal.head" RecoverOnError="True" Minutes="720"/>
                <xsl:choose>
                  <xsl:when test="contains(hbs:Request/SERVER_NAME,'dev') or contains(hbs:Request/SERVER_NAME, 'qa')">
                    <Request Url="http://webdev.hbs.edu/shared/ssi/v2/universal.head.html" ResultType="Text">
                       <Header Name="Timeout" Value="3000"/>
                    </Request>
                  </xsl:when>
                  <xsl:otherwise>
                    <Request Url="http://www.hbs.edu/shared/ssi/v2/universal.head.html" ResultType="Text">
                       <Header Name="Timeout" Value="3000"/>
                    </Request>
                  </xsl:otherwise>
                </xsl:choose>
            </hbs:GetRemote>
        </UniversalHead>
        <hbs:Repeat/>
      </Step1>
    </xsl:template>


    <xsl:template match="/Step1" xml:space="preserve">
         <Render>
            <xsl:copy-of select="Request|UniversalHead"/>
            <hbs:SetControl Name="PageTitle">
              <xsl:choose>
                  <xsl:when test="hbs:Page/z:row/@ows_Title = 'Home'">
                     New Venture Competition - Harvard Business School
                  </xsl:when>
                  <xsl:when test="hbs:Page/z:row/@ows_Title = 'Profile Details'"></xsl:when>
                  <xsl:when test="hbs:Page/z:row/@ows_Title = 'topic'"></xsl:when>
                  <xsl:when test="hbs:Page/z:row">
                     <xsl:value-of select="hbs:Page/z:row/@ows_Title"/> - New Venture Competition - Harvard Business School
                  </xsl:when>
              </xsl:choose>
            </hbs:SetControl>
            <hbs:GetTime/>
            <hbs:SetResponse>
               <Header Name="X-UA-Compatible" Value="IE=edge"/>
            </hbs:SetResponse>
            <hbs:Repeat/>
         </Render>
    </xsl:template>


    <xsl:template match="/Render" xml:space="preserve">

        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        
        <xsl:value-of select="UniversalHead/hbs:Response" disable-output-escaping="yes"/>
       
        <link rel="stylesheet" href="/newventurecompetition/Style Library/hbs/css/nvc.css" type="text/css" media="screen" />
        
        <link rel="image_src" href="http://www.hbs.edu/images/site/sharelogo.jpg" />
        <meta name="HBSSearchUrl" content="/Pages/search.aspx"/>
        <!--<meta name="HBSSearchSubset" content="sitename"/>-->
        <meta name="PageBuildDateTime" content="{hbs:Time/Sortable} on {Request/LOCAL_ADDR}"/>

    </xsl:template>
</xsl:stylesheet>


