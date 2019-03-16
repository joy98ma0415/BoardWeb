using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BoardWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadAllNews();
                TopTxt.Text = "我的作品集公佈欄";
            }

        }
        private void LoadAllNews()
        {
            AdoSql ReadAllNews = new AdoSql();
            DataTable NewsTable = ReadAllNews.ReadAllNews();
            this.NewsGrid.DataSource = NewsTable;
            this.NewsGrid.DataBind();
        }

        protected void NewsGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.NewsGrid.PageIndex = e.NewPageIndex;
            this.LoadAllNews();
        }
    }
}