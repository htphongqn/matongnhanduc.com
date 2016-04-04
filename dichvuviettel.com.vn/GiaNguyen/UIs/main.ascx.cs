using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace THVDev.UIs
{
    public partial class main : System.Web.UI.UserControl
    {
        News_details ndetail = new News_details();
        Home index = new Home();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Khuyenmai();
                Load_Tinnoibat();
            }
        }
        private void Load_Khuyenmai()
        {
            try
            {
                var list = index.Loadindex(0, 1, -1, 1);
                rptKhuyenmai.DataSource = list;
                rptKhuyenmai.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string Show_File_HTML(object NEWS_SEO_URL)
        {
            try
            {
                string _sNews_Seo_Url = Utils.CStrDef(NEWS_SEO_URL);
                return ndetail.Showfilehtm("", _sNews_Seo_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public void Load_Tinnoibat()
        {
            try
            {
                var list = index.Loadindex(0, 2, -1, 5);
                if (list != null && list.ToList().Count > 0)
                {
                    rptTinnoibat.DataSource = list;
                    rptTinnoibat.DataBind();
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #region function
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
        #endregion
    }
}