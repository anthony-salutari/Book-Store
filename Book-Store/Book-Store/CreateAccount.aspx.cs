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

namespace Book_Store
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
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
                string path = Server.MapPath("Images/" + photoUpload.PostedFile.FileName);
                photoUpload.SaveAs(path);

                profileImage.ImageUrl = "Images/" + photoUpload.PostedFile.FileName;
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
                    hashedPassword + ")";

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