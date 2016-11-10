<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
    xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="hbs z msxsl">

    <xsl:output method="html" omit-xml-declaration="yes"/>
    <xsl:template match="/Root">
        <Render>
            <SidebarStream>
                <Title>Upcoming Events</Title>
                <Media>
                    <EditUrl>/healthcare/Lists/Events/EditForm.aspx?ID=462</EditUrl> 
                    <DisplayDate>10 Nov 2016</DisplayDate>
                    <Title>17th Annual HBSHAA Conference</Title>
                    <Link>http://www.hbshealthalumni.org/s/1738/cc/index2.aspx</Link>
                </Media>
                <Media>
                    <EditUrl>/healthcare/Lists/Events/EditForm.aspx?ID=461</EditUrl> 
                    <DisplayDate>15 Nov 2016</DisplayDate>
                    <Title>Why digital startups fail or succeed</Title>
                    <Link>http://www.hbs.edu/about/video.aspx?v=1_izq5h7ne</Link>
                </Media>
                <More Href="/healthcare/Pages/events.aspx?audience=Alumni">More Events</More>
            </SidebarStream>
            <hbs:Repeat/>
        </Render>
    </xsl:template>

    <xsl:template match="/Render">
        <xsl:apply-templates mode="render"/>
    </xsl:template>


	<!-- 
	
	Templates 
	
	-->


	<xsl:template match="SidebarStream" mode="render">
	    <div class="sidebar-margins">
		    <h3 class="kappa-uc"><xsl:value-of select="Title"/></h3>
		    <div class="media-list3">
		        <xsl:for-each select="Media">
		            <div class="row-left event-item media" data-wcm-edit-url="{EditUrl}">
		                <div class="span1">
		                    <div class="event-thumbnail">
		                       <xsl:value-of select="substring-before(substring-after(DisplayDate,' '),' ')"/>
		                       <span><xsl:value-of select="substring-before(DisplayDate,' ')"/></span>
		                    </div>
		                </div>
		                <div class="span99">
		                    <div class="mu-uc"><xsl:value-of select="DisplayDate"/></div>
		                    <div class="kappa"><a href="{Link}"><xsl:value-of select="Title"/></a></div>
		                </div>
		            </div>
		        </xsl:for-each>
		    </div>
		
			<xsl:for-each select="More">
			    <p class="more"><span class="txt-arrow">&#x2192;</span><a href="{@Href}"><xsl:copy-of select="node()"/></a></p>
			</xsl:for-each>
		</div>
	
	</xsl:template>



</xsl:stylesheet>