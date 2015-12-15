using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Store
{
    public partial class View_Listing : System.Web.UI.Page
    {
        SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {           
            // get the listing ID from the url
            string listingID = Request.QueryString["ListingID"];

            string loadListing = string.Format("SELECT * FROM Listings WHERE ListingID='{0}'", listingID);
            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

            try
            {
                SqlCommand command = new SqlCommand(loadListing, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
                reader.Read();

                // load up the fields with the returned data
                titleLabel.Text = reader["Title"].ToString();
                bookNameLabel.Text = reader["BookName"].ToString();
                dateLabel.Text = reader["PostingDate"].ToString();
                userLabel.Text = reader["EmailAddress"].ToString();
                coverImage.ImageUrl = reader["CoverImageURL"].ToString();
                conditionLabel.Text = reader["Condition"].ToString();
                priceLabel.Text = reader["Price"].ToString();
                descriptionLabel.Text = reader["ListingDescription"].ToString();
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }
    }
}