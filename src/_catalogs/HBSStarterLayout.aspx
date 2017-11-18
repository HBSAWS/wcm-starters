<%@ Page language="C#" Inherits="hbs.internet.AuthoringLayoutPage.AuthoringLayoutPage,hbs.internet.AuthoringLayoutPage,Version=1.0.0.0,Culture=neutral,PublicKeyToken=7cec13d6e9941f28" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="XslQuery4" namespace="hbs.internet.XslQuery4" assembly="hbs.internet.XslQuery4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7afffba6c934d3eb" %>
<asp:Content ContentPlaceholderID="PlaceHolderMain" runat="server">
<XslQuery4:XslQueryWebPart4 runat="server" Args="" ChromeType="None" Xsl="/Style%20Library/hbs/managing/xsl/page-content.xsl" Title="HBS XslQuery WebPart v4" __MarkupType="vsattributemarkup" __WebPartId="{af8bf4ac-549b-47a3-93ba-00a94cd42ab2}" WebPart="true" __designer:IsClosed="false" id="g_af8bf4ac_549b_47a3_93ba_00a94cd42ab2"></XslQuery4:XslQueryWebPart4>

    <PublishingWebControls:EditModePanel runat="server">
        <style>
        .page-header-xml {width:100%;height:100px;}
        .page-content-xml {width:100%;height:300px;}
        </style>
        <div class="container" style="padding:20px;">
			<SharePointWebControls:NoteField FieldName="PageHeaderXml" runat="server" CssClass="page-header-xml">
			</SharePointWebControls:NoteField>
			<SharePointWebControls:NoteField FieldName="PageContentXml" runat="server" CssClass="page-content-xml">
			</SharePointWebControls:NoteField>
			<SharePointWebControls:NoteField FieldName="PageSidebarXml" runat="server" CssClass="page-content-xml">
			</SharePointWebControls:NoteField>
                        <SharePointWebControls:TextField FieldName="Title" runat="server" DisplaySize="80"/>
			<SharePointWebControls:DropDownChoiceField FieldName="PrimaryColor" runat="server" />
		</div>
    </PublishingWebControls:EditModePanel>


</asp:Content>
