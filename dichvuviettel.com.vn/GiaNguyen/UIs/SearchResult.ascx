<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="THVDev.UIs.SearchResult" %>
 
<section class="main-content">
    <p class="tt-main"><asp:Label ID="lbTitle" runat="server" Text="Kết quả tìm kiếm"></asp:Label></p>
    <div class="iblock list-media">
    <asp:Repeater ID="Rplistnews" runat="server">
        <ItemTemplate>
            <article class="media">
                <figure class="photo-media"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a></figure>
                <div class="text-media">
                <h2 class="tt-media"><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h2>
                <p><%# Eval("NEWS_DESC") %></p>
                </div>
            </article>                 
        </ItemTemplate>
    </asp:Repeater>        
    <ul class="pagination clearfix">
        <asp:Literal ID="ltrPage" runat="server"></asp:Literal>
    </ul>
    </div>
</section>
