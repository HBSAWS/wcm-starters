<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
    <xsl:param name="args"/>
    <xsl:output omit-xml-declaration="yes" method="html"/>
    
    <xsl:template match="/Root">
      <Step1>
        <xsl:if test="hbs:Request/debug='masterpage'"><hbs:Debug/></xsl:if>
        <Request>
          <xsl:copy-of select="hbs:Request/SERVER_NAME"/>
          <xsl:copy-of select="hbs:Request/LOCAL_ADDR"/>
          <xsl:copy-of select="hbs:Request/PATH_INFO"/>
        </Request>
        
        <xsl:choose>
            <xsl:when test="$args = 'head'"> 
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
            </xsl:when>
            <xsl:when test="$args = 'supernav'">
                <UniversalHeader>
                    <hbs:GetRemote>
                        <Cache Key="hbs.universal.header" RecoverOnError="True" Minutes="20"/>
                        <Header Name="Timeout" Value="1000"/>
                        <Request Url="http://www.hbs.edu/shared/ssi/universal.header.html" ResultType="Text"/>
                    </hbs:GetRemote>
                </UniversalHeader>
            </xsl:when>
            <xsl:when test="$args = 'header'">
            </xsl:when>
            <xsl:when test="$args = 'footer'">
                <Footer>    
                    <hbs:GetRemote>
                        <Cache Key="hbs.universal.footer" RecoverOnError="True" Minutes="720"/>
                        <Request Url="http://www.hbs.edu/shared/ssi/site-specific/universal.footer.nvc.html" ResultType="Text">
                           <Header Name="Timeout" Value="3000"/>
                        </Request>
                    </hbs:GetRemote>
                </Footer>
            </xsl:when>
            <xsl:when test="$args = 'js'">
                <UniversalJS>
                    <hbs:GetRemote>
                        <Cache Key="hbs.universal.js" RecoverOnError="True" Minutes="720"/>
                        <xsl:choose>
                          <xsl:when test="contains(hbs:Request/SERVER_NAME,'authdev')">
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
            </xsl:when>
        </xsl:choose>
        <hbs:Repeat/>
      </Step1>
    </xsl:template>


    <xsl:template match="/Step1" xml:space="preserve">
         <Render>
            <xsl:copy-of select="Request|UniversalHead|Footer|UniversalJS|UniversalHeader"/>
            <xsl:choose>
                <xsl:when test="$args = 'head'">
                    <xsl:variable name="title" select="hbs:GetPageProperty('Title')"/>
                    <hbs:SetControl Name="PageTitle">
                      <xsl:choose>
                          <xsl:when test="$title = 'Home'">
                             New Venture Competition - Harvard Business School
                          </xsl:when>
                          <xsl:when test="$title = 'topic'"></xsl:when>
                          <xsl:when test="$title">
                             <xsl:value-of select="$title"/> - New Venture Competition - Harvard Business School
                          </xsl:when>
                      </xsl:choose>
                    </hbs:SetControl>
                    <hbs:SetResponse>
                       <Header Name="X-UA-Compatible" Value="IE=edge"/>
                    </hbs:SetResponse>
                </xsl:when>
                <xsl:when test="$args = 'supernav'">
                </xsl:when>
                <xsl:when test="$args = 'header'">
                </xsl:when>
                <xsl:when test="$args = 'footer'">
                </xsl:when>
                <xsl:when test="$args = 'js'">
                </xsl:when>
            </xsl:choose>
            <hbs:Repeat/>
         </Render>
    </xsl:template>


    <xsl:template match="/Render">
        <xsl:choose>
            <xsl:when test="$args = 'head'">
                <meta name="viewport" content="width=device-width,initial-scale=1"/>
                <xsl:value-of select="UniversalHead/hbs:Response" disable-output-escaping="yes"/>
                <link rel="stylesheet" href="/newventurecompetition/Style Library/hbs/css/nvc.css" type="text/css" media="screen" />
                <link rel="image_src" href="http://www.hbs.edu/images/site/sharelogo.jpg" />
                <meta name="HBSSearchUrl" content="/Pages/search.aspx"/>
                <!--<meta name="HBSSearchSubset" content="sitename"/>-->
                <meta name="PageBuildDateTime" content="{hbs:Time/Sortable} on {Request/LOCAL_ADDR}"/>
            </xsl:when>
            <xsl:when test="$args = 'supernav'">
                <div xml:space="preserve">
                    <xsl:value-of select="UniversalHeader/hbs:Response" disable-output-escaping="yes"/>
                </div>
            </xsl:when>
            <xsl:when test="$args = 'header'">
                <xsl:variable name="headerColor">
                   <xsl:value-of select="hbs:Or(hbs:GetPageProperty('PrimaryColor'),'silver')"/>-inherit
                </xsl:variable>
                
                <div class="back-to-top"><a href="#" class="icon-back-to-top"></a></div> 
            
                <xsl:text disable-output-escaping="yes">&lt;div class="</xsl:text><xsl:value-of select="normalize-space($headerColor)"/><xsl:text disable-output-escaping="yes"> 
                     responsive-type slider-inject"
                &gt;</xsl:text>
                
                <div class="inherit-bg site-header">
                 <div class="container">
            
                    <div class="desktop-hidden">
                       <button class="site-header-button slider-backdrop-above slider-open btn-glass white" data-target="flyout-navigation"><i class="icon24-menu"></i></button>
                       <button class="site-header-button slider-backdrop-above slider-open btn-glass white" data-target="flyout-search"><i class="icon24-search"></i></button>
                    </div>  
            
                    <h1 class="gamma-uc"><a href="/newventurecompetition/" class="white">New Venture Competition</a></h1>
                    <ul class="toolbar">
                        <li>
                            <a href="/competitiveness/events/Pages/default.aspx">
                            <xsl:if test="contains(Request/PATH_INFO,'events')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                            Events</a>
                        </li>
                        <li>
                            <a href="/competitiveness/partners/Pages/default.aspx">
                            <xsl:if test="contains(Request/PATH_INFO,'partners')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                            Partners</a>
                        </li>
                        <li>
                            <a href="/competitiveness/faq/Pages/default.aspx">
                            <xsl:if test="contains(Request/PATH_INFO,'faq')"><xsl:attribute name="class">white</xsl:attribute></xsl:if>
                            FAQ</a>
                        </li>
                    </ul>
                    <div class="hr desktop-visible"></div>
                    <table class="navbar">
                        <tr>
                        <td class="first" width="15%">
                            <a href="/healthcare/mba-experience">
                            <xsl:if test="contains(Request/PATH_INFO,'mba-experience')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            MBA Experience</a>
                        </td>
                        <td><div class="divider"></div></td>
                        <td>
                            <a href="/healthcare/faculty">
                            <xsl:if test="contains(Request/PATH_INFO,'faculty')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            Faculty &amp; Research</a>
                        </td>
                        <td><div class="divider"></div></td>
                        <td>
                            <a href="/healthcare/executive-education">
                            <xsl:if test="contains(Request/PATH_INFO,'executive-education')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            Executive Education</a>
                        </td>
                        <td><div class="divider"></div></td>
                        <td>
                            <a href="/healthcare/initiative">
                            <xsl:if test="contains(Request/PATH_INFO,'initiative')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            Health Care Initiative</a>
                        </td>
                        <td><div class="divider"></div></td>
                        <td class="last">
                            <a href="/healthcare/faqs">
                            <xsl:if test="contains(Request/PATH_INFO,'faqs')"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
                            Faqs</a>
                        </td>
                        </tr>
                    </table>
                    <div class="hr desktop-visible"></div>
                  </div>
                 </div>

            
            </xsl:when>
            <xsl:when test="$args = 'footer'">
                <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text> <!-- closing color wrapper -->
                <div class="responsive-framework">
                   <xsl:value-of select="Footer/hbs:Response" disable-output-escaping="yes"/>
                </div>
            </xsl:when>
            <xsl:when test="$args = 'js'">
                <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
                <xsl:value-of select="UniversalJS/hbs:Response" disable-output-escaping="yes"/>
                <script type="text/javascript" src="http://www.hbs.edu/shared/js/widgets.js"></script>
                <script type="text/javascript" src="/Style Library/hbs/js/isc.js"></script>
                <script type="text/javascript" src="http://www.hbs.edu/js/analytics.js"></script>
                <script type="text/javascript">analytics.settings({profile:'isc'})</script>             
            </xsl:when>
        </xsl:choose>        
    </xsl:template>
    
</xsl:stylesheet>

