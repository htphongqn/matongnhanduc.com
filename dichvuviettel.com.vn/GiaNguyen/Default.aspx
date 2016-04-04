<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="THVDev.Default" %>
<%@ Register src="UIs/main.ascx" tagname="main" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    <h1 class="name_web">Lắp mạng viettel Phú Nhuận</h1>
    <uc1:main ID="main1" runat="server" />
</asp:Content>
