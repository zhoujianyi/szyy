using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace datacut
{
    public class DAO
    {
        //internal StoredProcedure sproc = null;

        public SqlConnection getConnection()
        {
            string conn = ConfigurationManager.ConnectionStrings["QYYConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);
            return connection;
        }

        public DAO() { }
    }
}