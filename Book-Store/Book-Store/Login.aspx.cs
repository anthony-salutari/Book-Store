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
                string checkEmailString = String.Format("SELECT count(*) FROM Users WHERE EmailAddress='{0}'", emailBox.Text);
                string checkLoginString = String.Format("SELECT PasswordHash FROM Users WHERE EmailAddress='{0}'", emailBox.Text);
                string getUserString = String.Format("SELECT EmailAddress, Name, PictureURL, UserType FROM uSERS WHERE EmailAddress='{0}'", emailBox.Text);

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

                    connection.Close();

                    if (correctPassword)
                    {
                        SqlCommand getUser = new SqlCommand(getUserString, connection);
                        connection.Open();

                        SqlDataReader userReader = getUser.ExecuteReader(CommandBehavior.CloseConnection);
                        userReader.Read();

                        //correct set some session variables
                        Session["EmailAddress"] = userReader["EmailAddress"].ToString();
                        Session["UserName"] = userReader["Name"].ToString();
                        Session["Photo"] = userReader["PictureURL"].ToString();
                        Session["UserType"] = userReader["UserType"].ToString();
                        Session["LoggedIn"] = true;

                        connection.Close();

                        // send user back to home page
                        Server.Transfer("default.aspx", false);                       
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