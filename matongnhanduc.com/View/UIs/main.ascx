<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="main.ascx.cs" Inherits="matongnhanduc.UIs.main" %>

<section class="main-content">
      <article class="iblock detail-news">        
        <asp:Repeater ID="rptKhuyenmai" runat="server">
            <ItemTemplate>
                <h1 class="tt-detail-news"><%# Eval("NEWS_TITLE") %></h1>
                <p><%# Show_File_HTML(Eval("NEWS_SEO_URL"))%></p>   
                <%--<p><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>">[xem chi tiết]</a></p>--%>                
            </ItemTemplate>
        </asp:Repeater>
      </article>
      <p class="tt-main"><span>Sản phẩm nổi bật</span></p>
      <div class="iblock list-media">          
        <asp:Repeater ID="rptPronoibat" runat="server">
            <ItemTemplate>
                <article class="mediaPro">
                    <figure class="photo-media-pro"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a></figure>
                    <div class="text-media">
                        <h2 class="tt-media"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h2>
                        <p class="desc"><%# Eval("NEWS_DESC") %></p>
                        <div class="linkview">Giá: <span><%# Getprice(Eval("News_Price1"))%></span></div>
                    </div>
                </article>                   
            </ItemTemplate>
        </asp:Repeater>        
      </div>
    </section>