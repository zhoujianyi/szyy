using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace datacut
{
    public partial class 专家发消息界面 : System.Web.UI.Page
    {
        protected void Page_Load( object sender , EventArgs e )
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        private void Bind()
        {
            var dt = new DataTable();
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();

            string sql = "select id,name from staff where type=1";

            com.CommandText = sql;
            var da = new SqlDataAdapter(com);
            da.Fill(dt);

            SupplierList.DataSource = dt;
            SupplierList.DataTextField = dt.Columns[1].ColumnName;
            SupplierList.DataValueField = dt.Columns[0].ColumnName;
            SupplierList.DataBind();
                
            conn.Close();
            conn.Dispose();
        }

        protected void TypeList_SelectedIndexChanged( object sender , EventArgs e )
        {
            if (TypeList.SelectedIndex == 0)
                SupplierList.Enabled = false;
            else if(TypeList.SelectedIndex==1)
                SupplierList.Enabled = true;
        }

        protected void SendButton_Click( object sender , EventArgs e )
        {
            var dt = new DataTable();
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();
            string sql;
            string senderid = Session["id"].ToString();

            conn.Open();
            try
            {
                if (TypeList.SelectedIndex == 1)
                {
                    string userid = SupplierList.SelectedValue.ToString();

                    sql = "insert into advice(senderid,userid,advice,date,isread) values (" + senderid + "," + userid + ",'" + Content.Text + "','" + DateTime.Now.ToString() + "','0')";
                    com.CommandText = sql;
                    com.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(GetType() , "Message" , "<SCRIPT LANGUAGE='javascript'>alert('发送成功!')");
                }
                else if (TypeList.SelectedIndex == 0)
                {
                    sql = "select id from staff where type=1 or type=2";
                    com.CommandText = sql;

                    var list = new List<string>();
                    var dr = com.ExecuteReader();
                    while (dr.Read())
                    {
                        string userid = dr["id"].ToString();
                        list.Add(userid);
                    }
                    dr.Close();
                    foreach (var item in list)
                    {
                        sql = "insert into advice(senderid,userid,advice,date,isread) values (" + senderid + "," + item + ",'" + Content.Text + "','" + DateTime.Now.ToString() + "','0')";
                        com.CommandText = sql;
                        com.ExecuteNonQuery();
                    }
                }
                ClientScript.RegisterStartupScript(GetType() , "Message" , "<SCRIPT LANGUAGE='javascript'>alert('发送成功!')");
                //Content.Text = "";
                
            }
            catch (Exception ex)
            {
                conn.Close();
                conn.Dispose();
            }
            finally
            {
                Content.Text = "";
                conn.Close();
                conn.Dispose();
            }
        }
    }
}