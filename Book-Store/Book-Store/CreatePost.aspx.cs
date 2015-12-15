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
        private CloudStorageAccount storageAccount;

        private const string defaultImage = "assets/placeholder.jpg";

        protected void Page_Load(object sender, EventArgs e)
        {
            // check if user is logged in
            if (Session["LoggedIn"] != null)
            {
                // set up the cloud storage
                imageRootPath = ConfigurationManager.AppSettings["ImageRootPath"];
                containerName = ConfigurationManager.AppSettings["ImagesContainer"];
                blobStorageConnectionString = ConfigurationManager.ConnectionStrings["BlobStorageConnectionString"].ConnectionString;
                storageAccount = CloudStorageAccount.Parse(blobStorageConnectionString);
                blobClient = storageAccount.CreateCloudBlobClient();
                blobContainer = blobClient.GetContainerReference(containerName);

                CloudBlockBlob defaultImageBlob = blobContainer.GetBlockBlobReference(defaultImage);

                // set the default image
                if (!IsPostBack)
                {
                    coverPhoto.ImageUrl = defaultImageBlob.Uri.ToString();
                }
            }
            else
            {
                // user can't post, send them to login page
                Response.Redirect("Login.aspx");
            }
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
                  
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            // check if user is still logged in
            if (Session["LoggedIn"] != null)
            {
                try
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

                    string postString = string.Format("INSERT INTO Listings VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}')",
                        listing.title,
                        listing.bookName,
                        listing.coverImageURL,
                        listing.condition,
                        listing.price,
                        listing.description,
                        listing.date,
                        Session["EmailAddress"].ToString());

                    SqlCommand command = new SqlCommand(postString, connection);
                    connection.Open();

                    int confirmation = command.ExecuteNonQuery();

                    if (confirmation != 1)
                    {
                        // failed to add new listing
                        throw new Exception("Failed to add new listing");
                    }
                    else if (confirmation == 1)
                    {
                        // redirect the user back to home
                        Server.Transfer("default.aspx", false);
                    }
                }
                catch (Exception ex)
                {
                    errorLabel.Text = ex.Message;
                }
            }
            else
            {
                // user isn't logged in anymore redirect to login page
                Response.Redirect("Login.aspx");
            }
        }

        protected void uploadButton_Click(object sender, EventArgs e)
        {
            if (coverPhotoUpload.HasFile)
            {
                string fullFileName = coverPhotoUpload.PostedFile.FileName;
                string shortFileName = Path.GetFileName(fullFileName);

                blockBlob = blobContainer.GetBlockBlobReference(shortFileName + DateTime.Now);

                using (var fileStream = System.IO.File.OpenRead(fullFileName))
                {
                    blockBlob.UploadFromStream(fileStream);
                }

                coverPhoto.ImageUrl = blockBlob.Uri.ToString();
            }
        }
    }
}