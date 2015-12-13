using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Auth;
using Microsoft.WindowsAzure.Storage.Blob;

namespace Book_Store
{
    public partial class CreatePost : System.Web.UI.Page
    {
        private SqlConnection connection;
        
        // blob storage for images
        private string imageRootPath;
        private string containerName;
        private string blobStorageConnectionString;
        private CloudBlobClient blobClient;
        private CloudBlobContainer blobContainer;
        private CloudBlockBlob blockBlob;

        protected void Page_Load(object sender, EventArgs e)
        {
            imageRootPath = ConfigurationManager.AppSettings["ImageRootPath"];
            containerName = ConfigurationManager.AppSettings["ImagesContainer"];
            blobStorageConnectionString = ConfigurationManager.ConnectionStrings["BlobStorageConnectionString"].ConnectionString;

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
            listing.coverImageURL = coverPhoto.ImageUrl;
            listing.description = descriptionBox.Text;
            listing.date = DateTime.Now;

            connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());

            // insert into the listing table
            SqlCommand command = new SqlCommand("INSERT INTO Listings VALUES (" + listing.title + "," +
                listing.bookName + "," +
                listing.coverImageURL + "," +
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
                string fileName = coverPhotoUpload.PostedFile.FileName + DateTime.Now.ToString();
                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(blobStorageConnectionString);
                blobClient = storageAccount.CreateCloudBlobClient();
                blobContainer = blobClient.GetContainerReference(containerName);

                blockBlob = blobContainer.GetBlockBlobReference(fileName);

                using (var fileStream = System.IO.File.OpenRead(coverPhotoUpload.PostedFile.FileName))
                {
                    blockBlob.UploadFromStream(fileStream);
                }

                coverPhoto.ImageUrl = blockBlob.Uri.ToString();
            }
        }
    }
}