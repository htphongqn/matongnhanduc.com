﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNewsInfo.ascx.cs"
    Inherits="matongnhanduc.com.ucControls.ucNewsInfo" %>
<table width="100%" border="0">
    <tr>
        <td height="18" align="left" style="border-bottom: #e3e3e3 1px  solid;" class="general"
            colspan="2">
            Thông tin sản phẩm - tin tức
        </td>
    </tr>
    <tr>
        <td height="2" align="left" colspan="2">
        </td>
    </tr>
    <tr>
        <th class="left" valign="top" width="1%" nowrap style="text-align:left">
            Tiêu đề
        </th>
        <td width="90%">
            <asp:Label runat="server" ID="lblname"></asp:Label>
        </td>
    </tr>
    <tr>
        <th class="left" valign="top" width="1%" nowrap style="text-align:left">
            Ngày đăng tin
        </th>
        <td width="90%">
            <asp:Label runat="server" ID="lblPublishDate"></asp:Label>
        </td>
    </tr>
     <tr>
        <td height="2" align="left" colspan="2">
        </td>
    </tr>
</table>
