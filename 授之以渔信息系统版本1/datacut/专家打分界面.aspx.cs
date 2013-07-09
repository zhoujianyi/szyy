using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using datacut.Model;

namespace datacut
{
    public partial class 专家打分界面 : System.Web.UI.Page
    {
        protected void Page_Load( object sender , EventArgs e )
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        #region private methods

        private void Bind()
        {
            //var dt = new DataTable();
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();
            var gradelist = new List<Grade>();

            string sql = "select f.id,f.type,f.field,g.apr,g.aug,g.dec,g.feb,g.jan,g.jul,g.jun,g.mar,g.may,g.nov,g.oct,g.sep from fish as f left join grade as g on g.fishid=f.id";
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

            FishGrade.DataSource = gradelist;
            FishGrade.DataBind();
            conn.Close();
            conn.Dispose();
        }

        #endregion

        protected void SubmitButton_Click( object sender , EventArgs e )
        {
            var dao = new DAO();
            var conn = dao.getConnection();
            var com = conn.CreateCommand();
            string advices = advice.Value.ToString();

            conn.Open();
            string sql = "select id from staff where type=1 or type=2";
            com.CommandText = sql;
            try
            {
                var list = new List<string>();
                var dr = com.ExecuteReader();
                while (dr.Read())
                {
                    string userid = dr["id"].ToString();
                    list.Add(userid);
                }
                dr.Close();

                foreach (var item in advices.Split(new char[] { ',' }))
                {
                    foreach (var user in list)
                    {
                        sql = "insert into advice(senderid,userid,advice,date,isread) values (" + Session["id"].ToString() + "," + user + ",'" + item.Split(new char[] { '-' })[2] + "','" + DateTime.Now.ToString() + "','0')";
                        com.CommandText = sql;
                        com.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                conn.Close();
                conn.Dispose();
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }
        }

        protected void FishGrade_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}