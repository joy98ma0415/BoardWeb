using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BoardWeb
{
   public class AdoSql
    {
        public AdoSql()
        {

        }

        /// <summary>
        ///  执行SQL语句－读      李锡远 写
        /// </summary>
        /// <param name="SqlString">SQL语句</param>
        /// <returns></returns>
        public DataTable ExecuteSqlRead(string SqlString)
        {
            SqlCommand SqlCmd = new SqlCommand();
            SqlCmd.Connection = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["CollectionWebApp_dbConnectionString"]);
            SqlCmd.CommandText = SqlString;
            SqlCmd.CommandType = CommandType.Text;
            SqlDataAdapter SqlAd = new SqlDataAdapter(SqlCmd);
            DataSet Rs = new DataSet();
            SqlAd.Fill(Rs);
            return Rs.Tables[0];
        }

        /// <summary>
        /// 执行SQL语句－写     李锡远 写
        /// </summary>
        /// <param name="SqlString">SQL语句</param>
        /// <returns></returns>
        public Boolean ExecuteSqlWrite(string SqlString)
        {
            SqlCommand SqlCmd = new SqlCommand();
            SqlCmd.Connection = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["CollectionWebApp_dbConnectionString"]);
            SqlCmd.CommandText = SqlString;
            SqlCmd.CommandType = CommandType.Text;
            SqlCmd.Connection.Open();
            SqlCmd.ExecuteNonQuery();
            SqlCmd.Connection.Close();
            return true;
        }

        /// <summary>
        /// 读取新闻系统的数据列表
        /// </summary>
        /// <returns></returns>
        public DataTable ReadAllNews()
        {
            string SqlString = "select NewsID,NameStr,NewsType,TitleStr,DateTimeTxt from NewsText order by NewsID desc";
            return ExecuteSqlRead(SqlString);
        }

        /// <summary>
        /// 读取新闻分类
        /// </summary>
        /// <returns></returns>
        public DataTable ReadAllType()
        {
            String SqlString = "select NewsType from NewsTypes";
            return ExecuteSqlRead(SqlString);
        }

        /// <summary>
        /// 发布新闻
        /// </summary>
        /// <param name="NewsType"></param>
        /// <param name="TitleStr"></param>
        /// <param name="NameStr"></param>
        /// <param name="ContentTxt"></param>
        public void AddNews(string NewsType, string TitleStr, string NameStr, string ContentTxt)
        {
            String SqlString = "insert NewsText (NameStr,NewsType,TitleStr,ContentTxt,DateTimeTxt) values ('" + NameStr + "','" + NewsType + "','" + TitleStr + "','" + ContentTxt + "','" + DateTime.Now.ToShortDateString() + "')";
            ExecuteSqlWrite(SqlString);
        }

        /// <summary>
        /// 验证登陆
        /// </summary>
        /// <param name="UserNameStr"></param>
        /// <param name="PassWordStr"></param>
        public static Boolean LoginCheck(string UserNameStr, string PassWordStr)
        {
            string SqlString = "select UserNameStr,PassWordStr from NewsUser where UserNameStr='" + UserNameStr + "'and PassWordStr='" + PassWordStr + "'";
            SqlConnection SqlConn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["CollectionWebApp_dbConnectionString"]);
            SqlCommand SqlCmd = new SqlCommand(SqlString, SqlConn);
            SqlConn.Open();

            SqlDataReader SqlReader = SqlCmd.ExecuteReader();
            Boolean FindUser = false;
            while (SqlReader.Read())
            {
                FindUser = true;
            }

            if (FindUser)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable ReadNewsByID(int NewsID)
        {
            string SqlString = "select NameStr,TitleStr,ContentTxt,DateTimeTxt from NewsTxt where NewsID=" + NewsID;
            return ExecuteSqlRead(SqlString);
        }

        public void UpdateNews(string TitleStr, string ContentTxt, int NewsID)
        {
            String SqlString = "Update NewsTxt set TitleStr='" + TitleStr + "',ContentTxt='" + ContentTxt + "' where NewsID=" + NewsID;
            ExecuteSqlWrite(SqlString);
        }

    }
}