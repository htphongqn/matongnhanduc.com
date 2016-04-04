using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace THVDev.UIs
{
    public partial class side_right : System.Web.UI.UserControl
    {
        #region Declare
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        private Weblink weblink = new Weblink();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_ads();
                Load_Menu1();
                Load_Weblink();
            }
        }
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(2, 20);
                rptAds.DataSource = list;
                rptAds.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object Ad_Item_Desc)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, Ad_Item_Desc);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        protected void Load_Menu1()
        {
            try
            {
                rptMenu.DataSource = per.Loadmenu(2, 18, 1, -1, -1);
                rptMenu.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }

        #region Function
        public string GetLink_Cat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                string temp = fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string GetStyleActive(object Cat_Seo_Url, object Cat_Url)
        {
            try
            {
                string _curl = Utils.CStrDef(Request.QueryString["curl"]);
                string _seoUrl = Utils.CStrDef(Request.QueryString["purl"]);
                return per.GetStyleActive(Cat_Seo_Url, Cat_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        #endregion

        private void Load_Weblink()
        {
            var list = weblink.Loadweblink();
            ddlWeblink.DataSource = list;
            ddlWeblink.DataBind();
        }
        protected void ddlWeblink_SelectedIndexChanged(object sender, EventArgs e)
        {
            int weblinkId = Utils.CIntDef(ddlWeblink.SelectedValue);
            var item = weblink.GetweblinkById(weblinkId);
            if (item != null)
            {
                //ResponseHelper.Redirect("popup.aspx", "_blank", "menubar=0,width=100,height=100");
                ResponseHelper.Redirect(item.WEBSITE_LINKS_URL, item.WEBSITE_LINKS_TARGET, "");
            }
        }
        public static class ResponseHelper
        {
            public static void Redirect(string url, string target, string windowFeatures)
            {
                HttpContext context = HttpContext.Current;

                if ((String.IsNullOrEmpty(target) ||
                    target.Equals("_self", StringComparison.OrdinalIgnoreCase)) &&
                    String.IsNullOrEmpty(windowFeatures))
                {

                    context.Response.Redirect(url);
                }
                else
                {
                    Page page = (Page)context.Handler;
                    if (page == null)
                    {
                        throw new InvalidOperationException(
                            "Cannot redirect to new window outside Page context.");
                    }
                    url = page.ResolveClientUrl(url);

                    string script;
                    if (!String.IsNullOrEmpty(windowFeatures))
                    {
                        script = @"window.open(""{0}"", ""{1}"", ""{2}"");";
                    }
                    else
                    {
                        script = @"window.open(""{0}"", ""{1}"");";
                    }

                    script = String.Format(script, url, target, windowFeatures);
                    ScriptManager.RegisterStartupScript(page,
                        typeof(Page),
                        "Redirect",
                        script,
                        true);
                }
            }
        }
    }
}