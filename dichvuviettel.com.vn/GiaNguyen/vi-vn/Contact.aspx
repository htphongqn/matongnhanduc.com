<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="THVDev.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
    <link href="Styles/styles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    <section class="main-content">
      <p class="tt-main"><span>Liên hệ</span></p>
      <div class="iblock contact">
        <p style="margin-bottom:10px; ">Chúng tôi rất vui lòng nhận được sự quan tâm của quý khách!<br />
          Vui lòng điền đầy đủ thông tin vào form dưới đây chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất.</p>
        <div class="form-ct">
          <input type="text" class="inputbox" id="Txtname" placeholder="Họ tên" runat="server">
          <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên!"
                                    ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          <input type="text" id="txtPhone" runat="server"  placeholder="Điện thoại"/>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                                    ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          <input type="text" class="inputbox" id="txtEmail" runat="server" placeholder="Email">
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
            ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          <input type="text" class="inputbox" id="Txtaddress" runat="server" placeholder="Địa chỉ">          
          <input type="text" class="inputbox" id="txttitle" runat="server" placeholder="Tiêu đề">
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập tiêu đề!"
                                    ControlToValidate="txttitle" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          <textarea id="txtContent" runat="server" class="inputbox" placeholder="Vui lòng nhập nội dung liên hệ"></textarea>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung!"
                                    ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          <p class="send">
            <input type="text" class="captcha" id="txtCapcha" placeholder="Nhập mã an toàn" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ!"
                            ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <script type="text/javascript"  language="Javascript">
                function Catpc() {
                    var img = document.getElementById("icp");
                    img.src = "/vi-vn/captchr.ashx?query=" + Math.random();
                }
            </script>                    
            <img id="icp" src='/vi-vn/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" />
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/vi-vn/images/reloadpaf.png" /></a>
            <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn-send">Gửi tin</asp:LinkButton>
        </p>
        </div>
        <address class="address-ct">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </address>
        <map class="map">
          <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        </map>
      </div>
    </section>
    <div style="text-align: center">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G40" />                 
        <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
