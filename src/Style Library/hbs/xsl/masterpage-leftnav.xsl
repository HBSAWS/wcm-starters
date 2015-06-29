<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE stylesheet [
<!ENTITY nbsp "<xsl:text disable-output-escaping='yes'>&amp;nbsp;</xsl:text>">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">

	<xsl:template match="/Root">
		<Render> 
			<hbs:xDebug/>
			<Request>
			   <xsl:copy-of select="hbs:Request/PATH_INFO"/>
			</Request>
			<hbs:GetPage/>
			<Navigation>
			    <xsl:choose>
			    <xsl:when test="contains(hbs:Request/URL,'default.aspx')">
				<hbs:GetNavigation>
					<ChildNodes Depth="1"/>
				</hbs:GetNavigation>
			    </xsl:when>
			    <xsl:otherwise>
				<hbs:GetNavigation>
					<ParentNode>
                       <ChildNodes Depth="1"/>
					</ParentNode>
				</hbs:GetNavigation>
			    </xsl:otherwise>
			    </xsl:choose>
			</Navigation>
			<hbs:Repeat/>
		</Render>
	</xsl:template>
	
	<xsl:template match="/Render">
	    <div>
			<ul>
				<xsl:apply-templates select="Navigation/hbs:Navigation/Node/Node" mode="render-tab"/>
			</ul>
        </div>
	</xsl:template>
	<xsl:template match="Node" mode="render-tab">
		<li>
		    <xsl:attribute name="class">
		       <xsl:if test="@Current">selected</xsl:if>
		    </xsl:attribute>
			<a>
				<xsl:attribute name="href"><xsl:value-of select="Url"/></xsl:attribute>
				<xsl:value-of select="Title"/>
			</a>
		</li>
	</xsl:template>
</xsl:stylesheet> 