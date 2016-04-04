<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="THVDev.UIs.header" %>
<header class="header" role="banner">
  <div class="container"> 
    <asp:Repeater ID="rptLogo" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
  </div>
</header>