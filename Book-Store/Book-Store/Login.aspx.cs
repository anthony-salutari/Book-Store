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
            bool correctPassword;

            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());
                //string checkEmailString = "SELECT * FROM Users WHERE EmailAddress='" + emailBox.Text + "'";
                string checkEmailString = String.Format("SELECT count(*) FROM Users WHERE EmailAddress='{0}'", emailBox.Text);
                //string checkLoginString = "SELECT PasswordHash FROM Users WHERE EmailAddress='" + emailBox.Text + "'";
                string checkLoginString = String.Format("SELECT PasswordHash FROM Users WHERE EmailAddress='{0}'", emailBox.Text);
                // check if email exists
                SqlCommand checkEmail = new SqlCommand(checkEmailString, connection);
                connection.Open();

                int email = (int)checkEmail.ExecuteScalar();

                connection.Close();

                if (email == 1)
                {
                    // check if password is correct
                    SqlCommand checkLogin = new SqlCommand(checkLoginString, connection);
                    connection.Open();

                    SqlDataReader reader = checkLogin.ExecuteReader(CommandBehavior.CloseConnection);
                    reader.Read();

                    correctPassword = Crypto.VerifyHashedPassword(reader[0].ToString(), passwordBox.Text);

                    if (correctPassword)
                    {
                        //correct set some session variables
                    }
                    else
                    {
                        // inform user the username or password is incorrect
                        loginError.Visible = true;
                    }
                }
                else
                {
                    // email doesn't exist show the login error
                    loginError.Visible = true;
                }
            } 
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }
    }
}