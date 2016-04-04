<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top_menu.ascx.cs" Inherits="THVDev.UIs.top_menu" %>
<script type="text/javascript">
    function clickButton(e, buttonid) {
        var evt = e ? e : window.event;
        var bt = document.getElementById(buttonid);

        if (bt) {
            if (evt.keyCode == 13) {
                bt.click();
                return false;
            }
        }
    }  
</script>
<nav class="menu" role="navigation">
  <div class="container">
    <div class="navx"> <a href="#" id="pull" class="clearfix"><i class="openIco fa fa-align-justify"></i> <i class="closeIco fa fa-remove"></i></a>
      <ul>
        <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                    <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>">
                        <%#Eval("cat_name")%>
                    </a>
                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>">                               
                            <%#Eval("cat_name")%>
                            </a>
                            <asp:Repeater ID="Repeater2" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                <HeaderTemplate>
                                    <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>">
                                        <%#Eval("cat_name")%>
                                        </a>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
            </ItemTemplate>
        </asp:Repeater>
      </ul>
	  
	  <div class="search">
          <div class="trigger"><i class="fa fa-search"></i></div>
          <div class="popupSearch"  >
            <input id="txtSearch" runat="server" type="text" alt="Tìm kiếm" class="txt-search " placeholder="Từ khóa tìm kiếm…" />
            <asp:LinkButton ID="Lbsearch" runat="server" CssClass="btn-search" OnClick="Lbsearch_Click" Text="TÌM"></asp:LinkButton><a class="btn-close"><i class="fa fa-close"></i></a> </div>
        </div>
    </div>
  </div>
</nav>