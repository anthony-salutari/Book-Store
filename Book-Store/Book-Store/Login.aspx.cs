using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Book_Store
{
    public partial class Login : System.Web.UI.Page
    {
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            loginError.Visible = false;
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());
            string checkLoginString = "SELECT Users.PasswordHash WHERE Users.Email = " + emailBox.Text;

            // check if password is correct
            SqlCommand checkLogin = new SqlCommand(checkLoginString, connection);
            connection.Open();

            SqlDataReader reader = checkLogin.ExecuteReader(CommandBehavior.CloseConnection);
            reader.Read();

            // if correct set some session variables
        }
    }
}