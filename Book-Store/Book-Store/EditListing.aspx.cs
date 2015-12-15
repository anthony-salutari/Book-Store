using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Store
{
    public partial class EditListing : System.Web.UI.Page
    {
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            // get the listingID from the url
            string listingID = Request.QueryString["ListingID"].ToString();
            string loadListingString = string.Format("SELECT * FROM Listings WHERE ListingID={0}", listingID);

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

            try
            {
                SqlCommand loadListing = new SqlCommand(loadListingString, connection);
                connection.Open();

            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }
    }
}