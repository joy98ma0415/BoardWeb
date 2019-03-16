using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BoardWeb
{
    public partial class MLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginCmd_Click(object sender, EventArgs e)
        {
            if (AdoSql.LoginCheck(this.UserNameStr.Text, this.PassWordStr.Text) == true)
            {
                Session["UserSession"] = this.UserNameStr.Text;
                Response.Redirect("MNews.aspx");
            }
            else
            {
                MsgTxt.Text = "用戶名或密碼有誤！";
            }
        }
    }
}