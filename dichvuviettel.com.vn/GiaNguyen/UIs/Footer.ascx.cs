using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.IO;

namespace THVDev.UIs
{
    public partial class Footer : System.Web.UI.UserControl
    {
        #region Declare
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_Footer_HTML();
                Load_SocialNetwork();
                Load_Online();
            }
        }
       
        private void Show_Footer_HTML()
        {
            Literal_Info.Text = cf.Show_File_HTML("footer-vi.htm", "/Data/footer/");
        }
        protected void Load_SocialNetwork()
        {
            try
            {
                rptSocialNetwork.DataSource = per.Load_socialnetwork();
                rptSocialNetwork.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected string Bind_SocialNetwork(object ONLINE_TYPE, object ONLINE_DESC, object ONLINE_NICKNAME)
        {
            try
            {
                var list = fun.Bind_SocialNetwork(ONLINE_TYPE, ONLINE_DESC, ONLINE_NICKNAME);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        protected void Load_Online()
        {
            try
            {
                lbOnline.Text = string.Format("{0:#,#}", Utils.CIntDef(Application["Online"]));
                var _hit = cf.Config_meta();
                if (_hit.ToList().Count > 0)
                {
                    int sum = Utils.CIntDef(_hit.ToList()[0].CONFIG_HITCOUNTER);
                    lbTotal.Text = string.Format("{0:#,#}", sum);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
    }
}