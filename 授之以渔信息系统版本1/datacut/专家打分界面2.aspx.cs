using datacut.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace datacut
{
    public partial class 专家打分界面2 : System.Web.UI.Page
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
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();
            var gradelist = new List<Grade>();

            string sql = "select g.*,f.type,f.field from fish as f left join grade as g on g.fishid=f.id";
            com.CommandText = sql;

            conn.Open();
            var dr = com.ExecuteReader();
            while (dr.Read())
            {
                var grade = new Grade();
                grade.Id = dr["id"].ToString();
                grade.Fish = dr["field"].ToString() + " " + dr["type"].ToString();
                grade.Jan = dr["jan"].ToString();
                grade.Feb = dr["feb"].ToString();
                grade.Mar = dr["mar"].ToString();
                grade.Apr = dr["apr"].ToString();
                grade.May = dr["may"].ToString();
                grade.Jun = dr["jun"].ToString();
                grade.Jul = dr["jul"].ToString();
                grade.Aug = dr["aug"].ToString();
                grade.Sep = dr["sep"].ToString();
                grade.Oct = dr["oct"].ToString();
                grade.Nov = dr["nov"].ToString();
                grade.Dec = dr["dec"].ToString();

                gradelist.Add(grade);
            }

            FishGrade2.DataSource = gradelist;
            FishGrade2.DataBind();
            conn.Close();
            conn.Dispose();
        }

        protected void GridView1_SelectedIndexChanged( object sender , EventArgs e )
        {

        }
        protected void GridView1_PageIndexChanging( object sender , GridViewPageEventArgs e )
        {
            FishGrade2.PageIndex = e.NewPageIndex;
            Bind();//重新绑定一遍数据
        }

        protected void GridView1_RowUpdating( object sender , GridViewUpdateEventArgs e )
        {
            string id = FishGrade2.DataKeys[e.RowIndex].Values[0].ToString();

            string s1 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[1].Controls[1] ).SelectedValue.ToString();
            string s2 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[2].Controls[1] ).SelectedValue.ToString();
            string s3 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[3].Controls[1] ).SelectedValue.ToString();
            string s4 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[4].Controls[1] ).SelectedValue.ToString();
            string s5 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[5].Controls[1] ).SelectedValue.ToString();
            string s6 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[6].Controls[1] ).SelectedValue.ToString();
            string s7 = ( (DropDownList)FishGrade2.Rows[e.RowIndex].Cells[7].Controls[1] ).SelectedValue.ToString();
            
            string sqlupdate = "update grade set jan='" + s1 + "',feb='" + s2 + "',mar='" + s3 + "',apr='" + s4 + "',may='" + s5 + "',jun='" + s6  + "' where fishid='" + id + "'";
            string sqlinsert = "insert into grade(fishid,professorid,jan,feb,mar,apr,may,jun) value(" + id + "," + Session["id"].ToString() + ",'" + s1 + "','" + s2 + "','" + s3 + "','" + s4 + "','" + s5 + "','" + s6 + "')";

            try
            {
                DAO dao = new DAO();
                var conn = dao.getConnection();
                string sql ;

                conn.Open();
                var comm = conn.CreateCommand();
                comm.CommandText = "select * from grade where fishid=" + id;
                var dr=comm.ExecuteReader();
                if (dr.HasRows)
                    sql = sqlupdate;
                else
                    sql = sqlinsert;
                dr.Close();

                comm.CommandText = sql;
                comm.ExecuteNonQuery();
                comm.Dispose();
                conn.Close();

                FishGrade2.EditIndex = -1;
                Bind();
            }
            catch (Exception ex)
            {
                Response.Write("数据库错误，错误原因：" + ex.Message);
                Response.End();
            }
        }

        protected void GridView1_RowEditing( object sender , GridViewEditEventArgs e )
        {
            FishGrade2.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowCancelingEdit( object sender , GridViewCancelEditEventArgs e )
        {
            FishGrade2.EditIndex = -1;
            Bind();
        }
    }
}