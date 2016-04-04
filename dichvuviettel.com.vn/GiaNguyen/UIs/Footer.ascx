<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="THVDev.UIs.Footer" %>
<footer class="footer" role="contentinfo">
  <div class="container">
    <address class="address">
    <asp:Literal ID="Literal_Info" runat="server"></asp:Literal>
    </address>
    <div class="f-right">
      <div class="social">
        <p class="tt-f">Kết nối với chúng tôi</p>
        <asp:Repeater ID="rptSocialNetwork" runat="server">
            <ItemTemplate>
                <%# Bind_SocialNetwork(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
            </ItemTemplate>
        </asp:Repeater>
      </div>
    </div>
    <div class="f-right">
      <p class="tt-f">Thống kê truy cập</p>
      <p class="stt-visit">Đang truy cập: <b><asp:Literal ID="lbOnline" runat="server"></asp:Literal></b></p>
      <p class="stt-visit">Tổng truy cập: <b><asp:Literal ID="lbTotal" runat="server"></asp:Literal></b></p>
    </div>
  </div>
</footer>