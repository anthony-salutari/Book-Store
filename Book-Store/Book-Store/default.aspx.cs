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
            string getListingsString = string.Format("SELECT * FROM Listings");

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
                    errorLabel.Text = ex.Message;
                }
            }
            else
            {
                userBox.Attributes.Add("style", "display:none");
                links.Attributes.Add("style", "display:inline");
            }

            // get the list of results
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

            SqlCommand getListings = new SqlCommand(getListingsString, connection);
            connection.Open();

            SqlDataReader reader = getListings.ExecuteReader(CommandBehavior.CloseConnection);

            do
            {
                reader.Read();

                // create a new listing object and fill it with the current row data
                Listing listing = new Listing();
                listing.listingID = Convert.ToInt32(reader["ListingID"].ToString());
                listing.title = reader["Title"].ToString();
                listing.bookName = reader["BookName"].ToString();
                listing.coverImageURL = reader["CoverImageURL"].ToString();
                listing.condition = reader["Condition"].ToString();
                listing.price = reader["Price"].ToString();
                listing.description = reader["ListingDescription"].ToString();
                listing.date = Convert.ToDateTime(reader["PostingDate"].ToString());
                listing.author = reader["EmailAddress"].ToString();

                
            }
            while (reader.NextResult());
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string searchString = String.Format("SELECT * FROM Listings WHERE Title LIKE '%{0}%' OR BookName LIKE '%{0}%'", searchBox.Text);

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

        protected void listingLink_Click(object sender, EventArgs e)
        {

        }

        protected void titleButton_Click(object sender, EventArgs e)
        {
            //Session["ListingID"] = 
        }
    }
}