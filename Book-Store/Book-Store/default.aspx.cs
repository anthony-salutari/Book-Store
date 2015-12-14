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
            // check if user is logged in
            if (Session["LoggedIn"] != null)
            {
                userBox.Attributes.Add("style", "display:inline");
                links.Attributes.Add("style", "display:none");

                try
                {
                    userImage.ImageUrl = Session["Photo"].ToString();
                    userNameLabel.Text = Session["UserName"].ToString();
                }
                catch (Exception ex)
                {
                    // handle exception
                }
            }
            else
            {
                userBox.Attributes.Add("style", "display:none");
                links.Attributes.Add("style", "display:inline");
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchString = String.Format("SELECT * FROM Listings WHERE Title LIKE '{0}' OR BookName LIKE '{0}'", searchBox.Text);

            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);
                SqlCommand command = new SqlCommand(searchString, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                reader.Read();
                
                if (reader.HasRows)
                {
                    // search returned results
                }
                else
                {
                    // no results inform user
                    throw new Exception("No results found");
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }

        protected void logoutLink_Click(object sender, EventArgs e)
        {
            // user wants to log out, clear session variables and post back to default
            Session.Abandon();
            Session.Clear();
            Response.Redirect("default.aspx");
        }
    }
}