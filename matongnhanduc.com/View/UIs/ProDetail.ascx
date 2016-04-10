<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProDetail.ascx.cs" Inherits="matongnhanduc.UIs.ProDetail" %>
<script src="../vi-vn/Ajax/Addtocart.js" type="text/javascript"></script>
<script type="text/javascript" src="/vi-vn/Scripts/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="/vi-vn/Styles/detail_product.css" type="text/css" />
<link href="/vi-vn/Styles/jquery.fancybox.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/vi-vn/Scripts/jquery.fancybox.js"></script>
<script type='text/javascript'>//<![CDATA[
    $(document).ready(function () {
        function showImage(o) {
            $('#thumbnails_P li a').removeClass('current');
            $(o).addClass('current');
            var img = $('.inn #' + $(o).attr('for'));
            if ($('.inn a:visible').length > 0) {
                $('.inn a:visible').fadeOut('fast', function () {
                    img.fadeIn('fast');
                });
            } else {
                img.fadeIn('fast');
            }

            return false;
        }

        $('#thumbnails_P li a').click(function () {
            showImage(this);
            return false;
        });
        $('#thumbnails_P li:first-child a').click();

        //carouFredSel
        $('#thumbnails_P ul').carouFredSel({
            prev: '#prev2',
            next: '#next2',
            //responsive: true,
            auto: false,
            //width: '100%',
            scroll: {
                items: 4,
                pauseOnHover: true
            },
            speed: 2000,
            duration: 3000,
            items: {
                visible: {
                    min: 1,
                    max: 4
                }
            }
        });

        $(".zoom").fancybox({
            openEffect: 'elastic',
            closeEffect: 'elastic',
            autoPlay: 'true',
            playSpeed: '10000'
        });
    });
</script>
<script type="text/javascript" src="/vi-vn/Scripts/jquery.carouFredSel-5.6.0-packed.js"></script>
<section class="main-content">
    <p class="tt-main"><span><asp:Literal ID="lbTitle" runat="server"/></span></p>
    <article class="iblock detail-pros" style="position: relative;">
        <div class="pro_left">
          <div class="main_img boxcenter">
            <div class="midd">
              <div class="inn">
                <asp:Repeater ID="Rpimg_small_news" runat="server">
                  <ItemTemplate> <a id='<%#Eval("NEWS_IMG_ID") %>' href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" title="<%# getTitle(Eval("NEWS_ID"))%>" rel="gallery1" class="img-box zoom" style="display: none;"> <img  src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" alt="<%# getTitle(Eval("NEWS_ID"))%>" /><span class="zoom_icon"></span><span class="text_click">Click xem ảnh lớn</span></a> </ItemTemplate>
                </asp:Repeater>
              </div>
            </div>
          </div>
          <div id="thumbnails_P">
            <ul>
              <asp:Repeater ID="Rpimg_small" runat="server">
                <ItemTemplate>
                  <li class="thumb"><a href="javascript: return false;" for="<%#Eval("NEWS_IMG_ID") %>"><img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" alt="<%# getTitle(Eval("NEWS_ID"))%>" /></a></li>
                </ItemTemplate>
              </asp:Repeater>
            </ul>
            <div class="cf"></div>
            <a id="prev2" class="prev" href="#">&lt;</a> <a id="next2" class="next" href="#">&gt;</a> </div>
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
            <%--<div class="buy">
                <asp:Repeater ID="Rpttintuc" runat="server">
                <ItemTemplate>
                    <a href='javascript:void(0)' onclick="addtocart(<%# Eval("NEWS_ID") %>,1)">Mua ngay</a>
                </ItemTemplate>
                </asp:Repeater>
            </div>--%>

            <asp:Literal ID="liHtml" runat="server"></asp:Literal>
        </div>
    </article>

    
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
<div class="cf"></div>