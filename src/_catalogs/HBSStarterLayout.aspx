<%@ Page language="C#" Inherits="hbs.internet.AuthoringLayoutPage.AuthoringLayoutPage,hbs.internet.AuthoringLayoutPage,Version=1.0.0.0,Culture=neutral,PublicKeyToken=7cec13d6e9941f28" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="XslQuery4" namespace="hbs.internet.XslQuery4" assembly="hbs.internet.XslQuery4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7afffba6c934d3eb" %>


<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
    <!-- if you need to put something in the head -->
    <link rel="overlay" href="/Style%20Library/hbs/images/overlays/OVERLAY-IMAGE-FOR-TEMPLATE.png"/>
</asp:Content>

<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">

<div>
    <XslQuery4:XslQueryWebPart4 runat="server" XSL="~SiteCollection/Style Library/hbs/xsl/leftnav.xsl" Title="Left Nav" 
        Description="" ImportErrorMessage="" WebPart="true" id="g_29824302_d7b2_4c77_b6c6_9e42092651c2"></XslQuery4:XslQueryWebPart4>
</div>

<PublishingWebControls:RichHtmlField ID="RichHtmlField1" FieldName="PublishingPageContent" runat="server"></PublishingWebControls:RichHtmlField>

</asp:Content>


<asp:Content ContentPlaceholderID="PlaceHolderEditModeArea" runat="server">
    <PublishingWebControls:EditModePanel runat="server" id="EditModePanel1">
        <br/>
        <div class="container silver-bg" style="padding:20px">
            <SharePointWebControls:TextField FieldName="Title" InputFieldLabel="Title" runat="server" DisplaySize="80"/>
            <SharePointWebControls:NoteField FieldName="Comments" InputFieldLabel="Comments" runat="server" DisplaySize="80"/>
            <SharePointWebControls:DropDownChoiceField FieldName="HeaderColor" runat="server"/>
            
            <%--
<PublishingWebControls:RichHtmlField FieldName="Custom_x0020_Page_x0020_Content_x0020_2" InputFieldLabel="Title" runat="server"></PublishingWebControls:RichHtmlField>
<SharePointWebControls:TextField FieldName="Title" runat="server"></SharePointWebControls:TextField>
<SharePointWebControls:DateTimeField FieldName="EventStartDate" runat="server"></SharePointWebControls:DateTimeField>
<Taxonomy:TaxonomyFieldControl FieldName="EventType" runat="server"></Taxonomy:TaxonomyFieldControl>
<SharePointWebControls:UrlField FieldName="RegisterLink" runat="server"></SharePointWebControls:UrlField>
<SharePointWebControls:NoteField FieldName="WorkAddress" runat="server"></SharePointWebControls:NoteField>
<SharePointWebControls:DropDownChoiceField FieldName="HeaderColor" runat="server"/>
<SharePointWebControls:DateTimeField FieldName="Date" DisableInputFieldLabel="True" runat="server" id="DateTimeField1"/>
<SharePointWebControls:UserField FieldName="Contact" runat="server" id="UserField1"></SharePointWebControls:UserField>


            --%>
            
            </div>
    </PublishingWebControls:EditModePanel>
</asp:Content>


