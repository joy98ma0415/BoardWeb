using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BoardWeb
{
    public partial class MNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserSession"] == null)
            {
                Response.Redirect("MLogin.aspx");
            }

            if (!IsPostBack)
            {
                this.LoadAllNews();
                TopTxt.Text = "恭喜 " + Session["UserSession"] + " 登入成功";
            }
        }

        private void LoadAllNews()
        {
            AdoSql ReadAllNews = new AdoSql();
            DataTable NewsTable = ReadAllNews.ReadAllNews();
            this.NewsGrid.DataSource = NewsTable;
            this.NewsGrid.DataBind();
        }


        protected void MExit_Click(object sender, EventArgs e)
        {
            Session["UserSession"] = null;
            Response.Redirect("MLogin.aspx");
        }

        protected void NewsGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.NewsGrid.PageIndex = e.NewPageIndex;
            this.LoadAllNews();
        }

        protected void NewsGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DelCmd")
            {
                int NewsID = Convert.ToInt32(e.CommandArgument);
                AdoSql SqlDel = new AdoSql();
                SqlDel.ExecuteSqlWrite("delete from NewsTxt where NewsID=" + NewsID);
                this.LoadAllNews();
            }
        }
    }
}