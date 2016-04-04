<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteVI.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="THVDev.vi_vn.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="container">
  <div class="box">
    <div class="headingBox text-left hdb2"><span>ĐĂNG KÝ THÀNH VIÊN</span> </div>
      <!--Form Register-->
      <div class="regis_form form_web">
        <div><asp:Label ID="Labelerrors" runat="server" Text="" ForeColor="Red"></asp:Label></div>
        <!--Info Account-->
        <div class="info_account fl">
          <div class="form_header">Thông tin tài khoản</div>
          <div class="row_account">
            <label class="item_title" for="formEmail">Email:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <asp:TextBox CssClass="txtpassdangnhap"  id="formEmail" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Email"
                    ControlToValidate="formEmail" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="formEmail"
                ErrorMessage="Email Định Dạng Chưa Đúng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G401" Display="None">*</asp:RegularExpressionValidator>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formPassword">Mật khẩu<span class="required">*</span></label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" type="password" name="formPassword" id="formPassword" runat="server"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mật khẩu"
                    ControlToValidate="formPassword" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formPassword_2">Xác nhận mật khẩu<span class="required">*</span></label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" type="password" name="formPassword_2" id="formPassword_2" runat="server"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu"
                    ControlToValidate="formPassword_2" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="formPassword" ControlToValidate="formPassword_2" ValidationGroup="G401"
                    ErrorMessage="Xác nhận mật khẩu chưa đúng" ForeColor="Red" Display="None">*</asp:CompareValidator>
            </div>
          </div>          
        </div>
        <!--Info Member-->
        <div class="info_account fr">
          <div class="form_header font3">Thông tin thành viên</div>
          <div class="row_account">
            <label class="item_title" for="formFullname">Họ tên:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" type="text" name="formFullname" id="formFullname" runat="server"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập họ tên"
                    ControlToValidate="formFullname" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formSex">Giới tính:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <asp:RadioButtonList ID="rdbSex" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Text="Nam" Selected="True"></asp:ListItem>
                <asp:ListItem Value="0" Text="Nữ"></asp:ListItem>
              </asp:RadioButtonList>  
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formDateBirth">Ngày sinh:<span class="required">*</span></label>
            <div class="right_row_account fr">
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="sl_form_web accountBirthDay"></asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="sl_form_web accountBirthDay">
                    <asp:ListItem Value="0" Selected="True">Tháng</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>  
                </asp:DropDownList>
                 <asp:DropDownList ID="ddlDay" runat="server" CssClass="sl_form_web accountBirthDay">
                    <asp:ListItem Value="0" Selected="True">Ngày</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="3">3</asp:ListItem>
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                    <asp:ListItem Value="7">7</asp:ListItem>
                    <asp:ListItem Value="8">8</asp:ListItem>
                    <asp:ListItem Value="9">9</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="11">11</asp:ListItem>
                    <asp:ListItem Value="12">12</asp:ListItem>
                    <asp:ListItem Value="13">13</asp:ListItem>
                    <asp:ListItem Value="14">14</asp:ListItem>
                    <asp:ListItem Value="15">15</asp:ListItem>
                    <asp:ListItem Value="16">16</asp:ListItem>                    
                    <asp:ListItem Value="17">17</asp:ListItem>
                    <asp:ListItem Value="18">18</asp:ListItem>
                    <asp:ListItem Value="19">19</asp:ListItem>
                    <asp:ListItem Value="20">20</asp:ListItem>
                    <asp:ListItem Value="21">21</asp:ListItem>
                    <asp:ListItem Value="22">22</asp:ListItem> 
                    <asp:ListItem Value="23">23</asp:ListItem>
                    <asp:ListItem Value="24">24</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                    <asp:ListItem Value="26">26</asp:ListItem>
                    <asp:ListItem Value="27">27</asp:ListItem>
                    <asp:ListItem Value="28">28</asp:ListItem>
                    <asp:ListItem Value="29">29</asp:ListItem>
                    <asp:ListItem Value="30">30</asp:ListItem>
                    <asp:ListItem Value="31">31</asp:ListItem>
                </asp:DropDownList>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn ngày sinh"
                    ControlToValidate="ddlDay" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa chọn tháng sinh"
                    ControlToValidate="ddlMonth" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Chưa chọn năm sinh"
                    ControlToValidate="ddlYear" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                                    
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formAddress">Địa chỉ liên hệ:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" placeholder="Vui lòng nhập địa chỉ" type="text" name="formAddress" id="formAddress" runat="server"/>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Chưa nhập địa chỉ liên hệ"
                    ControlToValidate="formAddress" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formCountry">Tỉnh/Thành phố:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <asp:DropDownList ID="ddlCity" runat="server" CssClass="sl_form_web" AppendDataBoundItems="true" DataTextField="PROP_NAME" DataValueField="PROP_ID">
                <asp:ListItem Value="0" Text="--Chọn Tỉnh/Thành phố--"></asp:ListItem>
              </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Chưa chọn Tỉnh/Thành phố"
                    ControlToValidate="ddlCity" Display="None" ForeColor="Red" InitialValue="0" ValidationGroup="G401">*</asp:RequiredFieldValidator>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formPhone">Điện thoại</label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" type="text" name="formPhone" id="formPhone" runat="server"/>
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formAvatar">Ảnh đại diện:</label>
            <div class="right_row_account fr">
              <input name="file_images" type="file" class="txtpassdangnhap" style="border: none" />
            </div>
          </div>
          <div class="row_account">
            <label class="item_title" for="formCode">Nhập mã chuỗi:<span class="required">*</span></label>
            <div class="right_row_account fr">
              <input class="txtpassdangnhap" type="text" name="formCode" id="formCode" style="width: 40%; margin-right: 10px" runat="server"/>
              <asp:Image ID="Image1" runat="server" ImageUrl="/vi-vn/CImage.aspx" Width="170px" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Chưa nhập mã chuổi"
                    ControlToValidate="formCode" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
              </div>
          </div>
          <div class="row_account"> 
            <asp:CheckBox ID="chkAcept" runat="server" Text="Tôi đã đọc và chấp nhận điều khoản sử dụng" Checked="true" />            
          </div>
          <div class="row_account" style="margin-top: 20px"> 
          <asp:LinkButton ID="btnDangky" runat="server" CssClass=" btn btn-primary" 
                  Text="Đăng ký" ValidationGroup="G401" onclick="btnDangky_Click"></asp:LinkButton>
          <a style=" margin-left:20px"class="btn btn-primary"" onclick="window.history.go(-1); return false;">Bỏ qua</a> 
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G401" />          
          </div>
          <!--end Info Member--> 
        </div>
      </div>
      <!--End Form Register--> 
     
     
  </div>
</div>
</asp:Content>
