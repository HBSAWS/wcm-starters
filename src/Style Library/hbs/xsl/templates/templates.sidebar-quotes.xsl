<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
    xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="hbs z msxsl">

    <xsl:output method="html" omit-xml-declaration="yes"/>
    <xsl:template match="/Root">
        <Render>
            <SidebarQuotes Random="True">
                <Media>
                    <EditUrl>/healthcare/Lists/Events/EditForm.aspx?ID=462</EditUrl> 
                    <Title>Martin Grasse</Title>
                    <Affiliation>MBA 2012</Affiliation>
                    <Img Src="http://www.hbs.edu/healthcare/PublishingImages/profiles/mgrasse440x440.jpg"/>
                    <Link>/healthcare/impact/Pages/story.aspx?num=3</Link>
                    <Quote>The combination of health care-specific courses and other more generally focused courses has provided a solid base for approaching the complicated issues involved in health care.</Quote>
                </Media>
                <Media>
                    <EditUrl>/healthcare/Lists/Events/EditForm.aspx?ID=461</EditUrl> 
                    <Title>Elena Avramov</Title>
                    <Affiliation>MBA 2013</Affiliation>
                    <Img Src="http://www.hbs.edu/healthcare/PublishingImages/profiles/eavramov440x440.jpg"/>
                    <Link>/healthcare/impact/Pages/story.aspx?num=3</Link>
                    <Quote>The second-year classes allowed me to delve deeper into health care and get to know several of the health care-focused faculty members.</Quote>
                </Media>
            </SidebarQuotes>
            <hbs:Repeat/>
        </Render>
    </xsl:template>

    <xsl:template match="/Render">
        <xsl:apply-templates mode="render"/>
    </xsl:template>


	<!-- 
	
	Templates 
	
	-->
	
	
	<xsl:template match="SidebarQuotes" mode="render">
	
	    <div class="carousel-container has-shuffle">
	        <ul class="carousel-panels">
	            <xsl:for-each select="Media">
	                <li data-wcm-edit-url="{EditUrl}">
	                    <div class="shim5"></div>
	                    <img src="{Img/@Src}" width="200" height="200" alt="{Title}"/>
	                    <div class="shim24"></div>
	                    <blockquote><xsl:value-of select="Quote"/></blockquote>
	                    <div class="shim24"></div>
	                    <a class="mu-uc" href="{Link}"><xsl:value-of select="Title"/></a>
	                    <div class="nu"><xsl:value-of select="Affiliation"/></div>
	                </li>
	            </xsl:for-each>
	        </ul>
	        <div class="shim24"></div>
	        <div class="carousel-nav"></div>
	    </div>
	
	</xsl:template>



</xsl:stylesheet>