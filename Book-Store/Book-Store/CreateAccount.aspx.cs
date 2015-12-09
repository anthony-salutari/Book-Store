using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_Store
{
    public partial class CreateAccount : System.Web.UI.Page
    {
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

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }
    }
}