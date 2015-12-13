using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Book_Store
{
    public partial class _default : System.Web.UI.Page
    {
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());

            SqlCommand command = new SqlCommand("SELECT * FROM Users", connection);

            connection.Open();

            //SqlDataReader rdr = command.ExecuteReader(CommandBehavior.CloseConnection);

            //rdr.Read();

            //testBox.Text = rdr[0].ToString();
        }
    }
}