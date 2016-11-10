<!doctype html>
<%@ Page Language="C#" inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register tagprefix="XslQuery4" namespace="hbs.internet.XslQuery4" assembly="hbs.internet.XslQuery4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=7afffba6c934d3eb" %>
<html lang="en">
<head>
<meta name="WebPartPageExpansion" content="full" />
<meta name="ProgId" content="SharePoint.WebPartPage.Document">
  <meta charset="utf-8" />
  <title>Templates</title>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <link rel="stylesheet" href="http://www.hbs.edu/shared/css/framework.css" type="text/css" media="screen" />
  <script type="text/javascript" src="http://www.hbs.edu/shared/js/framework.js"></script>
  <script type="text/javascript" src="http://www.hbs.edu/shared/js/widgets.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />  
</head>

<body>
 
<div class="js-framework color-framework component-framework pattern-framework grid-framework type-framework responsive-framework">
  <div class="container mobile-container tablet-container" style="margin-top:100px">  

     <div class="row">
        <div class="span8">
            <XslQuery4:XslQueryWebPart4 runat="server" Args="" ChromeType="None" Xsl="templates.featured-media.xsl" Title="HBS XslQuery WebPart v4" __MarkupType="vsattributemarkup" __WebPartId="{1d71e047-0f31-4f8a-baaa-88d19b1f9f4e}" WebPart="true" __designer:IsClosed="false" id="g_1d71e047_0f31_4f8a_baaa_88d19b1f9f4e"></XslQuery4:XslQueryWebPart4>
        </div>
        <div class="span4 sidebar-margins">
            <XslQuery4:XslQueryWebPart4 runat="server" Args="" ChromeType="None" Xsl="templates.sidebar-stream.xsl" Title="HBS XslQuery WebPart v4" __MarkupType="vsattributemarkup" __WebPartId="{1d71e047-0f31-4f8a-baaa-88d19b1f9f4e}" WebPart="true" __designer:IsClosed="false" id="g_1d71e047_0f31_4f8a_baaa_88d19b1f9f4f"></XslQuery4:XslQueryWebPart4>        
            <div class="hr"></div>
            <XslQuery4:XslQueryWebPart4 runat="server" Args="" ChromeType="None" Xsl="templates.sidebar-quotes.xsl" Title="HBS XslQuery WebPart v4" __MarkupType="vsattributemarkup" __WebPartId="{1d71e047-0f31-4f8a-baaa-88d19b1f9f4e}" WebPart="true" __designer:IsClosed="false" id="g_1d71e047_0f31_4f8a_baaa_88d19b1f9f40"></XslQuery4:XslQueryWebPart4>        
        </div>
     </div>

  </div>
</div>

</body>
</html>




