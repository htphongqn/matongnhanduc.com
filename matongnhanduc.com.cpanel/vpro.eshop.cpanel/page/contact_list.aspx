﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="contact_list.aspx.cs" Inherits="matongnhanduc.com.page.contact_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Thông tin liên hệ | yeuthietkeweb</title>
    <script language="javascript">
                <!--
        function ToggleAll(e, action, chkName) {
            if (e.checked) {
                CheckAll(chkName);
            }
            else {
                ClearAll(chkName);
            }
        }

        function CheckAll(chkName) {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf(chkName) > 0)
                    e.checked = true;
            }
            //ml.MainContent_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll(chkName) {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf(chkName) > 0)
                    e.checked = false;
            }
            //ml.MainContent_GridItemList_toggleSelect.checked = false;
        }
                    
                // -->
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="icon_function_parent">
<%--        <div class="icon_function_Child">
            <asp:LinkButton ID="lbtHelp" runat="server"> <img src="../Images/ICON_Help.jpg" width="30" height="30" style="border: 0px" /><div>
                    Trợ giúp</div></asp:LinkButton>
        </div>--%>
        <div class="icon_function_Child" id="dvDelete" runat="server">
            <asp:LinkButton ID="lbtDelete" runat="server" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                CausesValidation="false" OnClick="lbtDelete_Click"> <img src="../Images/ICON_DELETE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Xóa</div></asp:LinkButton>
        </div>
        <div class="icon_function_Child">
            <a href="#" onclick="javascript:document.location.reload(true);">
                <img src="../Images/ICON_UPDATE.jpg" width="30" height="30" style="border: 0px" /><div>
                    Cập nhật</div>
            </a>
        </div>
    </div>
    <!--icon_function_parent-->
    <div id="field">
        <table width="100%" border="0">
            <tr>
                <td height="5" colspan="3" align="left">
                </td>
            </tr>
            <tr>
                <th width="50" class="left">
                    Filter
                </th>
                <td width="300px;">
                    <input name="txtKeyword" type="text" id="txtKeyword" style="width: 300px" runat="server" />
                </td>
                <td>
                    <div id="click">
                        <asp:LinkButton ID="lbtSearch" runat="server" OnClick="lbtSearch_Click">Tìm kiếm </asp:LinkButton>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="height: 10px;" colspan="3">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DataGrid ID="GridItemList" CellPadding="0" runat="server" AutoGenerateColumns="False"
                        Width="100%" DataKeyField="CONTACT_ID" CssClass="tdGridTable" SelectedIndex="0"
                        PagerStyle-Mode="NumericPages" PagerStyle-HorizontalAlign="Right" AllowPaging="false"
                        PageSize="15" PagerStyle-CssClass="PageClass" AllowSorting="true" OnItemCommand="GridItemList_ItemCommand"
                        OnItemDataBound="GridItemList_ItemDataBound" OnPageIndexChanged="GridItemList_PageIndexChanged"
                        OnSortCommand="GridItemList_SortCommand" GridLines="None">
                        <AlternatingItemStyle BackColor="#f3f3f3" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="#" HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow"
                                HeaderStyle-Wrap="False">
                                <HeaderStyle Width="1%"></HeaderStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblSTT" runat="server" EnableViewState="False" Text='<%# getOrder() %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderStyle-Width="1%" ItemStyle-Wrap="False" HeaderStyle-CssClass="tdGridHeader"
                                ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False">
                                <HeaderTemplate>
                                    <input type="checkbox" id="toggleSelect" runat="server" onclick="javascript: ToggleAll(this,0,'chkSelect');"
                                        style="border-top-style: none; border-right-style: none; border-left-style: none;
                                        border-bottom-style: none" name="toggleSign">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input id="chkSelect" type="checkbox" name="chkSelect" runat="server" style="border-top-style: none;
                                        border-right-style: none; border-left-style: none; border-bottom-style: none">
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Tên" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_NAME">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "CONTACT_ID")) %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "CONTACT_NAME")%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Tiêu đề" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_TITLE">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONTACT_TITLE")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Địa chỉ" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_ADDRESS">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONTACT_ADDRESS")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Email" HeaderStyle-Width="1%" ItemStyle-Wrap="False"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_EMAIL">
                                <ItemTemplate>
                                    <a href='<%# getLink(DataBinder.Eval(Container.DataItem, "CONTACT_ID")) %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "CONTACT_EMAIL")%>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Phone" HeaderStyle-Width="1%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_PHONE">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONTACT_PHONE")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Nội dung" HeaderStyle-Width="94%" ItemStyle-Wrap="true"
                                HeaderStyle-CssClass="tdGridHeader" ItemStyle-CssClass="tdGridRow" HeaderStyle-Wrap="False"
                                SortExpression="CONTACT_CONTENT">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "CONTACT_CONTENT")%>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="94%" HorizontalAlign="Left">
                                </HeaderStyle>
                                <ItemStyle Wrap="true" CssClass="tdGridRow" HorizontalAlign="Left"></ItemStyle>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Xóa">
                                <HeaderStyle Wrap="False" CssClass="tdGridHeader" Width="1%"></HeaderStyle>
                                <ItemStyle Wrap="False" CssClass="tdGridRow" HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkbtnDel" runat="server" CommandName="Delete">
                                <img src="../images/delete_icon.gif" title="Xóa" border="0">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                        <PagerStyle Mode="NumericPages" HorizontalAlign="Right"></PagerStyle>
                    </asp:DataGrid>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
