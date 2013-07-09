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
    public partial class 专家检索界面 : System.Web.UI.Page
    {
        protected void Page_Load( object sender , EventArgs e )
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        #region private methods

        private void GridViewBind()
        {
            var dt = new DataTable();
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();

            string sql = "select r.id,r.userid1,r.userid2,r.amount,r.date,r.period,f.type,f.field from record as r left join fish as f on r.fishid=f.id";
            int iswhere = 0;
            string year = YearList.SelectedItem.Text;
            string month = MonthList.SelectedItem.Text;
            if (YearList.SelectedIndex != 0)
            {
                if (iswhere == 0)
                {
                    sql = sql + " where r.period='" + year + "-" + month + "'";
                    iswhere = 1;
                }
                //sql = YearList.SelectedIndex != 0 ? sql + " where r.period='" + year + "-" + month + "'" : sql;
            }
            string category = CategoryList.SelectedValue.ToString();
            if (CategoryList.SelectedIndex != 0)
            {
                if (iswhere == 0)
                {
                    sql = sql + " where f.type='" + category + "'";
                    iswhere = 1;
                }
                else
                    sql = sql + " and f.type='" + category + "'";
                //sql = CategoryList.SelectedIndex != 0 ? sql + " and f.type='" + category + "'" : sql;
            }
            string fishery = FisheryList.SelectedValue.ToString();
            if (FisheryList.SelectedIndex != 0)
            {
                if (iswhere == 0)
                {
                    sql = sql + " where  f.field='" + fishery + "'";
                    iswhere = 1;
                }
                else
                    sql = sql + " and  f.field='" + fishery + "'";
            }
            //sql = FisheryList.SelectedIndex != 0 ? sql + " and f.field='" + fishery + "'" : sql;
            string customer = CustomerList.SelectedValue.ToString();
            if (CustomerList.SelectedIndex != 0)
            {
                if (iswhere == 0)
                {
                    sql = sql + " where  r.userid2='" + customer + "'";
                    iswhere = 1;
                }
                else
                    sql = sql + " and  r.userid2='" + customer + "'";
            }
            //sql = CustomerList.SelectedIndex != 0 ? sql + " and r.userid2='" + customer + "'" : sql;

            com.CommandText = sql;
            var da = new SqlDataAdapter(com);
            da.Fill(dt);

            GridView2.DataSource = dt;
            GridView2.DataBind();
            conn.Close();
            conn.Dispose();
        }

        private void Bind()
        {
            var dt = new DataTable();
            var dt2 = new DataTable();
            var dt3 = new DataTable();
            var dl = new DataList();

            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();

            string sql1 = "select distinct type from fish";
            string sql2 = "select distinct field from fish";
            string sql3 = "select name,id from staff where type=2";

            com.CommandText = sql1;
            //var da = new SqlDataAdapter(com);
            conn.Open();

            var item = new ListItem();
            item.Text = "请选择";
            CategoryList.Items.Add(item);

            var dr = com.ExecuteReader();
            while (dr.Read())
            {
                var listitem = new ListItem();
                listitem.Text = dr["type"].ToString();
                listitem.Value = dr["type"].ToString();
                CategoryList.Items.Add(listitem);
            }
            dr.Close();

            com.CommandText = sql2;
            var item2 = new ListItem();
            item2.Text = "请选择";
            FisheryList.Items.Add(item2);
            
            dr=com.ExecuteReader();
            while(dr.Read())
            {
                var listitem = new ListItem();
                listitem.Text = dr["field"].ToString();
                listitem.Value = dr["field"].ToString();
                FisheryList.Items.Add(listitem);
            }
            dr.Close();

            com.CommandText = sql3;
            var item3 = new ListItem();
            item3.Text = "请选择";
            CustomerList.Items.Add(item3);

            dr = com.ExecuteReader();
            while (dr.Read())
            {
                var listitem = new ListItem();
                listitem.Text = dr["name"].ToString();
                listitem.Value = dr["id"].ToString();
                CustomerList.Items.Add(listitem);
            }
            dr.Close();

            conn.Close();
            conn.Dispose();
        }

        #endregion

        protected void SearchButton_Click( object sender , EventArgs e )
        {
            GridViewBind();

            if (GridView2.Rows.Count == 0)
            {
                NullDataMessage.Visible = true;
            }
            else
            {
                NullDataMessage.Visible = false;
                GridView2.Visible = true;
            }
        }
    }
}