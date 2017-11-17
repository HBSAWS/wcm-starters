
<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

    <xsl:import href="https://secure.hbs.edu/static/shared/templates/headers/universal.xsl"/>

    <xsl:param name="args"/>
    <xsl:output omit-xml-declaration="yes" method="html"/>
    
    <xsl:template match="/Root">
        <Render>
        
            <xsl:variable name="site" select="'/managing-the-future-of-work'"/>
            <xsl:value-of select="hbs:SetVar('templates','http://webdev.hbs.edu/shared/templates')"/>
            <xsl:value-of select="hbs:SetVar('xtemplates','https://secure.hbs.edu/static/shared/templates')"/>            
            <xsl:value-of select="hbs:SetVar('breadcrumb.root','/managing-the-future-of-work')"/>
            <xsl:value-of select="hbs:SetVar('analytics.profile','managing-the-future-of-work')"/>
            <xsl:value-of select="hbs:SetVar('site.search','/Pages/search.aspx')"/>
            
            <xsl:choose>
                <xsl:when test="$args = 'header'">
                    <SiteHeader>
                        <Title Href="{$site}/">Managing the Future of Work</Title>
                        <Toolbar>
                            <Link Href="{$site}/Pages/partners.aspx">Partners</Link>
                        </Toolbar>
                        <Nav>
                            <Link Href="{$site}/Pages/about-the-project.aspx">About the Project</Link>
                            <Link Href="{$site}/Pages/research.aspx">Research</Link>
                            <Link Href="{$site}/Pages/faculty.aspx">Faculty</Link>
                            <Link Href="{$site}/Pages/media-coverage.aspx">Media Coverage</Link>
                        </Nav>
                    </SiteHeader>               
                </xsl:when>
                <xsl:when test="$args = 'footer'">
                    <UniversalFooter>
                        <Address>
                            U.S. Competitiveness Project<br/>
                            Manjari Raman<br/>
                            Program Director &amp; Senior Researcher<br/>
                            Harvard Business School<br/>
                            Connell House <br/>
                            Boston, MA 02163<br/>
                            Phone:  <strong>1.617.495.6288</strong><br/>
                            Email: <strong><a class="to email inherit-color" href="#" id="footer-email">mraman+hbs.edu</a></strong>
                        </Address>
                    </UniversalFooter>
                </xsl:when>
                <xsl:when test="$args = 'head'">
                    <UniversalHead/>
                </xsl:when>
                <xsl:when test="$args = 'supernav'">
                   <UniversalHeader/>
                </xsl:when>
                <xsl:when test="$args = 'js'">
                   <UniversalJs/>
                </xsl:when>
            </xsl:choose>
            
            <hbs:Repeat/>
        </Render>
    </xsl:template>
    
    <xsl:template match="/Render">
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>
