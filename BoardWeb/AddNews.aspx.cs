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
    public partial class AddNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadAllType();
            }

        }
        private void LoadAllType()
        {
            AdoSql ReadAllType = new AdoSql();
            DataTable Type = ReadAllType.ReadAllType();
            this.NewsType.DataSource = Type;
            this.NewsType.DataTextField = "NewsType";
            this.NewsType.DataValueField = "NewsType";
            this.NewsType.DataBind();
        }

        protected void CmdAdd_Click(object sender, EventArgs e)
        {
            AdoSql AddSql = new AdoSql();
            AddSql.AddNews(this.NewsType.SelectedItem.Value, this.TitleStr.Text, this.NameStr.Text, this.ContentTxt.Text);
            this.MsgTxt.Text = "新聞發布成功！";
            this.CmdAdd.Enabled = false;

        }
    }
}