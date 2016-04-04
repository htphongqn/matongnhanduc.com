<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="side_left.ascx.cs" Inherits="THVDev.UIs.side_left" %>

<aside class="side side-left">
      <div class="httt">
        <h2 class="tt-side">Hỗ trợ trực tuyến</h2>
        <div class="inner">
          <asp:Repeater ID="rptSupport" runat="server">
            <ItemTemplate>                
              <p class="hl">
                <name><%# Eval("ONLINE_DESC") %></name>
                <phone><%# Eval("ONLINE_NICKNAME")%></phone>
              </p>
            </ItemTemplate>
        </asp:Repeater>
        </div>
      </div>
      <nav class="navy">
        <h2 class="tt-side">Dịch vụ</h2>
        <ul>
          <asp:Repeater ID="rptMenu" runat="server">
            <ItemTemplate>
                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>' title="<%#Eval("cat_name")%>">
                    <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>">
                        <%#Eval("cat_name")%>
                    </a>                    
                </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
      </nav>
      <figure class="ads">
        <asp:Repeater ID="rptAds" runat="server">
            <ItemTemplate>                 
                 <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%>
            </ItemTemplate>
        </asp:Repeater> 
      </figure>
    </aside>