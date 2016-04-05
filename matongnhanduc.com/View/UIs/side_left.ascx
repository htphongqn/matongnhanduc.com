<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="side_left.ascx.cs" Inherits="matongnhanduc.UIs.side_left" %>

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
      <nav class="pro_main">
        <h2 class="tt-side">Sản phẩm nổi bật</h2>
        <div class="box_content_center">
            <script src="/vi-vn/Scripts/jcarousellite_1.0.1c4.js" type="text/javascript"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#jcarouse_new_product").jCarouselLite({  // Lấy class của ul và gọi hàm jCarouselLite() trong thư viện
                        vertical: true,				// chạy theo chiều dọc
                        hoverPause: true,			// Hover vào nó sẽ dừng lại
                        visible: 2,					// Số bài viết cần hiện
                        auto: 500,					// Tự động scroll
                        speed: 1000					// Tốc độ scroll
                    });
                });
            </script>
            <div class="slide_v_product">
              <div id="jcarouse_new_product">
                <ul>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                  <li> <a href=""><img src="/vi-vn/data/product_01.jpg" alt="" width="165" height="110" /></a>
                    <h2 class="h2Title"><a href="">Bơi thuyền đa năng tập mạnh...</a></h2>
                    <div class="price">Giá: <span class="link_title">Liên hệ</span></div>
                    <div class="clr"></div>
                  </li>
                </ul>
              </div>
            </div>
            <div class="clearfix"></div>
          </div>
      </nav>
      <nav class="news_main">
        <h2 class="tt-side">Tin nổi bật</h2>
        <div class="box_content_center news">
            <ul>
              <li><a href="news_detail.html"><img width="75" height="50" alt="" src="/vi-vn/data/news_01.jpg" class="img_general"></a>
                <p class="Title_news"><a href="news_detail.html">Hướng dẫn cấu hình camera p2!</a></p>
              </li>
              <li><a href="news_detail.html"><img width="75" height="50" alt="" src="/vi-vn/data/news_01.jpg" class="img_general"></a>
                <p class="Title_news"><a href="news_detail.html">Hướng dẫn cấu hình camera p2!</a></p>
              </li>
              <li><a href="news_detail.html"><img width="75" height="50" alt="" src="/vi-vn/data/news_01.jpg" class="img_general"></a>
                <p class="Title_news"><a href="news_detail.html">Hướng dẫn cấu hình camera p2!</a></p>
              </li>
            </ul>
            <div class="clearfix"></div>
          </div>
      </nav>
      <figure class="ads">
        <asp:Repeater ID="rptAds" runat="server">
            <ItemTemplate>                 
                 <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%>
            </ItemTemplate>
        </asp:Repeater> 
      </figure>
    </aside>