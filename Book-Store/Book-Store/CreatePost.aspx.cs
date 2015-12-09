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
    public partial class CreatePost : System.Web.UI.Page
    {
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            coverPhoto.ImageUrl = "Assets/placeholder.jpg";
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
            "Error",
            "alert('Are you sure you want to cancel this post?');",
            true);        
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            Listing listing = new Listing();

            listing.title = titleBox.Text;
            listing.bookName = bookNameBox.Text;
            listing.condition = conditionList.SelectedValue;
            listing.price = priceBox.Text;
            //listing.coverImage = bookImage.ImageUrl;
            listing.description = descriptionBox.Text;
            listing.date = DateTime.Now;

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());

            // insert into the listing table
            SqlCommand command = new SqlCommand("INSERT INTO Listings VALUES (" + listing.title + "," +
                listing.bookName + "," +
                listing.coverImage + "," +
                listing.condition + "," +
                listing.price + "," +
                listing.description + "," +
                listing.date + ","
                /* + user.email + ","*/);
        }

        protected void uploadButton_Click(object sender, EventArgs e)
        {
            if (coverPhotoUpload.HasFile)
            {
                string path = Server.MapPath("Images/" + coverPhotoUpload.PostedFile.FileName);
                coverPhotoUpload.SaveAs(path);

                coverPhoto.ImageUrl = "Images/" + coverPhotoUpload.PostedFile.FileName;
            }
        }
    }
}