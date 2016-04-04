<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="config_footer.aspx.cs" Inherits="yeuthietkeweb.cpanel.page.config_footer"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Cấu hình Footer - Sản phẩm | yeuthietkeweb</title>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../tinymce/js/tinymce/tinymce.min.js"></script>
    <script src="../Scripts/TinymiceEditor.js" type="text/javascript"></script>
    <div id="icon_function_parent">
        <%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server">
                <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div>
            </asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click"><img src="../Images/ICON_SAVE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Lưu</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="config_footer.aspx">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="auto" border="0">
            <tr>
                <td>
                    <textarea id="mrk" cols="20" rows="10" class="mrk" style="height: 500px;" runat="server"></textarea>
                </td>
            </tr>
        </table>
    </div>
    <div id="field" style="display:none">
        Ngân hàng
        <table width="auto" border="0">
            <tr>
                <td>
                    <textarea id="mrk1" cols="20" rows="10" class="mrk" style="height: 500px;" runat="server"></textarea>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
