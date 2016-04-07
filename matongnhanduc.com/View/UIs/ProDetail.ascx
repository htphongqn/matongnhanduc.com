<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProDetail.ascx.cs" Inherits="matongnhanduc.UIs.ProDetail" %>

<link rel="stylesheet" href="/vi-vn/Styles/responsiveslides.css" type="text/css" media="screen" />
<script type="text/javascript" src="/vi-vn/Scripts/responsiveslides.min.js"></script>
<link href="/vi-vn/Styles/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/vi-vn/Scripts/jquery.fancybox.js"></script>
<script type="text/javascript">
    $(function () {

        // Slideshow 4
        $("#slider1").responsiveSlides({
            auto: true,
            pager: false,
            pagination: false,
            nav: true,
            speed: 500,
            timeout: 5000,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });
        $(".zoom").fancybox({
            openEffect: 'elastic',
            closeEffect: 'elastic',
            autoPlay: 'true',
            playSpeed: '5000'
        });
    });
</script>
<section class="main-content">
    <p class="tt-main"><span><asp:Literal ID="lbTitle" runat="server" Text="" /></span></p>
    <article class="iblock detail-news" style="position: relative;">

        <div class="proleftdet fl">
            <div class="callbacks_container" id="pro_detail_slide">
              <ul class="rslides" id="slider1">
                <asp:Repeater ID="Rpimg_small_news" runat="server">
                <ItemTemplate>
                    <li><a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" rel="gallery1" class="img-box zoom" title="<%# GetTitle(Eval("NEWS_ID"))%>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" alt="<%# GetTitle(Eval("NEWS_ID"))%>" /> </a> </li>
                </ItemTemplate>
                </asp:Repeater>
              </ul>
            </div>
          </div>

        <div class="fl detailRight">
            <h1 class="tt-detail-news"><asp:Literal ID="lbNewsTitle" runat="server" Text="" /></h1>
            <div class="addthis_toolbox addthis_default_style" style="padding-top:10px;">
                <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
                </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
                </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
                </a>
                <script type="text/javascript">
                    var addthis_config = { "data_track_addressbar": true };
                    addthis_config = addthis_config || {};
                    addthis_config.data_track_addressbar = false;
                </script>
                <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
            </div>
            <div class="desc"><asp:Literal ID="liDesc" runat="server"></asp:Literal></div>
            <div class="price">Giá: <span><asp:Literal ID="liPrice" runat="server"></asp:Literal></span></div>
            <div class="buy"><a>Mua ngay</a></div>
        </div>
    </article>

    <asp:Literal ID="liHtml" runat="server"></asp:Literal>

    
    <div class="clearfix otherNews iblock list-media" id="dvOtherNews" runat="server">
    <p class="tt-main"><span>Sản phẩm Tương tự</span></p>
        <asp:Repeater ID="Rptinkhac" runat="server">
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