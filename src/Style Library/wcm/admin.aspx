<%@ Page Language="C#" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" masterpagefile="~masterurl/default.master" title="Admin Tools" meta:progid="SharePoint.WebPartPage.Document" meta:webpartpageexpansion="full" %>
<%@ Register tagprefix="WebPartPages" namespace="Microsoft.SharePoint.WebPartPages" assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="SharePoint" namespace="Microsoft.SharePoint.WebControls" assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="XslQuery" namespace="hbs.internet.XslQuery2" assembly="hbs.internet.XslQuery2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=4805514512dc2d26" %>

<asp:Content id="PageTitle1" runat="Server" contentplaceholderid="PlaceHolderPageTitle">
Admin Page
</asp:Content>

<asp:Content id="Content1" runat="Server" contentplaceholderid="PlaceHolderMain">

<WebPartPages:SPProxyWebPartManager runat="server" id="spproxywebpartmanager"></WebPartPages:SPProxyWebPartManager>

<div style="margin: 2em">

<style type="text/css">
table.admin th {
   width:80px;
}
table.admin td,
table.admin th {
   vertical-align: top;
   padding-bottom: 1em;
}
</style>


<h2 style="margin-top:0;font-weight:normal;">Site Administration</h2>

<table class="admin">

<tr><th><img src="/_layouts/images/SiteSettings_HoldAndEDiscovery_48x48.png" height="48" width="48"/></th>
<td class="ms-linksection-level1">
<h3>Reports</h3>
<a href="main.aspx?view=publishjobs">Run Site Deployment Jobs</a><br/>
<a href="main.aspx?view=changelog">Changelog</a><br/>
<a href="main.aspx?view=publish">Pending Edits</a><br/>

</td></tr>

<tr><th><img src="/_layouts/images/SiteSettings_SiteAdmin_48x48.png" height="48" width="48"/></th>
<td class="ms-linksection-level1">
<h3>Documentation &amp; Help</h3>
<a href="http://intranet.hbs.edu/webworkrequest/">Web Work Requests</a><br>
</td></tr>


</table>




<WebPartPages:WebPartZone id="g_8262F72400744D1B90B8CA18E42ED713" runat="server" title="Zone 1"><ZoneTemplate>
</ZoneTemplate></WebPartPages:WebPartZone>

</div>

</asp:Content>
