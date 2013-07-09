using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;
using System.Data.SqlClient;


namespace datacut
{
    public partial class 登录1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {
            DAO dao = new DAO();
            SqlConnection conn = dao.getConnection();
            SqlCommand com = conn.CreateCommand();
            string name = UserName.Text.ToString();
            string pass = Password.Text.ToString();
            int type = RadioButtonList1.SelectedIndex;
            // 查询用的SQL 语句
            com.CommandText = "select * from staff where name='" + name + "' and password='" + pass + "' and type='" + type + "'";

            //Session["UserName"] = name;
            conn.Open();
            try
            {
                //SqlDataAdapter oda = new SqlDataAdapter();
                SqlDataReader odr = com.ExecuteReader();

                //oda.SelectCommand = com;
                //DataTable dt = new DataTable();
                //oda.Fill(dt);
                //num = (int)com.ExecuteScalar();
                if (odr.HasRows)
                {
                    odr.Read();

                    if (odr["type"].ToString() == "0")
                    {
                        Session["id"] = odr["id"].ToString();
                        //string id = Session["id"].ToString();
                        Response.Redirect("~/专家主界面.aspx");
                    }
                    else if (odr["type"].ToString() == "1")
                    {
                        Session["id"] = odr["id"].ToString();
                        Response.Redirect("~/商家主界面.aspx");
                    }
                    else if (odr["type"].ToString() == "2")
                    {
                        Session["id"] = odr["id"].ToString();
                        Response.Redirect("~/顾客主界面.aspx");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType() , "Message" , "<SCRIPT LANGUAGE='javascript'>alert('用户名密码不正确或身份错误，请确认！');</script>");
                }
            }
            catch (Exception ex)
            {
                // 操作出错
                Response.Write("数据库访问错误！"+ ex.Message);
            }
            finally
            {
                // 关闭数据库连接
                conn.Close();
            }
        }
            

        protected void Button1_Click(object sender, EventArgs e)
        {
            UserName.Text = null;
            Password.Text = null;
            RadioButtonList1.ClearSelection();
        }     
    }
}