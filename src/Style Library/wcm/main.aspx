<%@ Page Language="C#" masterpagefile="~masterurl/default.master" title="Untitled 1" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="XslQuery4" namespace="hbs.internet.XslQuery4" assembly="hbs.internet.XslQuery4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7afffba6c934d3eb" %>

<asp:Content id="Content1" runat="Server" contentplaceholderid="PlaceHolderMain">

<div style="margin: 2em">
		
		<XslQuery4:XslQueryWebPart4 runat="server" CompileOn="Checkout" XSL="~SiteCollection/Style Library/wcm/xsl/main.xsl" 
		Title="WCM Authoring Extensions" 
		Description="Uses an XSL file with steps that query for data and display the results" 
		ImportErrorMessage="Could not be imported" __MarkupType="vsattributemarkup" 
		__WebPartId="{29824302-d7b2-4c77-b6c5-9e42092651c1}" WebPart="true" __designer:IsClosed="false" 
		id="g_29824302_d7b2_4c77_b7c5_9f42192751c3"></XslQuery4:XslQueryWebPart4>

</div>

</asp:Content>
