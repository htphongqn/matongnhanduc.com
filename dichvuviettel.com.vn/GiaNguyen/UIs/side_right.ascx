<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="side_right.ascx.cs" Inherits="THVDev.UIs.side_right" %>
<aside class="side side-right">      
    <asp:Repeater ID="rptMenu" runat="server">
        <ItemTemplate>
          <nav class="navy-2">
            <h2 class="tt-side"><%#Eval("cat_name")%></h2>
              <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                    <HeaderTemplate><ul></HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>">                               
                            <%#Eval("cat_name")%>
                            </a>                        
                        </li>
                    </ItemTemplate>
                    <FooterTemplate></ul></FooterTemplate>
                </asp:Repeater>
          </nav>
        </ItemTemplate>
    </asp:Repeater>
      <div class="iblock linkweb">
      <h2 class="tt-side">Liên kết website</h2>
      <p>
      <asp:DropDownList ID="ddlWeblink" runat="server" CssClass="slt" 
              AppendDataBoundItems="true" DataTextField="WEBSITE_LINKS_NAME" 
              DataValueField="WEBSITE_LINKS_URL"  onchange="changeweb(this);">
        <asp:ListItem Value="0" Text="---- Liên kết ----"></asp:ListItem>
      </asp:DropDownList> 
      <script>
          function changeweb(e) {
              if (e.value != 0) {
                  window.open(e.value, "_blank");
              }
          }
      </script>   
      </p>
      </div>
      <div class="fb-page" data-href="https://www.facebook.com/dichvuviettel2013" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="false"><div class="fb-xfbml-parse-ignore"><blockquote cite="https://www.facebook.com/dichvuviettel2013"><a href="https://www.facebook.com/dichvuviettel2013">dichvuviettel.com.vn</a></blockquote></div></div>
      <figure class="ads">
        <asp:Repeater ID="rptAds" runat="server">
            <ItemTemplate>                 
                 <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%>
            </ItemTemplate>
        </asp:Repeater> 
      </figure>
    </aside>