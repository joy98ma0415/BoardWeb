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
    public partial class EditNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ReadNews();
            }

        }
        private int GetNewsID()
        {
            if (Request.QueryString["NewsID"] != null)
            {
                return int.Parse(Request.QueryString["NewsID"].ToString());
            }
            else
            {
                Response.Redirect("Default.aspx");
                return 0;
            }
        }

        private void ReadNews()
        {
            int NewsID = this.GetNewsID();
            if (NewsID > 0)
            {
                AdoSql SqlClass = new AdoSql();
                DataTable NewsTab = SqlClass.ReadNewsByID(NewsID);
                if (NewsTab.Rows.Count == 1)
                {
                    this.TitleStr.Text = NewsTab.Rows[0]["TitleStr"].ToString();
                    this.ContentTxt.Text = NewsTab.Rows[0]["ContentTxt"].ToString();
                    this.NameStr.Text = NewsTab.Rows[0]["NameStr"].ToString();
                    this.DateTimeTxt.Text = NewsTab.Rows[0]["DateTimeTxt"].ToString();
                }
            }
        }

        protected void EditCmd_Click(object sender, EventArgs e)
        {
            int NewsID = this.GetNewsID();
            AdoSql SqlClass = new AdoSql();
            SqlClass.UpdateNews(this.TitleStr.Text, this.ContentTxt.Text, this.GetNewsID());
            this.MsgTxt.Text = "修改成功!";

        }
    }
}