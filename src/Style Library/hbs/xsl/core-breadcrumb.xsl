<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:hbs="urn:hbs"
   xmlns:z="#RowsetSchema" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
   exclude-result-prefixes="hbs z msxsl">
	<xsl:output method="html" omit-xml-declaration="yes"/>
	<xsl:param name="args"/>
	<xsl:template match="/Root">
	  <Render>
        <xsl:if test="hbs:Request/debug = 'breadcrumb'"><hbs:Debug/></xsl:if>
	    <hbs:GetPage/>
			<xsl:copy-of select="hbs:Request"/>
			
			<GrandParentNavigation>
				<xsl:choose>
					<xsl:when test="contains(hbs:Request/URL,'default.aspx')">
						<hbs:GetNavigation>
							<ParentNode>
								<ParentNode>
									<ChildNodes Depth="1"/>
								</ParentNode>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:when>
					<xsl:otherwise>
						<hbs:GetNavigation>
							<ParentNode>
								<ParentNode>
									<ParentNode>
										<ChildNodes Depth="1"/>
									</ParentNode>
								</ParentNode>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:otherwise>
				</xsl:choose>
			</GrandParentNavigation>
			<ParentNavigation>
				<xsl:choose>
					<xsl:when test="contains(hbs:Request/URL,'default.aspx')">
						<hbs:GetNavigation>
							<ParentNode>
								<ChildNodes Depth="2"/>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:when>
					<xsl:otherwise>
						<hbs:GetNavigation>
							<ParentNode>
								<ParentNode>
									<ChildNodes Depth="2"/>
								</ParentNode>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:otherwise>
				</xsl:choose>
			</ParentNavigation>
			<Navigation>
				<xsl:choose>
					<xsl:when test="contains(hbs:Request/URL,'default.aspx')">
						<xsl:attribute name="Default">1</xsl:attribute>
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

			
			<!--
			<ParentNavigation>
				<xsl:choose>
					<xsl:when test="contains(hbs:Request/URL,'default.aspx')">
						<hbs:GetNavigation Provider="CurrentNavSiteMapProviderNoEncode">
							<ParentNode>
								<ChildNodes Depth="1"/>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:when>
					<xsl:otherwise>
						<hbs:GetNavigation>
							<ParentNode Provider="CurrentNavSiteMapProviderNoEncode">
								<ParentNode>
									<ChildNodes Depth="1"/>
								</ParentNode>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:otherwise>
				</xsl:choose>
			</ParentNavigation>
			<Navigation>
				<xsl:choose>
					<xsl:when test="contains(hbs:Request/URL,'default.aspx')">
						<xsl:attribute name="Default">1</xsl:attribute>
						<hbs:GetNavigation>
							<ChildNodes Depth="2"/>
						</hbs:GetNavigation>
					</xsl:when>
					<xsl:otherwise>
						<hbs:GetNavigation>
							<ParentNode>
								<ChildNodes Depth="2"/>
							</ParentNode>
						</hbs:GetNavigation>
					</xsl:otherwise>
				</xsl:choose>
			</Navigation>
			
			-->
            <hbs:Repeat/>
	  </Render>
	</xsl:template>
	<xsl:template match="/Render">
	
        <xsl:variable name="grandNode" select="GrandParentNavigation/hbs:Navigation/Node"/>
        <xsl:variable name="parentNode" select="ParentNavigation/hbs:Navigation/Node"/>
        <xsl:variable name="thisNode" select="Navigation/hbs:Navigation/Node"/>
        <xsl:variable name="pageName" select="hbs:Page/z:row/@ows_Title"/>

       
        <ul class="nu responsive-breadcrumb toggle-container">
					<li class="responsive-breadcrumb-toggle"><a href="#" class="toggle-button">&#x2026;</a>
			 	  	<span class="txt-arrow">&#x2192;</span>
					</li>
			
					<li>
	          <a href="http://www.hbs.edu/" class="ink">Harvard Business School</a>
	          <span class="txt-arrow">&#x2192;</span>
	        </li>
	    
			    <li>
	          <a href="/competitiveness/" class="ink">U.S. Competitiveness</a>
	          <span class="txt-arrow">?</span>
	        </li>

					<xsl:call-template name="render-dropdown">
						<xsl:with-param name="node" select="$grandNode"/>
						<xsl:with-param name="nomatch" select="'U.S. Competitiveness'"/>
						 <xsl:with-param name="hasarrow" select="true()"/>
					</xsl:call-template>

					<xsl:call-template name="render-dropdown">
						<xsl:with-param name="node" select="$parentNode"/>
						<xsl:with-param name="nomatch" select="'U.S. Competitiveness'"/>
						 <xsl:with-param name="hasarrow" select="true()"/>
					</xsl:call-template>
			
					<xsl:call-template name="render-dropdown">
						<xsl:with-param name="node" select="$thisNode"/>
						<xsl:with-param name="nomatch" select="'U.S. Competitiveness'"/>
					</xsl:call-template>
     	
				<xsl:if test="not(Navigation[@Default]) and $pageName != 'custom'">
     				<li><xsl:value-of select="$pageName"/></li>
				</xsl:if>
      </ul>
          
    </xsl:template>

	<xsl:template name="render-dropdown">
    <xsl:param name="node"/>
    <xsl:param name="nomatch"/>
        
    <xsl:choose>
      <xsl:when test="$node/Node and $node/Title != $nomatch">
      	<li>
					<div class="dropdown-container">
					  
					  <a class="ink nu dropdown-toggle" href="{$node/Url}">
					    <xsl:value-of select="$node/Title"/>
					  	<span class="icon-select"></span>
					  </a>
				    
				    <ul class="dropdown-menu nu">
				    	<li>
				        <a href="{$node/Url}" class="white">
				      <xsl:if test="$node[@CurrentNode]">
				      	<xsl:attribute name="class">active inherit-color</xsl:attribute>
				      </xsl:if>
				          	  <xsl:value-of select="$node/Title"/></a>
				          </li>
				          <li class="divider inherit-bg"></li>
				          <xsl:for-each select="$node/Node">
				             <li>
				             <a href="{Url}" class="white">
				             <xsl:if test="@CurrentNode or Node[@CurrentNode]"><xsl:attribute name="class">active inherit-color</xsl:attribute></xsl:if>
				             <xsl:value-of select="Title"/></a>
				             </li>
				          </xsl:for-each>
					   </ul>
					</div> 
	                <span class="txt-arrow">&#x2192;</span>
                </li>
           </xsl:when>
           <xsl:when test="$node/Title != $nomatch">
           		<li>
				   <a class="ink nu" href="{$node/Url}">
				      <xsl:value-of select="$node/Title"/>
				   </a>
	               <span class="txt-arrow">&#x2192;</span>
               </li>
           </xsl:when>
        </xsl:choose>
    </xsl:template>



</xsl:stylesheet>