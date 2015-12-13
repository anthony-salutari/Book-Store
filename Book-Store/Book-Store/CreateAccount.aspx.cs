using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Helpers;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.WindowsAzure.Storage;

namespace Book_Store
{
    public partial class CreateAccount : System.Web.UI.Page
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

            profileImage.ImageUrl = "Assets/defaultprofile.png";
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void uploadButton_Click(object sender, EventArgs e)
        {
            if (photoUpload.HasFile)
            {
                string fileName = photoUpload.PostedFile.FileName + DateTime.Now;
                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(blobStorageConnectionString);
                blobClient = storageAccount.CreateCloudBlobClient();
                blobContainer = blobClient.GetContainerReference(containerName);

                blockBlob = blobContainer.GetBlockBlobReference(fileName);

                using (var fileStream = System.IO.File.OpenRead(photoUpload.PostedFile.FileName))
                {
                    blockBlob.UploadFromStream(fileStream);
                }

                profileImage.ImageUrl = blockBlob.Uri.ToString();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string password = passwordBox.Text;
            string salt;
            string hashedPassword;

            try
            {
                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());

                // hash the password with some salt
                salt = Crypto.GenerateSalt();
                hashedPassword = Crypto.HashPassword(salt + password);

                // construct the SQL query
                string commandString = "INSERT INTO Users VALUES(" +
                    emailBox.Text + "," +
                    nameBox.Text + "," +
                    profileImage.ImageUrl + "," +
                    hashedPassword + "," +
                    "0)";

                SqlCommand command = new SqlCommand(commandString, connection);

                connection.Open();

                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // display exception
            }
        }
    }
}