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
        private CloudStorageAccount storageAccount;

        private const string defaultProfileImage = "assets/defaultprofile.png";
        private const string emailDomain = "@conestogac.on.ca";

        protected void Page_Load(object sender, EventArgs e)
        {
            // set up a lot of cloud storage parameters/settings
            imageRootPath = ConfigurationManager.AppSettings["ImageRootPath"];
            containerName = ConfigurationManager.AppSettings["ImagesContainer"];
            blobStorageConnectionString = ConfigurationManager.ConnectionStrings["BlobStorageConnectionString"].ConnectionString;
            storageAccount = CloudStorageAccount.Parse(blobStorageConnectionString);
            blobClient = storageAccount.CreateCloudBlobClient();
            blobContainer = blobClient.GetContainerReference(containerName);

            // pull the default image from the image store
            CloudBlockBlob defaultImage = blobContainer.GetBlockBlobReference(defaultProfileImage);
            
            // set the default image
            profileImage.ImageUrl = defaultImage.Uri.ToString();
        }

        protected void cancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void uploadButton_Click(object sender, EventArgs e)
        {
            if (photoUpload.HasFile)
            {
                string fullFileName = photoUpload.PostedFile.FileName;
                string shortFileName = Path.GetFileName(fullFileName);

                blockBlob = blobContainer.GetBlockBlobReference(shortFileName + DateTime.Now);

                using (var fileStream = System.IO.File.OpenRead(fullFileName))
                {
                    blockBlob.UploadFromStream(fileStream);
                }

                profileImage.ImageUrl = blockBlob.Uri.ToString();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string password = passwordBox.Text;
            string email = emailBox.Text;
            string domainCheck;
            string hashedPassword;

            try
            {
                // validate that the email is only @conestogac.on.ca
                domainCheck = email.Substring(email.Length - 17, 17);

                if (domainCheck != emailDomain)
                {
                    throw new Exception("Email domain must only be @conestogac.on.ca");
                }

                connection = new SqlConnection(ConfigurationManager.ConnectionStrings["databaseConnection"].ToString());

                // hash the password
                hashedPassword = Crypto.HashPassword(password);

                // construct the SQL query
                string commandString = @"INSERT INTO Users VALUES('" +
                    emailBox.Text + "', '" +
                    nameBox.Text + "', '" +
                    profileImage.ImageUrl + "', '" +
                    hashedPassword + "', " +
                    "0)";

                SqlCommand command = new SqlCommand(commandString, connection);

                connection.Open();

                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                // display exception
                errorLabel.Text = ex.Message;
            }
        }
    }
}