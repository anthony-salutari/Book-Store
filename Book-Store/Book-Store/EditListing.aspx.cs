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
    public partial class EditListing : System.Web.UI.Page
    {
        private SqlConnection connection;
        private string listingID;

        protected void Page_Load(object sender, EventArgs e)
        {
            // get the listingID from the url
            listingID = Request.QueryString["ListingID"].ToString();
            string loadListingString = string.Format("SELECT * FROM Listings WHERE ListingID={0}", listingID);

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ConnectionString);

            if (!IsPostBack)
            {
                try
                {
                    SqlCommand loadListing = new SqlCommand(loadListingString, connection);
                    connection.Open();

                    SqlDataReader reader = loadListing.ExecuteReader(CommandBehavior.CloseConnection);
                    reader.Read();

                    // load up all the textboxes with the data
                    titleBox.Text = reader["Title"].ToString();
                    nameBox.Text = reader["BookName"].ToString();
                    conditionList.SelectedValue = reader["Condition"].ToString();
                    priceBox.Text = reader["Price"].ToString();
                    descriptionBox.Text = reader["ListingDescription"].ToString();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    errorLabel.Text = ex.Message;
                }
            }
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            // don't save changes and redirect back to the results screen
            Server.Transfer("ViewUserListings.aspx", false);
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string editListingString = string.Format("UPDATE Listings SET Title='{0}', BookName='{1}', Condition='{2}', Price='{3}', ListingDescription='{4}' WHERE ListingID={5}", titleBox.Text,
                nameBox.Text, conditionList.SelectedValue, priceBox.Text, descriptionBox.Text, listingID);

            try
            {
                SqlCommand editListing = new SqlCommand(editListingString, connection);
                connection.Open();

                int success = editListing.ExecuteNonQuery();

                connection.Close();

                if (success != 1)
                {
                    // edit failed, inform user
                    throw new Exception("Edit failed");
                }
                else if (success == 1)
                {
                    // redirect user back to the results screen
                    Server.Transfer("ViewUserListings.aspx", false);
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            string deleteListingString = string.Format("DELETE FROM Listings WHERE ListingID={0}", listingID);

            try
            {
                SqlCommand deleteListing = new SqlCommand(deleteListingString, connection);
                connection.Open();

                int success = deleteListing.ExecuteNonQuery();

                connection.Close();

                if (success != 1)
                {
                    // delete failed, inform user
                    throw new Exception("Failed to delete listing");
                }
                else if (success == 1)
                {
                    // delete successful redirect back to results screen
                    Server.Transfer("ViewUserListings.aspx", false);
                }
            }
            catch (Exception ex)
            {
                errorLabel.Text = ex.Message;
            }
        }
    }
}