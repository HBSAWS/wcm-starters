<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
    xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="hbs z msxsl">

    <xsl:output method="html" omit-xml-declaration="yes"/>
    <xsl:template match="/Root">
        <Render>
            <FeaturedMedia>
                <Title>Featured Videos</Title>
                <Media Type="Video">
                    <EditUrl>/healthcare/Lists/Assets/EditForm.aspx?ID=7</EditUrl> 
                    <DisplayDate>25 May 2016</DisplayDate>
                    <Title>Professor John Beshears on the nudge movement</Title>
                    <Byline>Re: John Beshears</Byline>
                    <Link>http://www.hbs.edu/about/video.aspx?v=1_zipr4ioq</Link>
                    <Thumbnail>http://cfvod.kaltura.com/p/1423662/sp/142366200/thumbnail/entry_id/1_zipr4ioq/version/100011/acv/291/height/480</Thumbnail>
                </Media>
                <Media Type="Video">
                    <EditUrl>/healthcare/Lists/Assets/EditForm.aspx?ID=8</EditUrl> 
                    <DisplayDate>23 Jun 2016</DisplayDate>
                    <Title>Making better decisions when it comes to your health</Title>
                    <Byline>Re: Leslie John</Byline>
                    <Link>http://www.hbs.edu/about/video.aspx?v=1_izq5h7ne</Link>
                    <Thumbnail>http://cfvod.kaltura.com/p/1423662/sp/142366200/thumbnail/entry_id/1_izq5h7ne/version/100011/acv/291/height/480</Thumbnail>
                </Media>
                <More Href="http://www.hbs.edu/healthcare/impact/Pages/default.aspx?format=Video">More Videos</More>
            </FeaturedMedia>
            <hbs:Repeat/>
        </Render>
    </xsl:template>

    <xsl:template match="/Render">
        <xsl:apply-templates mode="render"/>
    </xsl:template>


<!-- 

Templates 

-->


	<xsl:template match="FeaturedMedia" mode="render">
	    <h3 class="gamma-uc"><xsl:value-of select="Title"/></h3>
	    <div class="shim24"></div>
	    <div class="desktop-visible tablet-visible social-featured-video">
	        <div class="row tablet-row">
	            <xsl:for-each select="Media">
	                <div class="span4 tablet-span6">
	                    <a href="{Link}" class="tile widget-video-popup" data-wcm-edit-url="{EditUrl}">
	                        <div class="stroke0"><img class="o fluid" src="{Thumbnail}"/>
	                            <xsl:if test="@Type = 'Video'"><span class="icon-play"></span></xsl:if>
	                        </div>
	                        <div class="shim9"></div>
	                        <div class="media">
	                            <ul class="linear mu-uc black">
	                                <li><xsl:value-of select="DisplayDate"/></li>
	                            </ul>
	                            <div class="eta u"><xsl:value-of select="Title"/></div>
	                            <div class="shim5"></div>
	                            <div class="nu black"><xsl:value-of select="Byline"/></div>
	                        </div>
	                    </a>
	                </div>	
	            </xsl:for-each>
	        </div>
	    </div>	
	
	    <div class="mobile-visible">
	        <div class="row mobile-row">
	            <div class="carousel-container">
	                <ul class="carousel-panels">
	                    <xsl:for-each select="Media">
	                        <li>
	                            <a href="{Link}" class="tile widget-video-inline">
	                                <div class="stroke0">
	                                    <img class="o fluid" src="{Thumbnail}"/>
	                                    <xsl:if test="@Type = 'Video'"><span class="icon-play"></span></xsl:if>
	                                </div>
	                            </a>
	                            <div class="shim9"></div>
	                            <div class="media">
	                                <ul class="linear mu-uc black">
	                                    <li><xsl:value-of select="DisplayDate"/></li>
	                                </ul>
	                                <div class="shim6"></div>
	                                <div class="mu-uc"><xsl:value-of select="Title"/></div>
	                                <div class="shim5"></div>
	                                <div class="nu black"><xsl:value-of select="Byline"/></div>
	                            </div>
	                        </li>
	                    </xsl:for-each>
	                </ul>
	                <div class="carousel-nav carousel-nav-centered desktop-hidden"> </div>
	            </div>
	        </div>
	    </div>
	
	    <xsl:for-each select="More">
	        <div class="shim25"></div>
	        <p class="more"><span class="txt-arrow">&#x2192;</span><a href="{@Href}"><xsl:copy-of select="node()"/></a></p>
	    </xsl:for-each>
	</xsl:template>



</xsl:stylesheet>