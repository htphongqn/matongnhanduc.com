using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;

namespace matongnhanduc.UIs
{
    public partial class ProDetail : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        Product_Details pro_detail = new Product_Details();
        News_details ndetail = new News_details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            Loaddetails();
            Loadimgbig(100, 0, ref Rpimg_small);
            Loadimgbig(100, 0, ref Rpimg_small_news);
            Show_File_HTML();
            Tinkhac();
            LoadTitle();
        }

        #region Data
        public void Loadimgbig(int take, int skip, ref Repeater rp)
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                var list = pro_detail.Load_albumimg(_newsID).Skip(skip).Take(take).ToList();
                rp.DataSource = list;
                rp.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void LoadTitle()
        {
            string[] page_nameUrl = Request.Url.Segments;
            if (page_nameUrl.Length > 0)
            {
                string page_name = page_nameUrl[page_nameUrl.Length - 1];
                if (page_name == "Contact.aspx")
                {
                    lbTitle.Text = "Liên hệ";
                }
                else
                {
                    object cat_ID = HttpContext.Current.Session["Cat_id"];
                    var item = per.GetCatalogryByID(cat_ID);
                    if (item != null)
                    {
                        lbTitle.Text = item.CAT_NAME;
                    }
                }
            }
            else
            {
                object cat_ID = HttpContext.Current.Session["Cat_id"];
                var item = per.GetCatalogryByID(cat_ID);
                if (item != null)
                {
                    lbTitle.Text = item.CAT_NAME;
                }
            }

        }
        public void Loaddetails()
        {
            try
            {
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    lbNewsTitle.Text = list[0].NEWS_TITLE;
                    liDesc.Text = list[0].NEWS_DESC;
                    liPrice.Text = Getprice(list[0].NEWS_PRICE1);

                    //Rpttintuc.DataSource = list.ToList().Take(1);
                    //Rpttintuc.DataBind();
                }
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion

        #region My Function
        private void Show_File_HTML()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                liHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url);
                
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = pro_detail.Load_Similar_Product(_sNews_Seo_Url).Take(4);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                    else
                        dvOtherNews.Visible = false;
                }
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetTitle(object NewsId)
        {
            return per.getTitleById(NewsId);
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        public string getTitle(object News_Id)
        {
            return pro_detail.getTitleNews(News_Id);
        }
        #endregion
    }
}