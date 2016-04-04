using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;

namespace THVDev.vi_vn
{
    public partial class register : System.Web.UI.Page
    {
        #region Declare
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        Userinfo user = new Userinfo();
        Config cf = new Config();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Đăng ký";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Utils.CStrDef(HttpContext.Current.Session["User_ID"])))
                {
                    Response.Redirect("trang-chu.html");
                }
                Loadcity();
                Loadyear();
            }
        }
        public void Loadcity()
        {
            ddlCity.DataTextField = "PROP_NAME";
            ddlCity.DataValueField = "PROP_ID";
            ddlCity.DataSource = user.Loadcity();
            ddlCity.DataBind();
            //ListItem l = new ListItem("------------Chọn thành phố----------- ", "0", true);
            //l.Selected = true;
            //ddlCity.Items.Insert(0, l);
        }
        public void Loadyear()
        {
            ddlYear.Items.Add(new ListItem("Năm", "0"));
            for (int i = DateTime.Now.Year; i > DateTime.Now.Year - 60 ; i--)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }
        protected void btnDangky_Click(object sender, EventArgs e)
        {
            try
            {

                string _sbody = string.Empty;
                string _email = formEmail.Text;
                string _fullname = formFullname.Value;
                string _pass = fm.MaHoaMatKhau(formPassword.Value);
                string _sCodeActive = fm.TaoChuoiTuDong(15);
                if (this.formCode.Value == this.Session["CaptchaImageText"].ToString())
                {
                    if (!chkAcept.Checked)
                    {
                        Labelerrors.Text = "Chưa đồng ý điều khoản";
                        return;
                    }
                    if (acc.Check_email(formEmail.Text))
                    {
                        Labelerrors.Text = "Email đã có người sử dụng!";
                        return;
                    }
                    DateTime ngaysinh = Utils.CDateDef(ddlYear.SelectedItem.Value + "/" + ddlMonth.SelectedItem.Value + "/" + ddlDay.SelectedItem.Value, DateTime.MinValue);
                    if (acc.Register(_fullname, Utils.CIntDef(rdbSex.SelectedItem.Value), ngaysinh, formAddress.Value, formPhone.Value, ddlCity.SelectedValue, _pass, _email))
                    {
                        string strScript = "<script>";
                        strScript += "alert(' Đăng ký thành công!');";
                        strScript += "window.location='/trang-chu.html';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                    else
                    {
                        Labelerrors.Text = "Lỗi, Vui lòng thử lại!";
                    }
                }
                else
                {
                    Labelerrors.Text = "Mã xác nhận không đúng!";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}